import 'package:cyber_safe/core/services.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/create_account/widgets.dart';
import 'package:cyber_safe/ui/screens/update_account/extensions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:provider/provider.dart';

class MobileView extends StatefulWidget {
  final UpdateAccountViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with UpdateAccountMixin {
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  void dispose() {
    focus.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: DoubleValueListenBuilder(
          widget.viewModel.isEnterOTPFromKeyboard,
          widget.viewModel.keyAuthentication,
          builder: (context, isEnterOTPFromKeyboard, keyAuthentication, child) {
            return Visibility(
              visible: !isEnterOTPFromKeyboard || keyAuthentication.isNotEmpty,
              child: FloatingActionButton(
                onPressed: () async {
                  await widget.viewModel.handleUpdateAccount(context);
                },
                child: const Icon(Icons.check),
              ),
            );
          },
        ),
        appBar: AppbarCustom(
          title: getText(context, CreateAccountLangDif.capNhatTaiKhoan),
          onPressBack: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: widget.viewModel.branchLogoSelected,
                      builder: (context, value, child) {
                        bool isDarkMode =
                            Provider.of<RootPR>(context, listen: false)
                                    .themeMode ==
                                ThemeMode.dark;

                        return Container(
                          width: 70.w,
                          height: 70.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              selectIconBottomSheet(context, widget.viewModel);
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: value.branchLogoSlug == "default"
                                  ? Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      isDarkMode
                                          ? value.branchLogoPathDarkMode!
                                          : value.branchLogoPathLightMode!,
                                    ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      selectIconBottomSheet(context, widget.viewModel);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        getText(context, CreateAccountLangDif.chonIcon),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder(
                    valueListenable: widget.viewModel.isRequiredAppName,
                    builder: (_, value, child) {
                      return CustomTextField(
                        requiredTextField: true,
                        autoFocus: false,
                        titleTextField:
                            getText(context, CreateAccountLangDif.tenUngdung),
                        controller: widget.viewModel.txtAppName,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {
                            widget.viewModel.isRequiredAppName.value = false;

                            //bounce

                            void bounce() {
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                for (var icon in allBranchLogos) {
                                  final pattern = icon.keyWords!
                                      .map((k) => RegExp.escape(k))
                                      .join('|');
                                  final regex =
                                      RegExp(pattern, caseSensitive: false);
                                  if (regex.hasMatch(p0)) {
                                    widget.viewModel.branchLogoSelected.value =
                                        icon;
                                    break;
                                  }
                                }
                              });
                            }

                            bounce();
                          } else {
                            widget.viewModel.isRequiredAppName.value = true;
                          }
                        },
                        hintText:
                            getText(context, CreateAccountLangDif.tenUngdung),
                        maxLines: 1,
                        isObscure: false,
                        textError: value
                            ? getText(context,
                                CreateAccountLangDif.vuiLongNhapTenUngDung)
                            : null,
                        focusNode: focus,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AutofillGroup(
                    child: Column(
                      children: [
                        CustomTextField(
                          requiredTextField: false,
                          titleTextField: getText(
                              context, CreateAccountLangDif.tenDangNhap),
                          controller: widget.viewModel.txtUsername,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          hintText: getText(
                              context, CreateAccountLangDif.tenDangNhap),
                          maxLines: 1,
                          isObscure: false,
                          autofillHints: const [
                            AutofillHints.username,
                          ],
                          focusNode: focus,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                getText(context, CreateAccountLangDif.matKhau),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800]),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    requiredTextField: false,
                                    controller: widget.viewModel.txtPassword,
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.start,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    hintText: getText(
                                        context, CreateAccountLangDif.matKhau),
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    isObscure: true,
                                    maxLines: 1,
                                    focusNode: focus,
                                    onChanged: (value) {
                                      widget.viewModel.passNotifier.value =
                                          PasswordStrength.calculate(
                                              text: value);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(25.w, 25.h))),
                                  onPressed: () {
                                    if (widget.viewModel.txtPassword.text
                                        .isNotEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              actionsPadding:
                                                  const EdgeInsets.only(
                                                bottom: 2,
                                                right: 5,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 16,
                                                left: 16,
                                                right: 16,
                                              ),
                                              content: Text(
                                                  getText(
                                                      context,
                                                      CreateAccountLangDif
                                                          .banCoMuonMatKhauMoiGhiDeLenMatKhauCu),
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  )),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      getText(
                                                          context,
                                                          CreateAccountLangDif
                                                              .dong),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                      )),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    _toGenPass();
                                                  },
                                                  child: Text(
                                                      getText(
                                                          context,
                                                          CreateAccountLangDif
                                                              .dongY),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                      )),
                                                )
                                              ],
                                            );
                                          });
                                    } else {
                                      _toGenPass();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.loop_rounded,
                                    size: 24.sp,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PasswordStrengthChecker(
                              strength: widget.viewModel.passNotifier,
                              configuration:
                                  PasswordStrengthCheckerConfiguration(
                                      borderWidth: 1,
                                      height: 12.h,
                                      inactiveBorderColor: Theme.of(context)
                                          .colorScheme
                                          .surfaceVariant,
                                      showStatusWidget: false),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DoubleValueListenBuilder(
                      widget.viewModel.isRequiredSelectCategory,
                      widget.viewModel.categorySelected, builder: (context,
                          isRequiredSelectCategory, categorySelected, child) {
                    return CustomTextField(
                      requiredTextField: true,
                      readOnly: true,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24.sp,
                        ),
                      ),
                      titleTextField:
                          getText(context, CreateAccountLangDif.chonDanhMuc),
                      controller: TextEditingController(),
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      hintText: categorySelected.categoryName,
                      maxLines: 1,
                      isObscure: false,
                      textError: isRequiredSelectCategory
                          ? getText(
                              context, CreateAccountLangDif.vuiLongChonDanhMuc)
                          : null,
                      onTap: () {
                        bottomSheetSelectCategory(
                            viewModel: widget.viewModel, context: context);
                      },
                      focusNode: focus,
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  DoubleValueListenBuilder<bool, String>(
                    widget.viewModel.isEnterOTPFromKeyboard,
                    widget.viewModel.keyAuthentication,
                    builder:
                        (_, isEnterOTPFromKeyboard, keyAuthentication, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Text(
                              getText(context,
                                  CreateAccountLangDif.khoaXacThucHaiLop),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800]),
                            ),
                          ),
                          widget.viewModel.keyAuthentication.value.isNotEmpty
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: CardCustomWidget(
                                        child: OtpTextWithCountdown(
                                          keySecret: keyAuthentication,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        widget.viewModel.handleClearKeyAuth();
                                      },
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                        size: 24.sp,
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: isEnterOTPFromKeyboard
                                          ? CustomTextField(
                                              requiredTextField: true,
                                              controller:
                                                  widget.viewModel.txtKeySetOTP,
                                              textInputAction:
                                                  TextInputAction.done,
                                              textAlign: TextAlign.start,
                                              onFieldSubmitted: (value) {
                                                _handleAddOtpKey(widget
                                                    .viewModel
                                                    .txtKeySetOTP
                                                    .text);
                                              },
                                              autoFocus: true,
                                              hintText: getText(
                                                  context,
                                                  CreateAccountLangDif
                                                      .nhapKhoaXacThucTOTP),
                                              isObscure: false,
                                              maxLines: 1,
                                              focusNode: focus,
                                            )
                                          : CustomButtonWidget(
                                              margin: const EdgeInsets.all(0),
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surfaceVariant),
                                              onPressed: () async {
                                                final uri = await Navigator.of(
                                                        context)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            const QrcodeScaner()));
                                                if (uri != null) {
                                                  var otpCustom =
                                                      OTPCustom.fromUri(
                                                              uri.toString())
                                                          .toJson();

                                                  widget.viewModel
                                                      .handleShowTextFieldEnterOTP();
                                                  widget.viewModel.txtKeySetOTP
                                                          .text =
                                                      otpCustom['secret'];
                                                  widget
                                                          .viewModel
                                                          .keyAuthentication
                                                          .value =
                                                      otpCustom['secret'];

                                                  widget.viewModel.txtAppName
                                                          .text =
                                                      otpCustom['issuer'];

                                                  widget.viewModel.txtUsername
                                                          .text =
                                                      otpCustom['accountName'];

                                                  for (var icon
                                                      in allBranchLogos) {
                                                    final pattern = icon
                                                        .keyWords!
                                                        .map((k) =>
                                                            RegExp.escape(k))
                                                        .join('|');
                                                    final regex = RegExp(
                                                        pattern,
                                                        caseSensitive: false);
                                                    if (regex.hasMatch(
                                                        otpCustom['issuer'])) {
                                                      widget
                                                          .viewModel
                                                          .branchLogoSelected
                                                          .value = icon;
                                                      break;
                                                    }
                                                  }
                                                }
                                              },
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer,
                                              text: "",
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                      Icons
                                                          .qr_code_scanner_rounded,
                                                      size: 24.sp,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    getText(
                                                        context,
                                                        CreateAccountLangDif
                                                            .themKhoaXacThucHaiLop),
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          widget.viewModel
                                              .handleShowTextFieldEnterOTP();
                                        },
                                        icon: Icon(
                                          isEnterOTPFromKeyboard == true
                                              ? Icons.cancel_outlined
                                              : Icons.keyboard_alt_outlined,
                                          size: 24.sp,
                                        )),
                                  ],
                                ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    requiredTextField: false,
                    titleTextField:
                        getText(context, CreateAccountLangDif.ghiChu),
                    textInputType: TextInputType.multiline,
                    controller: widget.viewModel.txtNote,
                    textInputAction: TextInputAction.newline,
                    textAlign: TextAlign.start,
                    hintText: getText(context, CreateAccountLangDif.ghiChu),
                    minLines: 1,
                    maxLines: null,
                    isObscure: false,
                    focusNode: focus,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder(
                      valueListenable:
                          widget.viewModel.dynamicTextFieldNotifier,
                      builder: (context, value, child) {
                        return Column(
                          children: List.generate(value.length, (index) {
                            return value[index].field;
                          }),
                        );
                      }),
                  CustomButtonWidget(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.surfaceVariant),
                    onPressed: () {
                      bottomSheetAddCustomField(
                        context,
                        controller: widget.viewModel.txtFieldTitle,
                        viewModel: widget.viewModel,
                        onAddField: () {
                          widget.viewModel.handleAddField();
                        },
                        typeTextFields: widget.viewModel.typeTextFields,
                        typeTextFieldSelected:
                            widget.viewModel.typeTextFieldSelected,
                      );
                    },
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    margin: const EdgeInsets.only(top: 16),
                    text: "",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24.sp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          getText(context, CreateAccountLangDif.themTruong),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _handleAddOtpKey(String value) {
    final trimKey = value.replaceAll(" ", "").replaceAll("-", "").trim();
    if (OTPCustom.isKeyValid(trimKey) == false) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(getText(context, CreateAccountLangDif.thongBao)),
                content:
                    Text(getText(context, CreateAccountLangDif.keyKhongHopLe)),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ));
      return;
    } else {
      widget.viewModel.keyAuthentication.value = trimKey;
    }
  }

  Future<void> _toGenPass() {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PassGenScreen(
            isFromForm: true,
            onPasswordChanged: (password) {
              widget.viewModel.txtPassword.text = password;
              widget.viewModel.passNotifier.value =
                  PasswordStrength.calculate(text: password);
            },
          );
        },
      ),
    );
  }
}
