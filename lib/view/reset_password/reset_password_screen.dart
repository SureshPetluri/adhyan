import 'package:adhyan/view/reset_password/reset_password_controller.dart';
import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_gap.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:adhyan/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController controller = ResetPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              'Reset Password',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            const AppGap(
              h: 20,
            ),
            const AppText('Set New Password'),
            AppTextField(formController: controller.passwordController,
              obscure: context.read<ResetPasswordController>().isVisibleOff,
              hintText: "Password",
              suffixWidget: IconButton(
                // padding: const EdgeInsets.only(top: 12.0),
                onPressed: () {
                  if (context.read<ResetPasswordController>().isVisibleOff == true) {
                    context.read<ResetPasswordController>().isVisibleOff = false;
                  } else {
                    context.read<ResetPasswordController>().isVisibleOff = true;
                  }
                  setState(() {});
                },
                icon: Icon(
                    context.read<ResetPasswordController>().isVisibleOff ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            const AppGap(
              h: 15,
            ),
            const AppText('Confirm Password'),
            AppTextField(formController: controller.confirmPasswordController,
             hintText: 'Conform Password',
              obscure: context.read<ResetPasswordController>().isVisibleConformOff,
              suffixWidget: IconButton(
                // padding: const EdgeInsets.only(top: 12.0),
                onPressed: () {
                  if (context.read<ResetPasswordController>().isVisibleConformOff == true) {
                    context.read<ResetPasswordController>().isVisibleConformOff = false;
                  } else {
                    context.read<ResetPasswordController>().isVisibleConformOff = true;
                  }
                  setState(() {});
                },
                icon: Icon(
                    context.read<ResetPasswordController>().isVisibleConformOff ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            const AppGap(
              h: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: AppButton(
                onPressed: () {},
                buttonBackgroundColor: Colors.blue,
                title:
                  'Submit', buttonBorderColor: Colors.blue,
                ),
              ),

          ],
        ),
      ),
    );
  }
}
