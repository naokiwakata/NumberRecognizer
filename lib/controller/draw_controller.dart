import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/draw_state.dart';
import '../model/line.dart';

final drawStateNotifierProvider =
    StateNotifierProvider<DrawStateNotifier, DrawState>(
  (ref) => DrawStateNotifier(),
);

class DrawStateNotifier extends StateNotifier<DrawState> {
  DrawStateNotifier() : super(DrawState());

  // 数字をクリアする
  void clear() {
    // 全ての要素を空にする
    if (!state.isDrag) {
      state = state.copyWith(lineList: [], undoList: []);
    }
  }

  // ペイント開始
  void addPaint(Offset startPoint) {
    if (!state.isDrag) {
      final startLine = Line(offsetList: [startPoint]);
      state = state.copyWith(
        isDrag: true, // 描画中に変更
        lineList: List.of(state.lineList)..add(startLine), // 新たに開始地点を追加
        undoList: const [], // 一つ進めるものがないはずなので空に(redoできないように)
      );
    }
  }

  // ペイント中
  void updatePaint(Offset nextPoint) {
    // 最後の要素に進んだポジションを追加
    if (state.isDrag) {
      // 現在のラインリスト
      final lineList = List<Line>.of(state.lineList);
      // 最後尾のラインのオフセットのリスト
      final lastLinesOffsetList = state.lineList.last.offsetList;
      // 上のオフセットリストのケツに新たなオフセットを追加
      final newOffsetList = List<Offset>.of(lastLinesOffsetList)
        ..add(nextPoint);
      // 最後尾のLineを再構成
      final newLastLine = Line(offsetList: newOffsetList);
      // 最後尾のLineを更新する
      lineList.last = newLastLine;
      // stateを更新
      state = state.copyWith(lineList: lineList);
    }
  }

  // 描画終了
  void endPaint() => state = state.copyWith(isDrag: false);

  // Widgetを画像化
  Future<Uint8List?> widgetToImage(GlobalKey globalKey) async {
    final boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return null;
    }
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final bytes = byteData?.buffer.asUint8List();
    return bytes;
  }

  // 画像をPython側に送り数字を判別
  Future<void> recognizeNumber(GlobalKey globalKey) async {
    final img = await widgetToImage(globalKey);
    if (img != null) {
      final base64Image = base64Encode(img.toList());
      final url = Uri.parse('http://127.0.0.1:5000/recognize_number');
      final headers = {'content-type': 'application/json'};

      int number = 1;

      final body = json.encode({
        'post_img': base64Image,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final predictedNumber = data['result'];
        state = state.copyWith(predictedNumber: predictedNumber);
        print('予測結果は $predictedNumber} じゃけえ');
      } else {
        print(response.statusCode);
      }
    }
  }
}
