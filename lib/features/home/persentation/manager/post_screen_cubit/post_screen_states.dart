abstract class PostState {
  const PostState();
}

class ImagePickedSucessState extends PostState {}
class PostLoadingState extends PostState {}

class ImagePickedFailureState extends PostState {
  final String massages;
  const ImagePickedFailureState({
    required this.massages,
  });
}
