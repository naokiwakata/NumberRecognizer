import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/draw_controller.dart';
import 'number_card.dart';

const _textStyle = TextStyle(
  fontSize: 30,
);
const _numberStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = GlobalKey();
    final notifier = ref.watch(drawStateNotifierProvider.notifier);
    final state = ref.watch(drawStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("数字を判定するで"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('おめえが書いた数字は', style: _textStyle),
            Text(state.predictedNumber.toString(), style: _numberStyle),
            const Text('だろ？', style: _textStyle),
            const SizedBox(height: 30),
            //
            NumberCard(globalKey: globalKey),
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
                  onPressed: () => notifier.recognizeNumber(globalKey),
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
