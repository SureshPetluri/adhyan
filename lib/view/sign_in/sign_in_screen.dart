import 'package:adhyan/view/sign_in/sign_in_controller.dart';
import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_gap.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:adhyan/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';
import '../../utils/form_utils.dart';
import '../../widgets/app_asset_image.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: buildSignInForm(context),
          ),
        ),
      ),
    );
  }

  Widget buildSignInForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Card(
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: AppAssetImage(
              imageUrl: "asset/images/profile.jpg",
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const AppText(
            "Welcome back",
            fontSize: 24,
          ),
          const SizedBox(
            height: 12,
          ),
          const AppText(
            "Enter your credentials to access your account", /*fontSize: 16*/
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: AppText("Email Address", fontSize: 14),
          ),
          AppTextField(
            formController: controller.emailController,
            hintText: "Email",
            validators: (text) => FormUtils.checkValue(text, text: "Email"),
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9_$@.\-+,<>]'))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: AppText("Password", fontSize: 14),
          ),
          AppTextField(
            formController: controller.passwordController,
            obscure: context.read<SignInController>().isVisibleOff,
            hintText: "Password",
            validators: (text) => FormUtils.checkValue(text, text: "Password"),
            suffixWidget: IconButton(
              // padding: const EdgeInsets.only(top: 12.0),
              onPressed: () {
                if (context.read<SignInController>().isVisibleOff == true) {
                  context.read<SignInController>().isVisibleOff = false;
                } else {
                  context.read<SignInController>().isVisibleOff = true;
                }
                setState(() {});
              },
              icon: Icon(context.read<SignInController>().isVisibleOff
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9_#*()+={}\[\]\-/?%!&*$@.+,<>]'))
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: AppButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.forgot);
              },
              titleColor: Colors.blue,
              title: 'Forget Password?',
              buttonBackgroundColor: Colors.transparent,
              buttonBorderColor: Colors.transparent,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AppButton(
              onPressed: () {
                controller.signInSubmit(context);
              },
              buttonBackgroundColor: Colors.blue,
              title: 'Login',
              buttonBorderColor: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'New Here?',
                    style:
                        TextStyle(fontSize: 14.0), // Set the text color to blue
                  ),
                  TextSpan(
                    text: ' Create an Account',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, Routes.signUp),
                  ),
                ],
              ),
            ),
          ),
          const AppGap(
            h: 30,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.bookDemo);
              },
              titleColor: Colors.blue,
              title: 'Book A Demo',
              buttonBackgroundColor: Colors.transparent,
              buttonBorderColor: Colors.black,
            ), /*OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.bookDemo);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
                        child: AppText('Book A Demo'),
                      )),*/
          )
        ],
      ),
    );
  }
}
