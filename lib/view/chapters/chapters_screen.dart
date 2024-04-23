import 'package:adhyan/routes/app_routes.dart';
import 'package:adhyan/view/chapters/chapters_controller.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChaptersScreen extends StatefulWidget {
  const ChaptersScreen({super.key});

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            context.read<ChaptersController>().courseDetailsMap["title"]),
        centerTitle: false,
      ),
      body: Consumer<ChaptersController>(
        builder: (BuildContext context, value, Widget? child) {
         return ListView.separated(
           itemCount: value.courseDetailsMap["chapters"].length,
           itemBuilder: (BuildContext context, int index) {
             return Column(
               children: [
                 InkWell(
                   onTap: (){
                     Provider.of<ChaptersController>(context, listen: false).chapterIndexUpdate(index);
                   },
                   child: AbsorbPointer(
                     child: ListTile(
                       title: AppText("Chapter ${index + 1}"),
                       subtitle: AppText(value.courseDetailsMap["chapters"][index]["status"]),
                       trailing: IconButton(
                         icon: Icon(  value.chapterIndex == index?Icons.arrow_drop_down : Icons.arrow_right),
                         onPressed: () {},
                       ),
                     ),
                   ),
                 ),
                 value.chapterIndex == index?  Padding(
                   padding: const EdgeInsets.only(left: 18.0),
                   child: ListView.separated(
                     shrinkWrap: true,
                     itemCount: value.courseDetailsMap["chapters"][index]['lessons']
                         .length,
                     itemBuilder: (BuildContext context, int i) {
                       return InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, Routes.lessonYoutubePlayer);
                         },
                         child: AbsorbPointer(
                           child: ListTile(
                             title: AppText("lesson ${i + 1}"),
                             subtitle: AppText(value.courseDetailsMap["chapters"][index]["lessons"][i]['lessonName']),
                             trailing: IconButton(
                               icon: const Icon(Icons.arrow_right),
                               onPressed: () {},
                             ),
                           ),
                         ),
                       );
                     }, separatorBuilder: (BuildContext context, int index) {
                     return const Divider();
                   },
                   ),
                 ):const SizedBox.shrink(),
               ],
             );
           },
           separatorBuilder: (BuildContext context, int index) {
             return const Divider();
           },
         );
        },
      ),
    );
  }
}
