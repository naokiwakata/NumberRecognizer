import 'package:digit_recognition/controller/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view/home.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingStateProvider);
    return MaterialApp(
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          const HomePage(),
          if (isLoading)
            const ColoredBox(
              color: Colors.black26,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
