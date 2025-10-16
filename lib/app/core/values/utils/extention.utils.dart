enum UserType{
  student,teacher;
  int get id{
    switch (this){
      case UserType.student:
        return 0;
      case UserType.teacher:
        return 1;
    }
  }
}