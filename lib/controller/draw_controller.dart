import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/draw_state.dart';
import '../entity/line.dart';

final drawStateNotifierProvider =
    StateNotifierProvider<DrawStateNotifier, DrawState>(
  (ref) => DrawStateNotifier(),
);

class DrawStateNotifier extends StateNotifier<DrawState> {
  DrawStateNotifier() : super(DrawState());

  void undo() {
    // ひとつ戻る
    if (state.isDrag) {
      return;
    }
  }

  void redo() {
    // ひとつ進む
  }

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
}
