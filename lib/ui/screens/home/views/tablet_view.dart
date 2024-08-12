import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/screens/home/extensions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TabletView extends StatefulWidget {
  final HomeViewModel viewModel;
  const TabletView({super.key, required this.viewModel});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> with HomeMixin {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
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
                        .indexWhere(
                            (element) => element.id == isPop['category'].id),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
                widget.viewModel.handleFilterByCategory(isPop['category']);
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: const Center(
        child: Column(
          children: [
            Text('Tablet View', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
