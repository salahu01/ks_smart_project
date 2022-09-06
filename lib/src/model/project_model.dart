class ProjectModel {
  String? city;
  String? companyName;
  String? projectName;
  String? projectDate;
  String? website;

  ProjectModel(
      {this.city,
      this.companyName,
      this.projectDate,
      this.projectName,
      this.website});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    companyName = json['companyName'];
    projectName = json['projectName'];
    projectDate = json['projectDate'];
    city = json['city'];
  }

  Map<String, dynamic> toJson(ProjectModel projectModel) {
    final data = <String, dynamic>{
      "city": projectModel.city,
      "companyName": projectModel.companyName,
      "projectName": projectModel.projectName,
      "projectDate": projectModel.projectDate,
      "website": projectModel.website,
    };
    return data;
  }
}
