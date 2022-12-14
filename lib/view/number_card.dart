import 'package:digit_recognition/view/home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/draw_controller.dart';
import 'signature.dart';

class NumberCard extends ConsumerWidget {
  const NumberCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drawStateNotifierProvider);
    final notifier = ref.watch(drawStateNotifierProvider.notifier);
    const width = 380.0;
    const height = 380.0;

    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onPanStart: (details) {
          notifier.addPaint(details.localPosition);
        },
        onPanUpdate: (details) {
          notifier.updatePaint(
            getPosition(
              width,
              height,
              details.localPosition,
            ),
          );
        },
        onPanEnd: (details) {
          notifier.endPaint();
        },
        // Widget画像化の記事（https://zenn.dev/pressedkonbu/books/flutter-reverse-lookup-dictionary/viewer/011-widget-to-image）
        child: RepaintBoundary(
          key: ref.watch(widgetToImageKeyProvider),
          child: Card(
            elevation: 10,
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: CustomPaint(painter: Signature(state, context)),
          ),
        ),
      ),
    );
  }
}

// ポジションの取得
Offset getPosition(double width, double height, Offset localPosition) {
  double dx;
  double dy;
  if (localPosition.dx < 0) {
    dx = 0;
  } else if (localPosition.dx > width) {
    dx = width;
  } else {
    dx = localPosition.dx;
  }
  if (localPosition.dy < 0) {
    dy = 0;
  } else if (localPosition.dy > height) {
    dy = height;
  } else {
    dy = localPosition.dy;
  }
  return Offset(dx, dy);
}
