import 'package:masar/app_Imports.dart';
import '../../core/extentions/app_extention.dart';
import 'models/exam_model.dart';

class CourseDetailsController extends GetxController {
  final ScrollController scrollController = ScrollController();
  ExamModel? exam;
  int currentIndex = 0;
  int page = 0;
  bool isPaginating = false;
  bool hasMore = false;
  bool hasExam = false;
  void scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  goToExam() {
    ExamModel exam = Get.arguments["exam"];
    showAlert(
        cancelText: "إلغاء",
        okText: "موافق",
        "بمجرد الضغط على زر موافق سيتم بدء الاختبار",
        title: "انتبه", onSuccess: () {
      // Get.to(()=> StudentExamPage());
    });
  }

}
