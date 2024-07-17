import 'package:cyber_safe/ui/provider.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/screens/home/extensions.dart';
import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/home/widgets.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MobileView extends StatefulWidget {
  final HomeViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with HomeMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      appBar: HomeAppbarCustom(
        scaffoldKey: _scaffoldKey,
        viewModel: widget.viewModel,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 65.w,
            height: 65.h,
            child: FittedBox(
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () async {
                  if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                    showRequestUpdateVersionKey();
                    return;
                  }
                  dynamic isPop = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(
                        categoryModel: widget.viewModel.categorySelected.value,
                      ),
                    ),
                  );
                  Future.delayed(const Duration(milliseconds: 300), () {
                    itemScrollController.scrollTo(
                        alignment: -0.2,
                        index: widget.viewModel.dataShared.categoriesList.value
                            .indexWhere((element) =>
                                element.id == isPop['category'].id),
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(25),
                child: ValueListenableBuilder(
                  valueListenable: widget.viewModel.isLoadding,
                  builder: (context, isLoadding, child) {
                    if (isLoadding) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return RefreshIndicator(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: widget
                                      .viewModel.dataShared.categoryHomeList,
                                  builder: (context, categories, child) {
                                    widget.viewModel.checKAccountEmpty();
                                    return ValueListenableBuilder(
                                      valueListenable:
                                          widget.viewModel.isAccountEmpty,
                                      builder:
                                          (context, isAccountEmpty, child) {
                                        return categories.isEmpty ||
                                                isAccountEmpty
                                            ? Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          getText(
                                                              context,
                                                              HomeLangDifinition
                                                                  .nhanNut),
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
                                                            HomeLangDifinition
                                                                .deThemTaiKhoan,
                                                          ),
                                                          style: TextStyle(
                                                            fontSize: 16.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: categories.length,
                                                addAutomaticKeepAlives: true,
                                                addRepaintBoundaries: true,
                                                itemBuilder: (context, index) {
                                                  var cateItem =
                                                      categories[index];

                                                  return cateItem
                                                          .accounts.isEmpty
                                                      ? const SizedBox.shrink()
                                                      : CardItem<
                                                          AccountOjbModel>(
                                                          title: cateItem
                                                              .categoryName,
                                                          items:
                                                              cateItem.accounts,
                                                          itemBuilder: (item,
                                                              itemIndex) {
                                                            return AccountItemWidget(
                                                                onCallBackPop:
                                                                    () {
                                                                  // widget.viewModel.handleFilterByCategory(widget
                                                                  //     .viewModel
                                                                  //     .categorySelected
                                                                  //     .value);
                                                                },
                                                                onSelect: () {
                                                                  widget
                                                                      .viewModel
                                                                      .handleSelectAccount(
                                                                          item);
                                                                },
                                                                onLongPress:
                                                                    () {
                                                                  if (widget
                                                                      .viewModel
                                                                      .dataShared
                                                                      .accountSelected
                                                                      .value
                                                                      .isNotEmpty) {
                                                                    widget
                                                                        .viewModel
                                                                        .handleSelectAccount(
                                                                            item);
                                                                    return;
                                                                  }
                                                                  bottomSheetOptionAccountItem(
                                                                      viewModel:
                                                                          widget
                                                                              .viewModel,
                                                                      accountModel:
                                                                          item,
                                                                      context:
                                                                          context);
                                                                },
                                                                onTapSubButton:
                                                                    () {
                                                                  bottomSheetOptionAccountItem(
                                                                      viewModel:
                                                                          widget
                                                                              .viewModel,
                                                                      accountModel:
                                                                          item,
                                                                      context:
                                                                          context);
                                                                },
                                                                accountModel:
                                                                    item,
                                                                isLastItem: cateItem
                                                                        .accounts
                                                                        .length ==
                                                                    itemIndex +
                                                                        1);
                                                          },
                                                        );
                                                });
                                      },
                                    );
                                  }),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        onRefresh: () {
                          widget.viewModel.dataShared.isLoadding.value = true;
                          return Future.delayed(
                              const Duration(milliseconds: 500), () {
                            widget.viewModel.initData();
                            widget.viewModel.dataShared.isLoadding.value =
                                false;
                          });
                        });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            _buildCategory(),
            SizedBox(height: 90.h)
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          IconButton(
              style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(Size(40.w, 40.h))),
              onPressed: () {
                bottomSheetCreateCategory(
                    context: context, viewModel: widget.viewModel);
              },
              icon: Center(
                child: Icon(
                  Icons.add,
                  size: 20.sp,
                ),
              )),
          Flexible(
            child: SizedBox(
              height: 35.h,
              child: DoubleValueListenBuilder(
                widget.viewModel.dataShared.categoriesList,
                widget.viewModel.categorySelected,
                builder: (context, listCate, cateSelected, child) {
                  listCate = [
                    CategoryOjbModel(
                        categoryName:
                            getText(context, HomeLangDifinition.tatCa)),
                    ...listCate
                  ];

                  if (listCate.length == 1) {
                    widget.viewModel.categorySelected.value = listCate[0];
                  }
                  return ScrollablePositionedList.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
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
                                        color: cateSelected.id ==
                                                listCate[index].id
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
          )
        ],
      ),
    );
  }
}
