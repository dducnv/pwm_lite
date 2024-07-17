import 'package:flutter/material.dart';

class CardCustomWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  const CardCustomWidget(
      {super.key, required this.child, this.padding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          border:
              Border.all(color: Theme.of(context).colorScheme.surfaceVariant),
          borderRadius: BorderRadius.circular(borderRadius ?? 25)),
      child: child,
    );
  }
}
