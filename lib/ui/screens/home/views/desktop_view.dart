import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/screens/home/extensions.dart';
import 'package:cyber_safe/ui/screens/home/widgets.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DesktopView extends StatefulWidget {
  final HomeViewModel viewModel;
  const DesktopView({super.key, required this.viewModel});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> with HomeMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ItemScrollController itemScrollController = ItemScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbarCustom(
        scaffoldKey: _scaffoldKey,
        viewModel: widget.viewModel,
        isDesktop: true,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: SizedBox(
        width: 65.h,
        height: 65.h,
        child: FittedBox(
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () async {
              if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                showRequestUpdateVersionKey();
                return;
              }
              dynamic isPop = await Navigator.of(context)
                  .pushNamed(RoutePaths.createAccountRoute, arguments: {
                "categoryModel": widget.viewModel.categorySelected.value
              });
              if (isPop == null) {
                return;
              }
              Future.delayed(const Duration(milliseconds: 300), () {
                itemScrollController.scrollTo(
                    alignment: -0.2,
                    index: widget.viewModel.dataShared.categoriesList.value
                        .indexWhere(
                            (element) => element.id == isPop['category'].id),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
                widget.viewModel.handleFilterByCategory(isPop['category']);
              });
            },
            child: Icon(
              Icons.add,
              size: 18.sp,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                    hintText: getText(context, HomeLangDifinition.hintSearch),
                    prefixIcon: Icon(Icons.search, size: 24.sp),
                    controller: widget.viewModel.txtSearchKey,
                    focusChanged: (focus) {
                      if (!focus &&
                          widget.viewModel.txtSearchKey.text.isEmpty) {
                        widget.viewModel.isShowSearchDesktop.value = false;
                      }
                    },
                    onChanged: (p0) {
                      if (p0.isEmpty) {
                        widget.viewModel.accountList.value.clear();
                        return;
                      }
                      widget.viewModel.isShowSearchDesktop.value = true;
                      widget.viewModel.handleSearchAccount();
                    },
                    textInputAction: TextInputAction.search,
                    textAlign: TextAlign.left),
              ),
              const SizedBox(width: 10),
              ValueListenableBuilder<bool>(
                valueListenable: widget.viewModel.isShowSearchDesktop,
                builder: (context, isShowSearch, child) {
                  return isShowSearch
                      ? IconButton(
                          onPressed: () {
                            widget.viewModel.txtSearchKey.clear();
                            widget.viewModel.isShowSearchDesktop.value = false;
                          },
                          icon: const Icon(Icons.close))
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: ValueListenableBuilder<bool>(
                valueListenable: widget.viewModel.isShowSearchDesktop,
                builder: (context, isShowSearch, child) {
                  return isShowSearch ? searchBody() : homeBody();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBody() {
    bool isDarkMode =
        Provider.of<RootPR>(context, listen: false).themeMode == ThemeMode.dark;
    return DoubleValueListenBuilder(
      widget.viewModel.isSearch,
      widget.viewModel.accountList,
      builder: (context, isSearch, accountList, child) {
        if (isSearch) {
          return const Column(
            children: [
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          );
        } else if (accountList.isEmpty ||
            widget.viewModel.txtSearchKey.text == "") {
          return Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/exclamation-mark.png",
                width: 60.h,
                height: 60.h,
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: accountList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      AccountOjbModel account = accountList[index];
                      return ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: account.icon == "default" ||
                                    account.icon == null ||
                                    allBranchLogos
                                            .firstWhere((element) =>
                                                element.branchLogoSlug ==
                                                account.icon)
                                            .branchName ==
                                        null
                                ? Text(
                                    decryptInfo(account.title)[0].toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ))
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      width: 50.w,
                                      height: 50.h,
                                      isDarkMode
                                          ? allBranchLogos
                                              .firstWhere((element) =>
                                                  element.branchLogoSlug ==
                                                  account.icon)
                                              .branchLogoPathDarkMode!
                                          : allBranchLogos
                                              .firstWhere((element) =>
                                                  element.branchLogoSlug ==
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
                        subtitle: Text(decryptInfo(account.email ?? ""),
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
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget homeBody() {
    return Column(
      children: [
        SizedBox(
          height: 45.h,
          child: DoubleValueListenBuilder(
            widget.viewModel.dataShared.categoriesList,
            widget.viewModel.categorySelected,
            builder: (context, listCate, cateSelected, child) {
              listCate = [
                CategoryOjbModel(
                    categoryName: getText(context, HomeLangDifinition.tatCa)),
                ...listCate
              ];

              if (listCate.length == 1) {
                widget.viewModel.categorySelected.value = listCate[0];
              }
              return ScrollablePositionedList.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemScrollController: itemScrollController,
                itemCount: listCate.length,
                itemBuilder: (context, index) {
                  return Material(
                    child: Ink(
                      decoration: BoxDecoration(
                        color: cateSelected.id == listCate[index].id
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          widget.viewModel
                              .handleFilterByCategory(listCate[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 2.h),
                          child: Builder(builder: (context) {
                            return Center(
                              child: Text(
                                listCate[index].categoryName,
                                style: TextStyle(
                                    color: cateSelected.id == listCate[index].id
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                    fontSize: 14.sp),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SingleChildScrollView(
              child: ClipRect(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                        valueListenable:
                            widget.viewModel.dataShared.categoryHomeList,
                        builder: (context, categories, child) {
                          widget.viewModel.checKAccountEmpty();
                          return ValueListenableBuilder(
                            valueListenable: widget.viewModel.isAccountEmpty,
                            builder: (context, isAccountEmpty, child) {
                              if (categories.isEmpty || isAccountEmpty) {
                                return Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Image.asset(
                                        "assets/images/exclamation-mark.png",
                                        width: 60.w,
                                        height: 60.h,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            getText(context,
                                                HomeLangDifinition.nhanNut),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CircleAvatar(
                                            child: Icon(
                                              Icons.add,
                                              size: 21.sp,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            getText(
                                              context,
                                              HomeLangDifinition.deThemTaiKhoan,
                                            ),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: categories.length,
                                  addAutomaticKeepAlives: true,
                                  addRepaintBoundaries: true,
                                  itemBuilder: (context, index) {
                                    var cateItem = categories[index];

                                    if (cateItem.accounts.isEmpty) {
                                      return const SizedBox.shrink();
                                    } else {
                                      return CardItem<AccountOjbModel>(
                                        title: cateItem.categoryName,
                                        items: cateItem.accounts,
                                        itemBuilder: (item, itemIndex) {
                                          return AccountItemWidget(
                                            onCallBackPop: () {
                                              // widget.viewModel.handleFilterByCategory(widget
                                              //     .viewModel
                                              //     .categorySelected
                                              //     .value);
                                            },
                                            onSelect: () {
                                              widget.viewModel
                                                  .handleSelectAccount(item);
                                            },
                                            onLongPress: () {
                                              if (widget
                                                  .viewModel
                                                  .dataShared
                                                  .accountSelected
                                                  .value
                                                  .isNotEmpty) {
                                                widget.viewModel
                                                    .handleSelectAccount(item);
                                                return;
                                              }
                                              bottomSheetOptionAccountItem(
                                                  viewModel: widget.viewModel,
                                                  accountModel: item,
                                                  context: context);
                                            },
                                            onTapSubButton: () {
                                              bottomSheetOptionAccountItem(
                                                  viewModel: widget.viewModel,
                                                  accountModel: item,
                                                  context: context);
                                            },
                                            accountModel: item,
                                            isLastItem:
                                                cateItem.accounts.length ==
                                                    itemIndex + 1,
                                          );
                                        },
                                      );
                                    }
                                  },
                                );
                              }
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
