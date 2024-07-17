import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/security_check/screens.dart';
import 'package:cyber_safe/ui/screens/security_check/widgets.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MobileView extends StatefulWidget {
  final SecurityCheckViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  Map<String, double> dataMap = {};
  int score = 0;

  @override
  void initState() {
    super.initState();
    initValue();
  }

  void initValue() {
    dataMap = {
      getText(context, SecurityCheckLangDef.manh):
          widget.viewModel.totalAccountPasswordStrong.value.toDouble(),
      getText(context, SecurityCheckLangDef.yeu):
          widget.viewModel.totalAccountPasswordWeak.value.toDouble(),
      getText(context, SecurityCheckLangDef.giongNhau):
          widget.viewModel.listAccountSamePassword.value.length.toDouble(),
    };
    if (widget.viewModel.totalAccount.value > 0) {
      score = (widget.viewModel.totalAccountPasswordStrong.value /
                  widget.viewModel.totalAccount.value *
                  100)
              .round() +
          1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: getText(context, HomeLangDifinition.kiemTraBaoMat),
        onPressBack: () {
          Navigator.pop(context);
        },
      ),
      body: DoubleValueListenBuilder(
        widget.viewModel.listAccountSamePassword,
        widget.viewModel.listCategoryPasswordWeak,
        builder: (context, value1, value2, child) {
          initValue();
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                      child: SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: ColoredBox(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: PieChart(
                          dataMap: dataMap,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 32.w,
                          chartRadius: MediaQuery.of(context).size.width / 2.5,
                          colorList: const [
                            Colors.blueAccent,
                            Colors.redAccent,
                            Colors.yellowAccent,
                          ],
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 32.w,
                          centerWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$score",
                                style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                getText(
                                    context, SecurityCheckLangDef.diemBaoMat),
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          legendOptions: LegendOptions(
                            showLegendsInRow: true,
                            legendPosition: LegendPosition.bottom,
                            showLegends: true,
                            legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: false,
                            showChartValues: false,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                          // gradientList: ---To add gradient colors---
                          // emptyColorGradient: ---Empty Color gradient---
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SecurityCheckItem(
                              title: getText(
                                  context, SecurityCheckLangDef.tongSoTaiKhoan),
                              value: widget.viewModel.totalAccount.value,
                              icon: Icons.lock,
                            ),
                            const SizedBox(height: 10),
                            SecurityCheckItem(
                              title: getText(context,
                                  SecurityCheckLangDef.tongSoMatKhauManh),
                              value: widget
                                  .viewModel.totalAccountPasswordStrong.value,
                              icon: Icons.security_outlined,
                            ),
                            const SizedBox(height: 10),
                            SecurityCheckItem(
                              title: getText(context,
                                  SecurityCheckLangDef.tongSoMatKhauYeu),
                              value: widget
                                  .viewModel.totalAccountPasswordWeak.value,
                              icon: Icons.warning_rounded,
                              subIcon: Icons.arrow_forward_ios_rounded,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AccountPasswordWeak(
                                      viewModel: widget.viewModel,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            SecurityCheckItem(
                              title: getText(context,
                                  SecurityCheckLangDef.tongSoMatKhauGiongNhau),
                              value: widget.viewModel.listAccountSamePassword
                                  .value.length,
                              icon: Icons.copy_rounded,
                              subIcon: Icons.arrow_forward_ios_rounded,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SamePasswordsView(
                                      viewModel: widget.viewModel,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
