import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/draw_controller.dart';
import 'number_card.dart';

// Widgetを画像に変換する用のGlobalKey
final widgetToImageKeyProvider = Provider(
  (_) => GlobalKey(),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = ref.watch(widgetToImageKeyProvider);
    final notifier = ref.watch(drawStateNotifierProvider.notifier);
    final state = ref.watch(drawStateNotifierProvider);

    const textStyle = TextStyle(
      fontSize: 30,
    );
    const numberStyle = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("数字を判定するで"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('おめえが書いた数字は', style: textStyle),
            Text(state.predictedNumber.toString(), style: numberStyle),
            const Text('だろ？', style: textStyle),
            const SizedBox(height: 30),
            //
            const NumberCard(),
            //
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => notifier.clear(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text('クリア'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => notifier.recognizeNumber(),
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
