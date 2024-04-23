import 'package:adhyan/view/book_demo/book_demo_screen.dart';
import 'package:adhyan/view/chapters/chapters_controller.dart';
import 'package:adhyan/view/chapters/chapters_screen.dart';
import 'package:adhyan/view/lesson_player/lesson_player_controller.dart';
import 'package:adhyan/view/lesson_player/lesson_player_screen.dart';
import 'package:adhyan/view/lesson_player/lesson_youtube_screen.dart';
import 'package:adhyan/view/reset_password/reset_password_controller.dart';
import 'package:adhyan/view/reset_password/reset_password_screen.dart';
import 'package:adhyan/view/sign_in/sign_in_controller.dart';
import 'package:adhyan/view/sign_up/sign_up_screen.dart';
import 'package:adhyan/view/verify/verify_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/app_routes.dart';
import 'view/all_courses/all_courses_screen.dart';
import 'view/forgot_password/forgot_password_screen.dart';
import 'view/my_courses/my_courses_screen.dart';
import 'view/sign_in/sign_in_screen.dart';
import 'view/verify/verify_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInController()),
        ChangeNotifierProvider(create: (_) => VerifyController()),
        ChangeNotifierProvider(create: (_) => ResetPasswordController()),
        ChangeNotifierProvider(create: (_) => ChaptersController()),
        ChangeNotifierProvider(create: (_) => LessonPlayerController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          Routes.signIn: (context) => const SignInScreen(),
          Routes.signUp: (context) => const SignUpScreen(),
          Routes.forgot: (context) => const ForgotPasswordScreen(),
          Routes.verify: (context) => const VerifyScreen(),
          Routes.resetPassword: (context) => const ResetPasswordScreen(),
          Routes.bookDemo: (context) => const BookDemoScreen(),
          Routes.myCourses: (context) => const MyCoursesScreen(),
          Routes.allCourses: (context) => const AllCoursesScreen(),
          Routes.chapters: (context) => const ChaptersScreen(),
          Routes.lessonYoutubePlayer: (context) => const LessonYoutubePlayerScreen(),
          // Routes.lessonPlayer: (context) => const LessonPlayerScreen(),
        },

        home: const SignInScreen(),
      ),
    );
  }
}
