part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class GetPostsInitial extends PostsState {}

class GetPostsLoadingState extends PostsState {}

class GetPostsSuccessState extends PostsState {}

class GetPostsErrorState extends PostsState {
  final String error;

  GetPostsErrorState(this.error);
}

class CreatePostInitial extends PostsState {}

class CreatePostLoadingState extends PostsState {}

class CreatePostSuccessState extends PostsState {}

class CreatePostErrorState extends PostsState {
  final String error;

  CreatePostErrorState(this.error);
}
