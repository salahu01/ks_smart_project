import 'package:equatable/equatable.dart';

abstract class CreateProjectState extends Equatable {}

class InitialState extends CreateProjectState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CreateProjectState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CreateProjectState {
  @override
  List<Object> get props => [];
}

class ErrorState extends CreateProjectState {
  @override
  List<Object> get props => [];
}

class NetworkErrorState extends CreateProjectState {
  @override
  List<Object> get props => [];
}
