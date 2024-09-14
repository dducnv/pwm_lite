import 'package:flutter/material.dart';

class ModalProgressHUD extends StatefulWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const ModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.0,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  });

  @override
  State<ModalProgressHUD> createState() => _ModalProgressHUDState();
}

class _ModalProgressHUDState extends State<ModalProgressHUD> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(widget.child);
    if (widget.inAsyncCall) {
      Widget layOutProgressIndicator;
      if (widget.offset == null) {
        layOutProgressIndicator = Center(child: widget.progressIndicator);
      } else {
        layOutProgressIndicator = Positioned(
          left: widget.offset!.dx,
          top: widget.offset!.dy,
          child: widget.progressIndicator,
        );
      }
      final modal = [
        Opacity(
          opacity: widget.opacity,
          child: ModalBarrier(
              dismissible: widget.dismissible, color: widget.color),
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return Stack(
      children: widgetList,
    );
  }
}
