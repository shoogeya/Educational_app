import 'package:masar/app/core/values/utils/enum.dart';

class CourseModel {
  int? courseID;
  int? subjectID;
  int? gradeID;
  int? seasonID;
  String? createdDate;
  int? teacherID;
  String? courseImage;
  String? teacherFirstName;
  String? teacherLastName;
  int? videosNumber;
  int? totalTimeInMints;
  int? gazaSubscriptionPrice;
  int? subscriptionPrice;
  String? subjectTitle;
  String? courseName;
  String? courseDescription;
  int? enrolledStudentNumber;
  double? teacherAverageRate;
  String? teacherImage;
  bool? isSaved;
  int? courseType;

  int get totalTimeInHours{
    if (totalTimeInMints != null){
      // Convert total minutes to hours and minutes
      int hours = totalTimeInMints! ~/ 60; // Integer division for hours
      int minutes = totalTimeInMints! % 60; // Remainder for minutes
      return hours;
    }
    return 0;
  }
  String get teacherFullName{
    return "${teacherFirstName} ${teacherLastName}";
  }
  CourseEnum get courseEnumType{
    return courseType == CourseEnum.paidCourse.id ? CourseEnum.paidCourse : CourseEnum.basicCourse ;
  }
  CourseModel(
      {this.courseID,
        this.subjectID,
        this.gradeID,
        this.seasonID,
        this.createdDate,
        this.teacherID,
        this.courseImage,
        this.teacherFirstName,
        this.teacherLastName,
        this.videosNumber,
        this.totalTimeInMints,
        this.gazaSubscriptionPrice,
        this.subscriptionPrice,
        this.subjectTitle,
        this.courseName,
        this.courseDescription,
        this.enrolledStudentNumber,
        this.teacherAverageRate,
        this.teacherImage,
        this.isSaved,this.courseType
      });

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseID = json['courseID'];
    subjectID = json['subjectID'];
    gradeID = json['gradeID'];
    seasonID = json['seasonID'];
    createdDate = json['createdDate'];
    teacherID = json['teacherID'];
    courseImage = json['courseImage'];
    teacherFirstName = json['teacherFirstName'];
    teacherLastName = json['teacherLastName'];
    videosNumber = json['videosNumber'];
    totalTimeInMints = json['totalTimeInMints'];
    gazaSubscriptionPrice = json['gazaSubscriptionPrice'];
    subscriptionPrice = json['subscriptionPrice'];
    subjectTitle = json['subjectTitle'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    enrolledStudentNumber = json['enrolledStudentNumber'];
    teacherAverageRate = double.parse((json['teacherAverageRate'] as num).toDouble().toStringAsFixed(1));
    teacherImage = json['teacherImage'];
    isSaved = json['isSaved'];
    courseType = json['courseType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseID'] = courseID;
    data['subjectID'] = subjectID;
    data['gradeID'] = gradeID;
    data['seasonID'] = seasonID;
    data['createdDate'] = createdDate;
    data['teacherID'] = teacherID;
    data['courseImage'] = courseImage;
    data['teacherFirstName'] = teacherFirstName;
    data['teacherLastName'] = teacherLastName;
    data['videosNumber'] = videosNumber;
    data['totalTimeInMints'] = totalTimeInMints;
    data['gazaSubscriptionPrice'] = gazaSubscriptionPrice;
    data['subscriptionPrice'] = subscriptionPrice;
    data['courseDescription'] = courseDescription;
    data['enrolledStudentNumber'] = enrolledStudentNumber;
    data['teacherAverageRate'] = teacherAverageRate;
    data['teacherImage'] = teacherImage;
    data['isSaved'] = isSaved;
    data['courseType'] = courseType;
    return data;
  }
}
