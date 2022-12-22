import 'package:hooks_riverpod/hooks_riverpod.dart';

// 判別が上手くいってるかの状態
final recognizeStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);
