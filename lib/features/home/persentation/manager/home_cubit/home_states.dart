abstract class HomeState {}

class GetTheardsSucessState extends HomeState {}

class GetTheardsLoadingState extends HomeState {}

class GetTheardsFailureState extends HomeState {
  final String massages;
  GetTheardsFailureState({
    required this.massages,
  });
}
