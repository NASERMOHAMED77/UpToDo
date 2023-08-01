import 'package:firee/features/home/persentation/manager/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_screen_repo/Home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(GetTheardsLoadingState());
  HomeRepo homeRepo;
  List theards = [];
  List usertheard = [];
  getTheards() async {
    try {
      emit(GetTheardsLoadingState());
      theards = await homeRepo.getTheards();
      emit(GetTheardsSucessState());
    } catch (e) {
      emit(GetTheardsFailureState(massages: e.toString()));
    }
  }

  getUserTheards() async {
    try {
      emit(GetTheardsLoadingState());
      theards = await homeRepo.getUserTheards();
      emit(GetTheardsSucessState());
    } catch (e) {
      emit(GetTheardsFailureState(massages: e.toString()));
    }
  }
}
