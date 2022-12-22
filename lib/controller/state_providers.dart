import 'dart:ffi';

import 'package:hooks_riverpod/hooks_riverpod.dart';

// 判別が上手くいってるかの状態を管理する StateProvider
final recognizeStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);

// ローディング状態を管理する StateProvider
final loadingStateProvider = StateProvider.autoDispose<bool>((_) => false);
