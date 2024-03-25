import 'package:adhyan/routes/app_routes.dart';
import 'package:adhyan/view/verify/verify_controller.dart';
import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_gap.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/otp_widget.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  VerifyController controller = VerifyController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<VerifyController>().startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.resetTimer();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                'OTP Verification',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              const AppGap(h: 10),
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Enter the authentication code sent to your email address',
                      style: TextStyle(
                          fontSize: 14.0), // Set the text color to blue
                    ),
                    TextSpan(
                      text: ' hello@example.com',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const AppGap(h: 15),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    OtpInput(controller.fieldOne, true),
                    OtpInput(controller.fieldTwo, false),
                    OtpInput(controller.fieldThree, false),
                    OtpInput(controller.fieldFour, false),
                    OtpInput(controller.fieldFive, false),
                  ],
                ),
              ),
              const AppGap(h: 20),
              Align(
                alignment: Alignment.center,
                child: AppButton(
                  onPressed: () {
                    context.read<VerifyController>().resetTimer();
                    Navigator.pushNamed(context, Routes.resetPassword);
                  },
                  buttonBackgroundColor: Colors.blue,
                  title: 'Confirm', buttonBorderColor: Colors.blue,
                ),
              ),
              const AppGap(
                h: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: AppText(
                    "00:${context.watch<VerifyController>().seconds > 9 ? context.watch<VerifyController>().seconds : "0${context.watch<VerifyController>().seconds}"}"),
              ),
              const AppGap(
                h: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Didn\'t receive code? ',
                        style: TextStyle(
                            fontSize: 14.0), // Set the text color to blue
                      ),
                      TextSpan(
                        text: 'Resent Code',
                        style: TextStyle(
                            color:
                                context.watch<VerifyController>().isTimerRunning
                                    ? Colors.grey
                                    : Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context
                                  .read<VerifyController>()
                                  .isTimerRunning
                              ? null
                              : context.read<VerifyController>().startTimer(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
