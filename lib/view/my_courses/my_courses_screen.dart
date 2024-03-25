import 'package:adhyan/routes/app_routes.dart';
import 'package:adhyan/widgets/app_gap.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Image.asset(
            'asset/images/menu.png',
            color: Colors.blue, // Customize the icon color
          ),
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
            // _scaffoldKey.currentState?.openEndDrawer();
          },
          // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        actions: [
          Card(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'asset/images/menu.png', height: 40,
              color: Colors.blue, // Customize the icon color
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 400,
                height: 185,
                child: Card(
                  surfaceTintColor: Colors.blue,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          'EXPLORE, LEARN, EXCEL',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        const AppGap(
                          h: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 160,
                                  ),
                                  child: const AppText(
                                    'Find the perfect cources for your growth',
                                    color: Colors.white,
                                  ),
                                ),
                                AppGap(
                                  h: 15,
                                ),
                                AppButton(
                                    title: 'Explore Courses',
                                    titleColor: Colors.blue,
                                    titleFontSize: 12,
                                    paddingHorizontal: 20.0,
                                    buttonBackgroundColor: Colors.white,
                                    buttonBorderColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.allCourses);
                                    }),
                              ],
                            ),
                            Image.asset(
                              'asset/images/certification_image.png',
                              width: 135,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const AppGap(
              h: 15,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  'My Courses',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                )),
            const AppGap(
              h: 15,
            ),
            Container(
              width: 400,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child:
                          Image.asset('asset/images/certification_image.png'),
                    ),
                    AppGap(
                      w: 15,
                    ),
                    const Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText('Development'),
                            AppGap(
                              h: 10,
                            ),
                            AppText('Flutter Development-Beginner Level'),
                            AppGap(
                              h: 10,
                            ),
                            Row(
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
                            AppGap(
                              h: 10,
                            ),
                            AppText(
                              '36% Progress',
                              fontSize: 14,
                            ),
                            AppGap(
                              h: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: LinearProgressIndicator(
                                value: 0.36,
                                minHeight: 8,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                            ),
                            AppGap(
                              h: 10,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
