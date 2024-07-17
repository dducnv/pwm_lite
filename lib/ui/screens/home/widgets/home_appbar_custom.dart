import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/screens/home/extensions.dart';
import 'package:cyber_safe/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeAppbarCustom extends StatefulWidget implements PreferredSizeWidget {
  final HomeViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  final Size preferredSize;

  const HomeAppbarCustom(
      {super.key, required this.viewModel, required this.scaffoldKey})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<HomeAppbarCustom> createState() => _HomeAppbarCustomState();
}

class _HomeAppbarCustomState extends State<HomeAppbarCustom> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.viewModel.dataShared.accountSelected,
        builder: (context, listSelected, child) {
          bool isNotEmpty = listSelected.isNotEmpty;

          return AppBar(
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: isNotEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
                statusBarIconBrightness: isNotEmpty
                    ? Brightness.light
                    : Theme.of(context).brightness,
              ),
              backgroundColor: isNotEmpty
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
              scrolledUnderElevation: 0,
              leading: isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        widget.viewModel.dataShared.accountSelected.value = [];
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.sort_rounded,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        if (widget.scaffoldKey.currentState!.isDrawerOpen) {
                          widget.scaffoldKey.currentState!.closeDrawer();
                          //close drawer, if drawer is open
                        } else {
                          widget.scaffoldKey.currentState!.openDrawer();
                          //open drawer, if drawer is closed
                        }
                      },
                    ),
              actions: isNotEmpty
                  ? [
                      IconButton(
                        onPressed: () {
                          bottomSheetSelectCategory(
                              context: context, viewModel: widget.viewModel);
                        },
                        icon: Icon(
                          Icons.drive_file_move,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(getText(
                                      context,
                                      HomeLangDifinition
                                          .banCoDongYXoaCacTaiKhoanDaChonKhong)),
                                  actionsPadding: const EdgeInsets.only(
                                    bottom: 2,
                                    right: 5,
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                    top: 16,
                                    left: 16,
                                    right: 16,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(getText(
                                          context, CateManagerLangDef.huy)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        widget.viewModel
                                            .handleDeleteAllAccount();
                                        Navigator.pop(context);
                                      },
                                      child: Text(getText(
                                          context, CateManagerLangDef.xoa)),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              color: Colors.redAccent,
                              size: 24.sp,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.viewModel.dataShared.accountSelected.value
                                  .length
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                    ]
                  : [
                      ValueListenableBuilder(
                          valueListenable: widget
                              .viewModel.dataShared.isUpdatedVersionEncryptKey,
                          builder: (context, isUpdateted, child) {
                            return Visibility(
                              visible: isUpdateted,
                              child: IconButton(
                                icon: Icon(
                                  Icons.update_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 24.sp,
                                ),
                                onPressed: () {
                                  Provider.of<RootPR>(context, listen: false)
                                      .setRequestUpdateVersionKey(true);
                                },
                              ),
                            );
                          }),
                      IconButton(
                        icon: Icon(
                          Icons.search_rounded,
                          size: 24.sp,
                        ),
                        onPressed: () {
                          //show bottom sheet
                          searchBottomSheet(
                              context: context, viewModel: widget.viewModel);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings_rounded,
                          size: 24.sp,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RoutePaths.settingRoute);
                        },
                      ),
                    ]);
        });
  }
}
