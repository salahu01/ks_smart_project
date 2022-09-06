import 'package:equatable/equatable.dart';
import 'package:ks_smart/src/model/project_model.dart';

abstract class MyProjectState extends Equatable {}

class InitialState extends MyProjectState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MyProjectState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MyProjectState {
  LoadedState(this.projects);

  final List<ProjectModel> projects;

  @override
  List<Object> get props => [projects];
}

class ErrorState extends MyProjectState {
  @override
  List<Object> get props => [];
}

class NetworkErrorState extends MyProjectState {
  @override
  List<Object> get props => [];
}

class DropDownState extends MyProjectState {
  @override
  List<Object> get props => [];
}
