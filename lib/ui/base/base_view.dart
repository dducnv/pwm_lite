import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cyber_safe/main.dart';
import 'package:cyber_safe/ui/base.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final void Function(T) onViewModelReady;

  const BaseView(
      {super.key, required this.builder, required this.onViewModelReady});

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState<T>();
  }
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = locator.get<T>();

  @override
  void initState() {
    super.initState();
    viewModel.widgetState = this;
    widget.onViewModelReady(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<T>(
          builder: widget.builder,
        ));
  }
}
