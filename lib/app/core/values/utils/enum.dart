enum Rule {
  admin,
  student,
  teacher;
  int get id {
    switch (this) {
      case Rule.admin:
        return 1;
      case Rule.student:
        return 2 ;
      case Rule.teacher:
        return  3;
    }
  }
}
 enum Season {
  season1,season2;
  int get id{
    switch (this){
      case Season.season1:
        return 1;
      case Season.season2:
        return 2;
    }
  }
  String get title{
    switch (this){
      case Season.season1:
        return "الفصل الاول";
      case Season.season2:
        return "الفصل الثاني";
    }
  }
}

  enum CourseEnum {
   basicCourse,
   paidCourse;

   int get id {
     switch (this) {
       case CourseEnum.basicCourse:
         return 1;
       case CourseEnum.paidCourse:
         return 2;
     }
   }
   String get title {
     switch (this) {
       case CourseEnum.basicCourse:
         return "مساق تأسيس (مجاني)";
       case CourseEnum.paidCourse:
         return "مساق الأساسي (مدفوع)";
     }
   }
 }
final Map<int, CourseEnum> courceMap = {
  1: CourseEnum.basicCourse,
  2: CourseEnum.paidCourse,
};

CourseEnum? getCourceTypeFromInt(int id) {
  return courceMap[id];
}

