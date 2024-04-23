import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../routes/app_routes.dart';
import '../../widgets/app_gap.dart';
import '../../widgets/app_text.dart';
import 'all_courses_controller.dart';

class AllCoursesScreen extends StatefulWidget {
  const AllCoursesScreen({super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  AllCoursesController controller = AllCoursesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Courses',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppGap(
              h: 20,
            ),
            AppTextField(
              formController: controller.searchController,
              hintText: 'Search for a course',
              prefixWidget: const Icon(Icons.search_sharp),
            ),
            const AppGap(
              h: 20,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  'All Courses',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                )),
            const AppGap(
              h: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (BuildContext context,int index) {
                  return Center(
                    child: ConstrainedBox(
                      constraints:const BoxConstraints(maxWidth:400 ) ,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                                  Image.asset('asset/images/certification_image.png'),
                            ),
                            const AppGap(
                              w: 15,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: const AppText('Development'),
                                    title: AppButton(
                                        title: 'Live classes',
                                        onPressed: () {
                                          Navigator.pushNamed(context, Routes.chapters);
                                        },
                                        paddingHorizontal: 5.0,
                                        paddingVertical: 2.0,
                                        titleFontSize: 11,
                                        buttonBackgroundColor: Colors.blue,
                                        buttonBorderColor: Colors.blue),
                                  ),
                                  const AppGap(
                                    h: 10,
                                  ),
                                  const AppText('Flutter Development-Beginner Level'),
                                  const AppGap(
                                    h: 10,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 20,
                                      ),
                                      AppGap(
                                        w: 5,
                                      ),
                                      AppText(
                                        '42 Hrs',
                                        fontSize: 12,
                                      ),
                                      AppGap(
                                        w: 10,
                                      ),
                                      AppText(' | '),
                                      AppGap(
                                        w: 10,
                                      ),
                                      Icon(
                                        Icons.my_library_books_rounded,
                                        size: 20,
                                      ),
                                      AppGap(
                                        w: 5,
                                      ),
                                      AppText(
                                        '12 Chapters',
                                        fontSize: 12,
                                      )
                                    ],
                                  ),
                                  const AppGap(
                                    h: 10,
                                  ),
                                  const AppText('R 1200'),
                                  const AppGap(
                                    h: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
