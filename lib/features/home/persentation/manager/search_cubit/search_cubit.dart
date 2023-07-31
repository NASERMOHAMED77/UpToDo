// ignore_for_file: unused_local_variable

import 'package:firee/features/home/data/repos/search_screen_repo/search_repo.dart';
import 'package:firee/features/home/persentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<GetUserState> {
  SearchCubit() : super(GetUserLoading());
  List users = [];
  getUser() async {
    try {
      emit(GetUserLoading());
      List users = [];

      SearchRepo? searchRepo;

      List userData = await searchRepo!.getUser();
      for (var element in userData) {
        users.add(element);
      }
    } catch (e) {
      emit(GetUserFailure(massages: e.toString()));
    }
  }
}
