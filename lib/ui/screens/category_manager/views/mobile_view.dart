import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens/category_manager/extensions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class MobileView extends StatefulWidget {
  final CategoryManagerViewModel viewModel;
  const MobileView({
    super.key,
    required this.viewModel,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with CategoryManagerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: getText(context, CateManagerLangDef.quanLyDanhMuc),
        onPressBack: () {
          Navigator.pop(context);
        },
        actions: [
          ValueListenableBuilder(
              valueListenable: widget.viewModel.isEdit,
              builder: (context, value, child) {
                return Visibility(
                  visible: value,
                  child: IconButton(
                    onPressed: () {
                      widget.viewModel.updateCategoryList();
                    },
                    icon: Icon(
                      Icons.save,
                      color: primaryColor,
                      size: 24.sp,
                    ),
                  ),
                );
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Text(getText(context, CateManagerLangDef.luuYHuongDan),
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color.fromARGB(255, 53, 51, 51),
                  fontSize: 12,
                )),
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: widget.viewModel.categoryList,
                builder: (context, categoryList, child) {
                  return categoryList.isEmpty
                      ? Center(
                          child: Image.asset(
                            "assets/images/exclamation-mark.png",
                            width: 60.w,
                            height: 60.h,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: ReorderableListView.builder(
                            onReorderEnd: (index) {
                              widget.viewModel.isEdit.value = true;
                            },
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16),
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              var category = categoryList[index];
                              return Padding(
                                key: ValueKey(category.indexPos),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: CardCustomWidget(
                                  padding: const EdgeInsets.all(0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: Text(
                                                "${category.categoryName} (${category.accounts.length})",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            widget
                                                .viewModel
                                                .txtCategoryNameController
                                                .text = category.categoryName;
                                            updateCategoryBottomSheet(
                                                context: context,
                                                viewModel: widget.viewModel,
                                                category: category);
                                          },
                                          icon: Icon(
                                            Icons.edit_note_rounded,
                                            size: 21.sp,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            deleteCategoryPopup(
                                                context: context,
                                                viewModel: widget.viewModel,
                                                category: category);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red[600],
                                            size: 21.sp,
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Icon(
                                          Icons.drag_indicator_outlined,
                                          size: 21.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            onReorder: (oldIndex, newIndex) {
                              widget.viewModel
                                  .reorderCategory(oldIndex, newIndex);
                            },
                          ),
                        );
                }),
          ),
        ],
      ),
    );
  }
}
