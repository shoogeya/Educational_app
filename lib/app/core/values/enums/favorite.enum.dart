enum Favorite{
  courses,posts;
  String get title{
    switch (this){
      case Favorite.courses:
        return "الكورسات";
      case Favorite.posts:
        return "البوستات";
    }
  }
  static List<Favorite> get all{
    return Favorite.values;
  }
}