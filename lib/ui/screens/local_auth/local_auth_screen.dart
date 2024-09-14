import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/local_auth/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class LocalAuthScreen extends StatefulWidget {
  final bool? isVeryfiExportBackup;
  final Function()? onCallBack;
  final bool? isPinFileImport;
  final Function(TextEditingController controller,
      GlobalKey<AppPinCodeFieldsState> appPinCodeKey)? onCallBackWithPin;
  const LocalAuthScreen(
      {super.key,
      this.isVeryfiExportBackup,
      this.onCallBack,
      this.isPinFileImport,
      this.onCallBackWithPin});

  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LocalAuthViewModel>(onViewModelReady: (viewModel) {
      viewModel.init(
        isVeryfiExportBackup: widget.isVeryfiExportBackup,
        onCallBack: widget.onCallBack,
        isPinFileImport: widget.isPinFileImport,
        onCallBackWithPin: widget.onCallBackWithPin,
      );

      viewModel.focusNode.onKeyEvent = (node, event) {
        if (event.logicalKey == LogicalKeyboardKey.enter) {
          viewModel.onLogin();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      };

      FlutterNativeSplash.remove();
    }, builder: (context, viewModel, _) {
      return ResponsiveLayout(
        mobileBody: MobileView(
          viewModel: viewModel,
        ),
        tabletBody: TabletView(
          viewModel: viewModel,
        ),
        desktopBody: DesktopView(
          viewModel: viewModel,
        ),
      );
    });
  }
}
