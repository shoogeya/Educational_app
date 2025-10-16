import '../../../app_Imports.dart';
import '../../core/extentions/app_extention.dart';
import 'actions/get_registered_courses_action.dart';
import 'model/course.model.dart';
class MyCoursesController extends GetxController{
  bool isUserClickOnInProcess = true;
  bool isUserClickOnAll = false;
  int currentIndex = 0;
  int page = 0;
  bool isPaginating = false;
  bool hasMore = false;
  RxList<CourseModel> courses = <CourseModel>[].obs;
  ScrollController scrollController = ScrollController();
  static const int PAGE_SIZE = 10;
  getRegisteredCoursesAction() async {
    await GetRegisteredCoursesAction(page)
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
            update();
          },
        );
      },
    );
    scrollController.addListener(
          () {
        if (scrollController.position.extentAfter <= 0 &&
            isPaginating == false) {
          showMore();
        }
      },
    );
    update();
  }

  showMore() async {
    if (!hasMore) {
      return;
    }
    if (page == 0) {
      page++;
    }
    isPaginating = true;
    await GetRegisteredCoursesAction(page
    )
        .run()
        .then(
          (value) {
        value.fold(
              (l) {
            showError(l.statusMessage);
          },
              (r) {
            courses.addAll(r?.data ?? []);
            hasMore = r?.hasMore ?? false;
            isPaginating = false;
            if (r?.hasMore ?? false) {
              page++;
            }
            update();
          },
        );
      },
    );
  }
}