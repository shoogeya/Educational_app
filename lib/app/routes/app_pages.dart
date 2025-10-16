import 'package:get/get_navigation/src/routes/get_route.dart';
import '../layout/main_navigation.layout.dart';
import '../modules/myCourses/my_cources.page.dart';
import '../services/network/network.page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [

    /// Courses & Exams
    GetPage(name: AppRoutes.myCources, page: () => const MyCoursesPage()),

    GetPage(name: AppRoutes.internet, page: () => const InternetWidget2()),
    GetPage(name: AppRoutes.main, page: () => const MainNavigationLayout()),
  ];
}
