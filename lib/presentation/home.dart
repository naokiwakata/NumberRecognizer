import 'package:digit_recognition/presentation/number_card.dart';
import 'package:flutter/material.dart';

const _textStyle = TextStyle(
  fontSize: 20,
);
const _figureStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Text('だろ？なあ！！', style: _textStyle),
            const SizedBox(height: 10),
            //
            const NumberCard(),
            //
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('判定'),
            )
          ],
        ),
      ),
    );
  }
}
