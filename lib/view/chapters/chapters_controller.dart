import 'package:flutter/material.dart';

class ChaptersController extends ChangeNotifier {
  Map<String, dynamic> courseDetailsMap = {};

  int chapterIndex = -1;
  ChaptersController() {
    courseDetailsMap = {
      "title": "Development",
      "chapters": [
        {
          "chapterNama": "Chapter",
          "status": "Not Started",
          "lessons": [
            {
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },
          ]
        },
        {
          "chapterNama": "Chapter",
          "status": "10% Completed",
          "lessons": [
            {
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },
          ]
        },
        {
          "chapterNama": "Chapter",
          "status": "10% Completed",
          "lessons": [
            {
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },{
              "lessonName": "Variables",
              "lessonVideoUrl": "url",
              "lessonStatus": "NotStarted"
            },
          ]
        },
      ]
    };
    notifyListeners();
  }
  chapterIndexUpdate(int index) {
    if(chapterIndex != index){
      chapterIndex = index;
    }else{
      chapterIndex = -1;
    }
    notifyListeners();
  }
}
