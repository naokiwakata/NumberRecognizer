import 'package:digit_recognition/controller/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view/home.dart';

extension WidgetRefEx on WidgetRef {
  /// AsyncValueを良い感じにハンドリングする
  void handleAsyncValue<T>(ProviderListenable<AsyncValue<T>> asyncValueProvider,
          {void Function(BuildContext context, T data)? complete,
          String? completeMessage,
          String? errorMessage}) =>
      listen<AsyncValue<T>>(
        asyncValueProvider,
        (_, next) async {
          final loadingStateNotifier = watch(loadingStateProvider.notifier);
          if (next.isLoading) {
            loadingStateNotifier.update((state) => true);
            return;
          }

          next.when(
            data: (data) async {
              loadingStateNotifier.update((state) => false);

              // 完了メッセージがあればスナックバーを表示する
              if (completeMessage != null) {
                final messengerState =
                    read(scaffoldMessengerKeyProvider).currentState;
                messengerState?.showSnackBar(
                  SnackBar(
                    content: Text(completeMessage),
                  ),
                );
              }
            },
            error: (e, s) async {
              loadingStateNotifier.update((state) => false);

              // エラーメッセージがあればスナックバーを表示する
              if (errorMessage != null) {
                final messengerState =
                    read(scaffoldMessengerKeyProvider).currentState;
                messengerState?.showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                  ),
                );
              }
            },
            loading: (() => loadingStateNotifier.update((state) => true)),
          );
        },
      );
}
