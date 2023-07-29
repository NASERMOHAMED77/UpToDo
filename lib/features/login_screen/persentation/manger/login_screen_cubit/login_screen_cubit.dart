import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/features/login_screen/data/repo/login_repo.dart';
import 'package:firee/features/login_screen/persentation/manger/login_screen_cubit/login_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitState());
  LoginRepo loginRepo;
  Future<void> loginByGoogle() async {
    emit(LoginLoadingState());
    try {
      loginRepo.loginByGoogle();
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(massages: e.toString()));
    }
  }

  List xa = [];
  getprofilinfo() async {
    DocumentReference theardsref =
        FirebaseFirestore.instance.collection('users').doc('1');
    DocumentSnapshot x = await theardsref.get();
    xa.add(x.data());
  }
}
