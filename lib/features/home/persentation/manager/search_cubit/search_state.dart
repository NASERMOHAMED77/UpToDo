abstract class GetUserState {
  
}
class GetUserSuccess extends GetUserState {
  
}
class GetUserFailure extends GetUserState {
  final String massages;
   GetUserFailure({
    required this.massages,
  });
}
class GetUserLoading extends GetUserState {
  
}