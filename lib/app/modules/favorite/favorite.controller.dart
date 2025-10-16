import 'package:masar/app/modules/myCourses/model/course.model.dart';
import '../../../app_Imports.dart';
import '../../core/extentions/app_extention.dart';
import 'action/get_favourite_courses.action.dart';

class FavoriteController extends GetxController {
  int currentIndex = 0;
  int coursePage = 0;
  bool isCoursePaginating = false;
  bool hasMoreCourse = false;
  int questionPage = 0;
  bool isQuestionPaginating = false;
  bool hasMoreQuestion = false;
  RxList<CourseModel> courses = <CourseModel>[].obs;
  ScrollController courseScrollController = ScrollController();
  static const int PAGE_SIZE = 10;
  getFavouriteCoursesAction() async {
    await GetFavouriteCoursesAction(coursePage)
        .run()
        .then(
          (value) {
        value.fold(
              (l) {
            showError(l.statusMessage);
          },
              (r) {

            courses.clear();
            courses.addAll(r?.data ?? []);
            coursePage = r?.currentPageIndex ?? 0;
            hasMoreCourse = r?.hasMore ?? false;
            update();
          },
        );
      },
    );
    courseScrollController.addListener(
          () {
        if (courseScrollController.position.extentAfter <= 0 &&
            isCoursePaginating == false) {
          showMore();
        }
      },
    );
    update();
  }
  showMore() async {
    if (!hasMoreCourse) {
      return;
    }
    if (coursePage == 0) {
      coursePage++;
    }
    isCoursePaginating = true;
    await GetFavouriteCoursesAction(coursePage)
        .run()
        .then(
          (value) {
        value.fold(
              (l) {
            showError(l.statusMessage);
          },
              (r) {
            courses.addAll(r?.data ?? []);
            hasMoreCourse = r?.hasMore ?? false;
            isCoursePaginating = false;
            if (r?.hasMore ?? false) {
              coursePage++;
            }
            update();
          },
        );
      },
    );
  }

}
