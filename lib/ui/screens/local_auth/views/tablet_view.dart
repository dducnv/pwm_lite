import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class TabletView extends StatelessWidget {
  final LocalAuthViewModel viewModel;

  const TabletView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: viewModel.isVeryfiExportBackup
          ? AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getText(
                    context,
                    viewModel.isVeryfiExportBackup
                        ? LocalAuthLangDef.nhapMaPin
                        : viewModel.isPinFileImport
                            ? LocalAuthLangDef.nhapMaPinCuaFileSaoLuu
                            : LocalAuthLangDef.dangNhapVoiMaPin)
                .toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 430),
            child: AppPinCodeFields(
              autoFocus: viewModel.focusNode.hasFocus,
              key: viewModel.appPinCodeKey,
              formKey: viewModel.formKey,
              focusNode: viewModel.focusNode,
              onEnter: () {
                viewModel.onLogin();
              },
              validator: (value) {
                if (value!.length < 6) {
                  return getText(
                      context, LocalAuthLangDef.vuiLongNhapDayDuMaPin);
                }
                return null;
              },
              onCompleted: (value, state) {},
              onChanged: (value) {},
              textEditingController: viewModel.textEditingController,
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Container(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Row(
                //   children: [
                //     const Text("You forgot your pin? "),
                //     InkWell(
                //       borderRadius: BorderRadius.circular(5),
                //       onTap: () {},
                //       child: const Padding(
                //         padding: EdgeInsets.all(3.0),
                //         child: Text(
                //           "Reset",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                if (LocalAuthConfig.instance.isAvailableBiometrics &&
                    LocalAuthConfig.instance.isOpenUseBiometric &&
                    !viewModel.isPinFileImport)
                  IconButton(
                      onPressed: () {
                        viewModel.onBiometric();
                      },
                      icon: const Icon(Icons.fingerprint)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButtonWidget(
              borderRaidus: 100,
              width: 75.h,
              height: 75.h,
              onPressed: () {
                viewModel.onLogin();
              },
              text: "",
              child: Icon(
                Icons.arrow_forward,
                size: 24.sp,
              ))
        ],
      ),
    );
  }
}
