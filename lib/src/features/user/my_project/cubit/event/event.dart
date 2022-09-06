import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/user/my_project/cubit/cubit.dart';
import 'package:ks_smart/src/model/project_model.dart';
import 'package:ks_smart/src/services/firebase/firebase.dart';

class MyProjectCubit extends Cubit<MyProjectState> {
  MyProjectCubit(userName) : super(InitialState()) {
    fetchData(userName);
  }

  void fetchData(String userName) async {
    emit(LoadingState());
    final response = await Firebase().fetchMyProjetcs(userName);
    if (response is List<ProjectModel>) {
      emit(LoadedState(response));
    } else if (response == 'Connection Refused !') {
      emit(NetworkErrorState());
    } else {
      emit(ErrorState());
    }
  }

}
