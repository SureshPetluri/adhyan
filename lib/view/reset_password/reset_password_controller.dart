import 'package:flutter/cupertino.dart';

class ResetPasswordController extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isVisibleOff = true;
  bool isVisibleConformOff = true;
}
