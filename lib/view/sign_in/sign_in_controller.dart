import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SignInController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisibleOff = true;

  signInSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, Routes.myCourses);
    }
  }
}
