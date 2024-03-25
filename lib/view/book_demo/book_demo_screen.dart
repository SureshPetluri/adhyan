import 'package:adhyan/view/book_demo/book_demo_controller.dart';
import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_gap.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:adhyan/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class BookDemoScreen extends StatefulWidget {
  const BookDemoScreen({super.key});

  @override
  State<BookDemoScreen> createState() => _BookDemoScreenState();
}

class _BookDemoScreenState extends State<BookDemoScreen> {
  BookDemoController controller = BookDemoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                'Book A Demo',
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              const AppGap(
                h: 20,
              ),
              const AppText(
                  'Require a demo to explore more about the courses offered'),
              const AppGap(
                h: 20,
              ),
              const AppText('Name'),
              AppTextField(
                formController: controller.nameController,
                hintText: 'Full Name',
              ),
              const AppGap(
                h: 15,
              ),
              const AppText('Mobile Number'),
              AppTextField(
                formController: controller.mobileController,
                hintText: "Mobile Number",
              ),
              const AppGap(
                h: 15,
              ),
              const AppText('Email Address'),
              AppTextField(
                formController: controller.emailController,
                hintText: 'Email Address',
              ),
              const AppGap(
                h: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: AppButton(
                  onPressed: () {},
                  buttonBackgroundColor: Colors.blue,
                  title: 'Submit',
                  buttonBorderColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
