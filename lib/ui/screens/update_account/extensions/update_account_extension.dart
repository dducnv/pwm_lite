import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

mixin UpdateAccountMixin {}

extension UpdateAccountExtension on UpdateAccountMixin {
  Future<void> bottomSheetAddCustomField(
    BuildContext context, {
    required TextEditingController controller,
    required Function() onAddField,
    required List<TypeTextField> typeTextFields,
    required ValueNotifier<TypeTextField> typeTextFieldSelected,
    required UpdateAccountViewModel viewModel,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return showModalBottomSheet(
      backgroundColor: colorScheme.background,
      elevation: 0,
      isScrollControlled: true,
      context: context,
      builder: (context) => Builder(
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 360 + MediaQuery.of(context).viewInsets.bottom,
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                      valueListenable: viewModel.isRequiredFieldTitle,
                      builder: (_, value, child) {
                        return CustomTextField(
                          requiredTextField: true,
                          titleTextField:
                              getText(context, CreateAccountLangDif.tenTruong),
                          controller: controller,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          hintText:
                              getText(context, CreateAccountLangDif.tenTruong),
                          maxLines: 1,
                          isObscure: false,
                          onChanged: (value) {
                            viewModel.isRequiredFieldTitle.value =
                                value.isEmpty;
                          },
                          textError: value
                              ? getText(context,
                                  CreateAccountLangDif.vuiLongNhapTenTruong)
                              : null,
                        );
                      }),
                  const SizedBox(height: 10),
                  _buildFieldTypeLabel(context),
                  const SizedBox(height: 5),
                  _buildTypeTextFieldSelector(
                    context,
                    typeTextFields,
                    typeTextFieldSelected,
                  ),
                  const SizedBox(height: 16),
                  _buildAddButton(
                    context,
                    onAddField,
                    viewModel,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFieldTypeLabel(
    BuildContext context,
  ) {
    return RichText(
      text: TextSpan(
        text: "${getText(context, CreateAccountLangDif.kieuDuLieu)}: ",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800],
        ),
        children: [
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeTextFieldSelector(
    BuildContext context,
    List<TypeTextField> typeTextFields,
    ValueNotifier<TypeTextField> typeTextFieldSelected,
  ) {
    return ValueListenableBuilder<TypeTextField>(
      valueListenable: typeTextFieldSelected,
      builder: (context, value, child) {
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: typeTextFields.length,
          itemBuilder: (context, index) {
            return CustomButtonWidget(
              onPressed: () {
                typeTextFieldSelected.value = typeTextFields[index];
              },
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              margin: const EdgeInsets.all(0),
              text: "",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Radio<TypeTextField>(
                    value: typeTextFields[index],
                    groupValue: typeTextFieldSelected.value,
                    onChanged: (TypeTextField? value) {
                      typeTextFieldSelected.value = value!;
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    typeTextFields[index].title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAddButton(BuildContext context, Function() onAddField,
      UpdateAccountViewModel viewModel) {
    return CustomButtonWidget(
      margin: const EdgeInsets.all(0),
      onPressed: () {
        if (viewModel.txtFieldTitle.text.isEmpty) {
          viewModel.isRequiredFieldTitle.value = true;
          return;
        }
        onAddField();
        Navigator.pop(context);
      },
      text: "",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
            size: 24.sp,
          ),
          Text(
            getText(context, CreateAccountLangDif.themTruong),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bottomSheetSelectCategory({
    required BuildContext context,
    required UpdateAccountViewModel viewModel,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                          "${getText(context, CreateAccountLangDif.chonDanhMuc)} (${viewModel.dataShared.categoriesList.value.length})"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            bottomSheetCreateCategory(
                                context: context, viewModel: viewModel);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 24.sp,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ValueListenableBuilder(
                    valueListenable: viewModel.listCategory,
                    builder: (context, cateList, child) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cateList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              selected: viewModel.categorySelected.value ==
                                  cateList[index],
                              onTap: () {
                                viewModel.categorySelected.value =
                                    cateList[index];

                                viewModel.isRequiredSelectCategory.value =
                                    false;
                                Navigator.pop(context);
                              },
                              leading: Icon(
                                Icons.folder,
                                color: Theme.of(context).colorScheme.primary,
                                size: 24.sp,
                              ),
                              title: Text(
                                  "${cateList[index].categoryName} (${cateList[index].accounts.length})",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  )),
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
    required UpdateAccountViewModel viewModel,
  }) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Builder(builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 170 + MediaQuery.of(context).viewInsets.bottom,
            child: SingleChildScrollView(
              child: Column(children: [
                CustomTextField(
                    autoFocus: true,
                    requiredTextField: true,
                    titleTextField:
                        getText(context, CreateAccountLangDif.tenDanhMuc),
                    controller: viewModel.txtCategoryName,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.start,
                    hintText:
                        getText(context, CreateAccountLangDif.nhapTenDanhMuc),
                    maxLines: 1,
                    isObscure: false,
                    onFieldSubmitted: (value) async {
                      BuildContext currentContext = context;

                      bool result = await viewModel.handleCreateCategory();

                      if (result) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(currentContext).pop();
                      }
                    }),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  margin: const EdgeInsets.all(0),
                  onPressed: () async {
                    BuildContext currentContext = context;

                    bool result = await viewModel.handleCreateCategory();

                    if (result) {
                      // Sử dụng tham chiếu đã lưu trữ để pop màn hình
                      // ignore: use_build_context_synchronously
                      Navigator.of(currentContext).pop();
                    }
                  },
                  text: "",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        getText(context, CreateAccountLangDif.themDanhMuc),
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

  Future<void> selectIconBottomSheet(
    BuildContext context,
    UpdateAccountViewModel viewModel,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
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
                    child:
                        Text(getText(context, CreateAccountLangDif.chonIcon)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                selected: viewModel.branchLogoSelected.value.branchLogoSlug ==
                    "default",
                onTap: () {
                  viewModel.branchLogoSelected.value = BranchLogo(
                    [],
                    "default",
                  );
                  Navigator.pop(context);
                },
                leading: Icon(Icons.cancel_outlined,
                    color: Colors.blueAccent, size: 30.sp),
                title: Text(
                  getText(context, CreateAccountLangDif.khongChon),
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: branchLogoCategories.length,
                itemBuilder: (context, index) {
                  bool isDarkMode =
                      Provider.of<RootPR>(context, listen: false).themeMode ==
                          ThemeMode.dark;
                  var column = Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          branchLogoCategories[index].categoryName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                          children: branchLogoCategories[index]
                              .branchLogos
                              .map(
                                (e) => ValueListenableBuilder(
                                  valueListenable: viewModel.branchLogoSelected,
                                  builder: (_, value, child) => ListTile(
                                    selected: value == e,
                                    onTap: () {
                                      viewModel.branchLogoSelected.value = e;
                                      viewModel.txtAppName.text = e.branchName!;
                                      Navigator.pop(context);
                                    },
                                    leading: SizedBox(
                                      width: 40.w,
                                      height: 40.h,
                                      child: SvgPicture.asset(
                                        isDarkMode
                                            ? e.branchLogoPathDarkMode!
                                            : e.branchLogoPathLightMode!,
                                      ),
                                    ),
                                    title: Text(
                                      e.branchName ?? "",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList())
                    ],
                  );
                  return column;
                },
              )),
            ],
          ),
        );
      },
    );
  }
}
