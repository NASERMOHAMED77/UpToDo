abstract class LoginState {
  const LoginState();
}


class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  
}

class LoginFailureState extends LoginState {
  final  String massages;
 const LoginFailureState({
    required this.massages,
  });
}
