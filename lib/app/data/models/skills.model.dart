class SkillModel  {
  String? details;
  SkillModel(
      {this.details});

  SkillModel.fromJson(Map<String, dynamic> json) {
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details,
    };
  }
}