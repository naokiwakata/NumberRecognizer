import 'package:digit_recognition/controller/state_providers.dart';
import 'package:digit_recognition/extension/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/draw_controller.dart';
import 'number_card.dart';

// Widgetを画像に変換する用のGlobalKey
final widgetToImageKeyProvider = Provider(
  (_) => GlobalKey(),
);

/// スナックバー表示用のGlobalKey
final scaffoldMessengerKeyProvider = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawStateNotifier = ref.watch(drawStateNotifierProvider.notifier);
    final drawState = ref.watch(drawStateNotifierProvider);

    const textStyle = TextStyle(
      fontSize: 30,
    );
    const numberStyle = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
    );
    // ログイン結果をハンドリングする
    ref.handleAsyncValue<void>(
      recognizeStateProvider,
      completeMessage: '処理が完了しました！合ってるかな？',
      errorMessage: "エラー発生。通信失敗しちゃったみたい",
      complete: (context, _) async {
        // 処理完了後に任意の処理をする
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("数字を判定するで"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('あなだが書いた数字は', style: textStyle),
            Text(drawState.predictedNumber.toString(), style: numberStyle),
            const Text('でしょ？？そうだよね？？', style: textStyle),
            const SizedBox(height: 30),
            //
            const NumberCard(),
            //
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => drawStateNotifier.clear(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text('クリア'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => drawStateNotifier.recognizeNumber(),
                  child: const Text('判定'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
