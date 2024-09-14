import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

mixin HomeMixin {}

extension HomeExtension on HomeMixin {
  Future<void> bottomSheetSelectCategory({
    required BuildContext context,
    required HomeViewModel viewModel,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                          "${getText(context, HomeLangDifinition.doiDanhMuc)} (${viewModel.dataShared.categoriesList.value.length})"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            bottomSheetCreateCategory(
                                context: context, viewModel: viewModel);
                          },
                          icon: const Icon(Icons.add)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ValueListenableBuilder(
                    valueListenable: viewModel.dataShared.categoriesList,
                    builder: (context, cateList, child) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cateList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                viewModel.handleUpdateCategoryForAccount(
                                    cateList[index]);
                                Navigator.pop(context);
                              },
                              leading: Icon(
                                Icons.folder,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              title: Text(
                                "${cateList[index].categoryName} (${cateList[index].accounts.length})",
                              ),
                            );
                          },
                        ),
                      );
                    })
              ],
            ),
          );
        });
  }

  Future<void> bottomSheetCreateCategory({
    required BuildContext context,
    required HomeViewModel viewModel,
  }) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Builder(builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 185.h + MediaQuery.of(context).viewInsets.bottom,
            child: SingleChildScrollView(
              child: Column(children: [
                CustomTextField(
                    autoFocus: true,
                    requiredTextField: true,
                    titleTextField:
                        getText(context, HomeLangDifinition.tenDanhMuc),
                    controller: viewModel.txtCategoryName,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.start,
                    hintText:
                        getText(context, HomeLangDifinition.nhapTenDanhMuc),
                    maxLines: 1,
                    isObscure: false,
                    onFieldSubmitted: (value) {
                      viewModel.handleCreateCategory(
                        context: context,
                      );
                    }),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  margin: const EdgeInsets.all(0),
                  onPressed: () {
                    viewModel.handleCreateCategory(
                      context: context,
                    );
                  },
                  text: getText(context, HomeLangDifinition.taoDanhMuc),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        getText(context, HomeLangDifinition.taoDanhMuc),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        });
      },
      isScrollControlled: true,
    );
  }

  Future<void> bottomSheetOptionAccountItem({
    required BuildContext context,
    required HomeViewModel viewModel,
    required AccountOjbModel accountModel,
  }) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: viewModel.dataShared.accountSelected,
                  builder: (context, selectedAccounts, child) {
                    bool isSelected = selectedAccounts
                        .where((element) => element.id == accountModel.id)
                        .isNotEmpty;

                    return ListTile(
                      leading: isSelected
                          ? Icon(Icons.cancel_outlined, size: 24.sp)
                          : Icon(Icons.check_circle_outline_rounded,
                              size: 24.sp),
                      title: Text(
                        isSelected
                            ? getText(
                                context, HomeLangDifinition.boChonTaiKhoan)
                            : getText(context, HomeLangDifinition.chonTaiKhoan),
                        style: titleHomeOptiomItemStyle,
                      ),
                      onTap: () {
                        viewModel.handleSelectAccount(accountModel);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, size: 24.sp),
                  title: Text(
                    getText(context, HomeLangDifinition.chiTietTaiKhoan),
                    style: titleHomeOptiomItemStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutePaths.detailsAccountRoute,
                        arguments: {"id": accountModel.id}).then((value) {});
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit, size: 24.sp),
                  title: Text(
                    getText(context, HomeLangDifinition.suaTaiKhoan),
                    style: titleHomeOptiomItemStyle,
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                      showRequestUpdateVersionKey();
                      return;
                    }
                    dynamic statusUpdate = await Navigator.pushNamed(
                        context, RoutePaths.updateAccountRoute,
                        arguments: {"id": accountModel.id});
                    if (statusUpdate != null && statusUpdate == true) {
                      viewModel.handleFilterByCategory(
                          viewModel.categorySelected.value);

                      Future.delayed(const Duration(milliseconds: 100), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
                if (accountModel.email != null && accountModel.email != "")
                  ListTile(
                    leading: Icon(Icons.account_circle_rounded, size: 24.sp),
                    title: Text(
                      "${getText(context, HomeLangDifinition.saoChepUsername)}/Email",
                      style: titleHomeOptiomItemStyle,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      clipboardCustom(
                          context: context,
                          text: decryptInfo(accountModel.email ?? ""));
                    },
                  ),
                if (accountModel.password != null &&
                    accountModel.password != "")
                  ListTile(
                    leading: Icon(Icons.password, size: 24.sp),
                    title: Text(
                      getText(context, HomeLangDifinition.saoChepMatKhau),
                      style: titleHomeOptiomItemStyle,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      clipboardCustom(
                          context: context,
                          text: decryptPassword(accountModel.password ?? ""));
                    },
                  ),
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red, size: 24.sp),
                  title: Text(
                    getText(context, HomeLangDifinition.xoaTaiKhoan),
                    style: TextStyle(color: Colors.red, fontSize: 16.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          actionsPadding: const EdgeInsets.only(
                            bottom: 5,
                            right: 5,
                          ),
                          contentPadding: const EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          content: Text(
                            getText(
                                context,
                                DetailsAccountLangDef
                                    .banCoChacChanMuonXoaTaiKhoanNay),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                getText(context, DetailsAccountLangDef.dong),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                viewModel.handleDeleteAccount(
                                  context: context,
                                  accountModel: accountModel,
                                );
                                // ignore: use_build_context_synchronously
                              },
                              child: Text(
                                getText(
                                  context,
                                  DetailsAccountLangDef.xoaTaiKhoan,
                                ),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> searchBottomSheet({
    required BuildContext context,
    required HomeViewModel viewModel,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        bool isDarkMode =
            Provider.of<RootPR>(context, listen: false).themeMode ==
                ThemeMode.dark;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    titleTextField:
                        getText(context, HomeLangDifinition.timKiem),
                    hintText: getText(context, HomeLangDifinition.hintSearch),
                    controller: viewModel.txtSearchKey,
                    autoFocus: true,
                    textInputAction: TextInputAction.search,
                    textAlign: TextAlign.start,
                    onChanged: (p0) {
                      //bouce search
                      if (p0.isEmpty) {
                        viewModel.accountList.value.clear();
                        return;
                      }
                      viewModel.handleSearchAccount();
                    },
                  )),
              const SizedBox(height: 20),
              DoubleValueListenBuilder(
                viewModel.isSearch,
                viewModel.accountList,
                builder: (context, isSearch, accountList, child) {
                  if (isSearch) {
                    return const Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else {
                    return accountList.isEmpty ||
                            viewModel.txtSearchKey.text == ""
                        ? Expanded(
                            child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Image.asset(
                                "assets/images/exclamation-mark.png",
                                width: 60.w,
                                height: 60.h,
                              ),
                            ],
                          ))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: accountList.length,
                              itemBuilder: (context, index) {
                                AccountOjbModel account = accountList[index];
                                return ListTile(
                                  leading: Container(
                                    width: 50.h,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: account.icon == "default" ||
                                              account.icon == null ||
                                              allBranchLogos
                                                      .firstWhere((element) =>
                                                          element
                                                              .branchLogoSlug ==
                                                          account.icon)
                                                      .branchName ==
                                                  null
                                          ? Text(
                                              decryptInfo(account.title)[0]
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                              ))
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                width: 50.w,
                                                height: 50.h,
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
                                              ),
                                            ),
                                    ),
                                  ),
                                  title: Text(
                                    decryptInfo(account.title),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle:
                                      Text(decryptInfo(account.email ?? ""),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutePaths.detailsAccountRoute,
                                        arguments: {"id": account.id});
                                  },
                                );
                              },
                            ),
                          );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
