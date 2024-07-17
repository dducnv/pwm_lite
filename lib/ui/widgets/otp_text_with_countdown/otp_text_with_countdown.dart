import 'package:flutter/material.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/widgets.dart';

class OtpTextWithCountdown extends StatefulWidget {
  final String keySecret;
  final double? height;
  final double? width;
  final int? duration;
  final int? initialDuration;
  final TextStyle? otpTextStyle;
  final TextStyle? countDownTextStyle;
  final bool isSubTimeCountDown;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const OtpTextWithCountdown({
    super.key,
    required this.keySecret,
    this.otpTextStyle,
    this.countDownTextStyle,
    this.height,
    this.width,
    this.duration,
    this.initialDuration,
    this.isSubTimeCountDown = false,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  @override
  OtpTextWithCountdownState createState() => OtpTextWithCountdownState();
}

class OtpTextWithCountdownState extends State<OtpTextWithCountdown> {
  String totp = "";
  late RefetchTotp refetchTotp;
  late int nowValueCountDown;
  final CountDownController countDownController = CountDownController();

  @override
  void initState() {
    super.initState();
    _initializeCountDown();
    totp = generateTOTPCode(
      keySecret: widget.keySecret,
    );

    refetchTotp = RefetchTotp(
      refetchTotp: () {
        totp = generateTOTPCode(
          keySecret: widget.keySecret,
        );
        setState(() {});
      },
    );

    refetchTotp.elapsedStream.listen(null);
  }

  void _initializeCountDown() {
    final nowSeconds = DateTime.now().second;
    nowValueCountDown = nowSeconds < 30 ? nowSeconds : nowSeconds - 30;
  }

  void resetCountDown() {
    _initializeCountDown();
    countDownController.restart(duration: widget.duration ?? 30);
    setState(() {});
  }

  @override
  void dispose() {
    refetchTotp.dispose();
    refetchTotp.elapsedStream.drain();
    super.dispose();
  }

  Widget _buildCountDownTimer() {
    return CircularCountDownTimer(
      width: widget.width ?? 20.w,
      height: widget.height ?? 20.h,
      duration: widget.duration ?? 30,
      initialDuration: widget.initialDuration ?? nowValueCountDown,
      fillColor: Theme.of(context).colorScheme.primary,
      ringColor: Colors.grey[300]!,
      backgroundColor: Colors.grey[300],
      controller: countDownController,
      strokeWidth: 5,
      textStyle: widget.countDownTextStyle ??
          const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
      autoStart: true,
      isReverse: true,
      strokeCap: StrokeCap.round,
      isTimerTextShown: true,
      onComplete: resetCountDown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        if (!widget.isSubTimeCountDown) _buildCountDownTimer(),
        if (!widget.isSubTimeCountDown) const SizedBox(width: 10),
        Text(
          totp,
          style: widget.otpTextStyle ??
              TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        if (widget.isSubTimeCountDown) _buildCountDownTimer(),
      ],
    );
  }
}
