import 'package:digit_recognition/presentation/number_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/draw_controller.dart';

const _textStyle = TextStyle(
  fontSize: 30,
);
const _figureStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = GlobalKey();
    final notifier = ref.watch(drawStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("数字を判定するで"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('あなたが書いた数字は', style: _textStyle),
            const Text('9', style: _figureStyle),
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
                  onPressed: () => notifier.widgetToImage(globalKey),
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
