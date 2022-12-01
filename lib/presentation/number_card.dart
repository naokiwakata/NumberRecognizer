import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/draw_controller.dart';
import 'signature.dart';

class NumberCard extends ConsumerWidget {
  const NumberCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drawStateNotifierProvider);
    final notifier = ref.watch(drawStateNotifierProvider.notifier);

    return SizedBox(
      width: 300,
      height: 500,
      child: GestureDetector(
        onPanStart: (details) {
          notifier.addPaint(details.localPosition);
        },
        onPanUpdate: (details) {
          notifier.updatePaint(details.localPosition);
        },
        onPanEnd: (details) {
          notifier.endPaint();
        },
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: CustomPaint(painter: Signature(state, context)),
        ),
      ),
    );
  }
}
