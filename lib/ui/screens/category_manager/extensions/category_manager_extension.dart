import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

mixin CategoryManagerMixin {}

extension CategoryManagerExtension on CategoryManagerMixin {
  Future<void> updateCategoryBottomSheet({
    required BuildContext context,
    required CategoryManagerViewModel viewModel,
    required CategoryOjbModel category,
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
                        getText(context, HomeLangDifinition.tenDanhMuc),
                    controller: viewModel.txtCategoryNameController,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.start,
                    hintText:
                        getText(context, HomeLangDifinition.nhapTenDanhMuc),
                    maxLines: 1,
                    isObscure: false,
                    onFieldSubmitted: (value) {}),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  margin: const EdgeInsets.all(0),
                  onPressed: () {
                    bool result = viewModel.updateCategory(category);
                    if (result) {
                      Navigator.pop(context);
                    }
                  },
                  text: getText(context, CateManagerLangDef.capNhatDanhMuc),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        getText(context, CateManagerLangDef.capNhatDanhMuc),
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

  Future<void> deleteCategoryPopup({
    required BuildContext context,
    required CategoryManagerViewModel viewModel,
    required CategoryOjbModel category,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(getText(context, CateManagerLangDef.xoaDanhMuc)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                category.accounts.isNotEmpty
                    ? getText(
                        context,
                        CateManagerLangDef
                            .danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa)
                    : getText(context,
                        CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay),
              ),
              if (category.accounts.isNotEmpty)
                ExpansionTile(
                    title: Text(getText(context,
                        CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc)),
                    children: [
                      SizedBox(
                        height:
                            200, // Set a fixed height for the scrollable area
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: category.accounts
                                .where((e) =>
                                    e.email != null && e.email!.isNotEmpty)
                                .map((e) => ListTile(
                                      title: Text(decryptInfo(e.title)),
                                      subtitle:
                                          Text(decryptInfo(e.email ?? "")),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ])
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                bool result = await viewModel.deleteCategory(category);
                if (result) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: Text(
                getText(context, CateManagerLangDef.xoa),
                style: const TextStyle(color: Colors.redAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(getText(context, CateManagerLangDef.huy)),
            ),
          ],
        );
      },
    );
  }
}
