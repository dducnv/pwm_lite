import 'package:flutter/material.dart';

class DoubleValueListenBuilder<A, B> extends StatelessWidget {
  const DoubleValueListenBuilder(
    this.first,
    this.second, {
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueNotifier<A> first;
  final ValueNotifier<B> second;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (context, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
