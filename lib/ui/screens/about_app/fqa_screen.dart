import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider/root_provider.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FqaScreen extends StatefulWidget {
  const FqaScreen({super.key});

  @override
  State<FqaScreen> createState() => _FqaScreenState();
}

class _FqaScreenState extends State<FqaScreen> {
  List<FQAModel> fqas = [];
  @override
  void initState() {
    super.initState();
    final appLang = Provider.of<RootPR>(context, listen: false).appLanguage;
    fqas = FQAModel.getData(appLang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            "FQAs",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Column(
              children: fqas
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CardCustomWidget(
                          padding: const EdgeInsets.all(0),
                          child: ExpansionTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(
                              e.question,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.answer,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            )));
  }
}
