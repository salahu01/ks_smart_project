import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/admin/create_project/create_admin.dart';
import 'package:ks_smart/src/model/detail_model.dart';
import 'package:ks_smart/src/model/project_model.dart';
import 'package:ks_smart/src/services/api/api.dart';
import 'package:ks_smart/src/services/firebase/firebase.dart';

class CreateProjectCubit extends Cubit<CreateProjectState> {
  CreateProjectCubit() : super(InitialState()) {
    fetchData();
  }
  List<DetailsModel> detailsModels = [];
  List<String?> users = [];
  String? city;
  String? website;
  String? company;
  String? user;
  bool fetched = false;

  void fetchData() async {
    emit(LoadingState());
    final userResponse = await Firebase().fetchUsers();
    final response = await Api().fetchingData();
    if (response is List<DetailsModel>) {
      detailsModels = response;
      users = userResponse as List<String>;
      fetched = true;
      emit(LoadedState());
    } else if (response == 'Network Error') {
      emit(NetworkErrorState());
    } else {
      emit(ErrorState());
    }
  }

  void validate(
      {required String projectName,
      required String projectDate,
      required BuildContext context}) {
    if (projectName.length < 4 ||
        projectDate.length < 10 ||
        company == null ||
        city == null ||
        website == null ||
        user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Enter User Details !')));
    } else {
      createProject(
        userName: user ?? '',
        projectName: projectName,
        projectDate: projectDate,
        context: context,
      );
    }
  }

  void createProject({
    required String userName,
    required String projectName,
    required String projectDate,
    required context,
  }) async {
    final ProjectModel projectModel = ProjectModel(
      city: city,
      companyName: company,
      projectDate: projectDate,
      projectName: projectName,
      website: website,
    );
    final response = await Firebase()
        .addProject(ProjectModel().toJson(projectModel), userName, projectName);
    if (response == 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Project Created Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }
}
