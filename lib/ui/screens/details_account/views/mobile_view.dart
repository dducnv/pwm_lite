import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider/root_provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/details_account/extensions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MobileView extends StatefulWidget {
  final DetailsAccountViewModel viewModel;

  const MobileView({
    super.key,
    required this.viewModel,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with AccountDetailsMixin {
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Provider.of<RootPR>(context, listen: false).themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppbarCustom(
          title: "",
          onPressBack: () {
            Navigator.pop(context);
          },
          actions: [
            IconButton(
                onPressed: () {
                  optionBottomSheet(context, viewModel: widget.viewModel);
                },
                icon: Icon(
                  Icons.more_vert_rounded,
                  size: 21.sp,
                )),
          ]),
      body: DoubleValueListenBuilder(
        widget.viewModel.account,
        widget.viewModel.isLoadding,
        builder: (context, account, isLoading, child) {
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: account.icon == "default" ||
                                          account.icon == null ||
                                          account.icon == "" ||
                                          allBranchLogos
                                                  .firstWhere((element) =>
                                                      element.branchLogoSlug ==
                                                      account.icon)
                                                  .branchName ==
                                              null
                                      ? Text(
                                          account.title != ""
                                              ? decryptInfo(account.title)[0]
                                                  .toUpperCase()
                                              : "",
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 70.w,
                                            height: 70.h,
                                            child: SvgPicture.asset(
                                              isDarkMode
                                                  ? allBranchLogos
                                                      .firstWhere((element) =>
                                                          element
                                                              .branchLogoSlug ==
                                                          account.icon)
                                                      .branchLogoPathDarkMode!
                                                  : allBranchLogos
                                                      .firstWhere((element) =>
                                                          element
                                                              .branchLogoSlug ==
                                                          account.icon)
                                                      .branchLogoPathLightMode!,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                decryptInfo(account.title),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (account.totp.target != null &&
                            account.totp.target?.secretKey != null)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getText(
                                  context,
                                  DetailsAccountLangDef.maXacThucTOTP,
                                ),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const SizedBox(height: 5),
                              CardCustomWidget(
                                child: OtpTextWithCountdown(
                                  keySecret: decryptTOTPKey(
                                      account.totp.target!.secretKey),
                                ),
                              ),
                            ],
                          ),
                        Visibility(
                            visible: account.email != null &&
                                account.email != "" &&
                                account.password != null &&
                                account.email != "",
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  getText(
                                    context,
                                    DetailsAccountLangDef.thongTinTaiKhoan,
                                  ),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Visibility(
                                  visible: account.email != "" ||
                                      account.password != "",
                                  child: CardCustomWidget(
                                    child: Column(
                                      children: [
                                        Visibility(
                                          visible: account.email!.isNotEmpty,
                                          child: ItemCoppyValue(
                                            title: getText(
                                                context,
                                                CreateAccountLangDif
                                                    .tenDangNhap),
                                            value: account.email != "" ||
                                                    account.email != null
                                                ? decryptInfo(account.email!)
                                                : "",
                                            isLastItem:
                                                account.password!.isEmpty,
                                          ),
                                        ),
                                        if (account.email != null &&
                                            account.email != "" &&
                                            account.password != null &&
                                            account.password != "")
                                          const SizedBox(height: 10),
                                        Visibility(
                                          visible: account.password!.isNotEmpty,
                                          child: Column(
                                            children: [
                                              ItemCoppyValue(
                                                title: getText(
                                                    context,
                                                    DetailsAccountLangDef
                                                        .matKhau),
                                                value: account.password ?? "",
                                                isLastItem: true,
                                                isPrivateValue: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 10),
                        Text(
                          getText(context, DetailsAccountLangDef.danhMuc),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 5),
                        CardCustomWidget(
                          child: Row(
                            children: [
                              Icon(
                                Icons.folder,
                                color: Theme.of(context).colorScheme.primary,
                                size: 24.sp,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                account.category.target?.categoryName ?? "",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (widget.viewModel.txtNote.text.isNotEmpty)
                          Column(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: widget.viewModel.isEditNote,
                                builder: (_, value, child) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getText(
                                              context,
                                              DetailsAccountLangDef.ghiChu,
                                            ),
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          CustomButtonWidget(
                                            border: value
                                                ? Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  )
                                                : null,
                                            borderRadiusGeometry:
                                                BorderRadius.circular(50),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            padding: const EdgeInsets.all(0),
                                            text: getText(
                                              context,
                                              value
                                                  ? DetailsAccountLangDef.luu
                                                  : DetailsAccountLangDef.sua,
                                            ),
                                            miniumSize: Size(50.w, 15.h),
                                            onPressed: () {
                                              widget.viewModel
                                                  .handleUpdateNote();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 3,
                                              ),
                                              child: Text(
                                                value
                                                    ? getText(
                                                        context,
                                                        DetailsAccountLangDef
                                                            .luu,
                                                      )
                                                    : getText(
                                                        context,
                                                        DetailsAccountLangDef
                                                            .sua,
                                                      ),
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<RootPR>(
                                                                  context,
                                                                  listen: true)
                                                              .themeMode ==
                                                          ThemeMode.light
                                                      ? Colors.grey[700]
                                                      : Colors.grey[400],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      CustomTextField(
                                        borderRadius: BorderRadius.circular(25),
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        readOnly: !value,
                                        autoFocus: true,
                                        borderColor: value
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerHighest,
                                        requiredTextField: false,
                                        textInputType: TextInputType.multiline,
                                        textInputAction:
                                            TextInputAction.newline,
                                        textAlign: TextAlign.start,
                                        minLines: 1,
                                        maxLines: null,
                                        isObscure: false,
                                        controller: widget.viewModel.txtNote,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        if (account.customFields.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getText(
                                  context,
                                  DetailsAccountLangDef.thongTinTuyChinh,
                                ),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const SizedBox(height: 5),
                              CardCustomWidget(
                                child: Column(
                                  children: [
                                    ...account.customFields.map(
                                      (element) => ItemCoppyValue(
                                        title: element.hintText,
                                        value: element.typeField
                                                .toLowerCase()
                                                .contains("password")
                                            ? element.value
                                            : decryptInfo(element.value),
                                        isPrivateValue: element.typeField
                                            .toLowerCase()
                                            .contains("password"),
                                        isLastItem: account.customFields.last ==
                                            element,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${getText(context, DetailsAccountLangDef.capNhatVao)}: ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800],
                                ),
                              ),
                              TextSpan(
                                text: account.updatedAtFromat,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Visibility(
                          visible: account.passwordUpdatedAt != null &&
                              account.passwordHistories.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "${getText(context, DetailsAccountLangDef.capNhatMatKhauLanCuoi)}: ",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    TextSpan(
                                      text: account.passwordUpdatedAtFromat,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${getText(
                                            context,
                                            DetailsAccountLangDef.lichSuMatKhau,
                                          )}: ",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${account.passwordHistories.length}",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return LocalAuthScreen(
                                            isVeryfiExportBackup: true,
                                            onCallBack: () {
                                              Navigator.pop(context);
                                              bottomSheetPasswordHistory(
                                                  context: context,
                                                  accountOjbModel: account);
                                            },
                                          );
                                        }),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      child: Text(
                                        getText(
                                          context,
                                          DetailsAccountLangDef.chiTiet,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
