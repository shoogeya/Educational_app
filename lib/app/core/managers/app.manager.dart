
import 'package:masar/app/core/values/utils/enum.dart';
import 'package:masar/app/data/models/branch.model.dart';
import 'package:masar/app/data/models/gender.model.dart';
import 'package:masar/app/data/models/grade.model.dart';
import 'package:masar/app/data/models/subject.model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/country.model.dart';
import '../../data/models/file_drop_down.model.dart';
import '../../data/models/season.model.dart';

class AppManager extends GetxController {
  List<CountryModel> countries = [];
  List<GradeModel> grades = [];
  List<SubjectModel> subjects = [];
  List<FileDropDawnModel> fileTypes = [
    FileDropDawnModel(fileID: 1, fileTitle: "كتاب"),
    FileDropDawnModel(fileID: 2, fileTitle: "كراسات"),
    FileDropDawnModel(fileID: 3, fileTitle: "اختبارات"),
  ];
  List<SectionModel> sections = [
    SectionModel(sectionID: 1, sectionDescription: "علمي / صناعي"),
    SectionModel(sectionID: 2, sectionDescription: "أدبي/ شرعي"),

  ];
  List<GenderModel> genders = [
    GenderModel(genderID: 2, genderName: "أنثى"),
    GenderModel(genderID: 1, genderName: "ذكر")
  ];
  List<SeasonModel> seasons = [
    SeasonModel(seasonID: Season.season1.id, seasonTitle: Season.season1.title),
    SeasonModel(seasonID: Season.season2.id, seasonTitle: Season.season2.title)
  ];
  List<FileLibraryModel> filesLibrary = [
    FileLibraryModel(fileID: 1, fileTitle: "كتاب"),
    FileLibraryModel(fileID: 2, fileTitle: "كراسات"),
    FileLibraryModel(
        fileID: 3, fileTitle: "اختبارات"),
  ];


}
