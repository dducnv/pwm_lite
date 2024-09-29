import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileView extends StatelessWidget {
  final LocalAuthViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  // snackBar Widget
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
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppPinCodeFields(
            autoFocus: viewModel.focusNode.hasFocus,
            key: viewModel.appPinCodeKey,
            formKey: viewModel.formKey,
            focusNode: viewModel.focusNode,
            validator: (value) {
              if (value!.length < 6) {
                return getText(context, LocalAuthLangDef.vuiLongNhapDayDuMaPin);
              }
              return null;
            },
            onCompleted: (value, state) {},
            onEnter: () {
              viewModel.onLogin();
            },
            onChanged: (value) {},
            textEditingController: viewModel.textEditingController,
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
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
          SizedBox(
            height: 20.h,
          ),
          CustomButtonWidget(
              borderRaidus: 100,
              width: 75.w,
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
