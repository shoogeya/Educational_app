import 'package:masar/app/core/theme/app_colors.dart';
import 'package:masar/app/core/theme/app_text_styles.dart';
import 'package:masar/app/layout/main_navigation.controller.dart';
import 'package:masar/app_Imports.dart';

class BottomNavWidget extends StatefulWidget {
  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(Get.find<MainNavigationController>().index == index){

    }else{
      Get.find<MainNavigationController>().index = index;
      Get.find<MainNavigationController>().update();
    }

  }
  Widget build(BuildContext context) {
    final pages = Get.find<MainNavigationController>().pages;
    return SizedBox(
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue, // Color for the active icon
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, // Ensure labels are shown when selected
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.r12.copyWith(color: AppColors.grayTextColor),unselectedLabelStyle: AppTextStyles.r12.copyWith(color: AppColors.grayTextColor),
        items: List.generate(
          pages.length, // Ensure you only generate items for the number of pages
              (index) => BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == index ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(pages[index].icon),
              ),
            ),
            label: pages[index].title,
          ),
        ),// Color for the inactive icons

      ),
    );
  }
}



