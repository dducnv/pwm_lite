import 'dart:ui';

import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider/root_provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens/home/home_view_model.dart';
import 'package:cyber_safe/ui/widgets/button/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestUpdateVersionKey extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const RequestUpdateVersionKey({super.key, required this.homeViewModel});

  @override
  State<RequestUpdateVersionKey> createState() =>
      _RequestUpdateVersionKeyState();
}

class _RequestUpdateVersionKeyState extends State<RequestUpdateVersionKey> {
  bool isShow = false;

  ValueNotifier<bool> isUpdating = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isShow = true;
      });
    });
  }

  void _handleRemindLater() {
    setState(() {
      isShow = false;
    });
    Provider.of<RootPR>(context, listen: false)
        .setRequestUpdateVersionKey(false);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  color: const Color.fromRGBO(0, 0, 0, 0.3)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ValueListenableBuilder(
              valueListenable: isUpdating,
              builder: (context, bool value, child) {
                return !value
                    ? AnimatedScale(
                        duration: const Duration(milliseconds: 350),
                        scale: isShow ? 1 : 0.3,
                        curve: isShow ? Curves.easeInSine : Curves.easeOutSine,
                        child: AlertDialog(
                          titlePadding: EdgeInsets.zero,
                          actionsPadding: EdgeInsets.zero,
                          contentPadding: const EdgeInsets.all(16),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                getText(
                                    context, SecurityCheckLangDef.quanTrong),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                getText(context,
                                    SecurityCheckLangDef.thongBaoCapNhat),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              CustomButtonWidget(
                                borderRaidus: 100,
                                height: 44,
                                onPressed: () {
                                  isUpdating.value = true;
                                  widget.homeViewModel
                                      .handleUpdateKeyForAccount();
                                },
                                text: getText(context,
                                    SecurityCheckLangDef.capNhatNgayBayGio),
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: _handleRemindLater,
                                borderRadius: BorderRadius.circular(100),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 2),
                                  child: Text(
                                    getText(context,
                                        SecurityCheckLangDef.nhacToiSau),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : ValueListenableBuilder(
                        valueListenable:
                            widget.homeViewModel.progressValueUpdateKey,
                        builder: (context, value, child) {
                          return value == 1
                              ? CustomButtonWidget(
                                  width: 250,
                                  borderRaidus: 100,
                                  height: 44,
                                  onPressed: () {
                                    widget.homeViewModel.handleUpdateKey();
                                  },
                                  text: getText(
                                      context, SecurityCheckLangDef.hoanTat))
                              : Center(
                                  child: SizedBox(
                                    width: 250,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          child: Text(
                                            '${getText(context, SecurityCheckLangDef.dangCapNhat)}...',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        LinearProgressIndicator(
                                          value: 0.5,
                                          minHeight: 7,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
