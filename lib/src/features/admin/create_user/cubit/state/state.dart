import 'package:equatable/equatable.dart';

abstract class CreateUserState extends Equatable {}

class InitialState extends CreateUserState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CreateUserState {
  @override
  List<Object> get props => [];
}

class ErrorState extends CreateUserState {
  @override
  List<Object> get props => [];
}

class NetworkErrorState extends CreateUserState {
  @override
  List<Object> get props => [];
}

class SuccessState extends CreateUserState {
  @override
  List<Object> get props => [];
}
