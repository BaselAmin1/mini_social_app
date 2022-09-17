import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/strings.dart';
import 'package:social_app/features/posts/data/model/posts_model.dart';
import 'package:social_app/features/posts/data/web_services/posts_web_services.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(CreatePostInitial());

  static PostsCubit get(context) => BlocProvider.of(context);

  List<PostsModel> posts = [];
  Future getPosts() async {
    emit(GetPostsLoadingState());
    try {
      await PostsWebServices.getPosts(
        url: '/main/getall',
        token: token,
      ).then((value) {
        value.data['content'].forEach((value) {
          posts.add(PostsModel.fromJson(value));
        });
        print(value.data.toString());
        emit(GetPostsSuccessState());
      });
    } catch (error) {
      print(error.toString());
      emit(GetPostsErrorState(error.toString()));
    }
  }

  Future createPost({
    required String caption,
    required String postContent,
    required String displayPicture,
  }) async {
    emit(CreatePostLoadingState());
    try {
      await PostsWebServices.createPost(
        url: '/main/create',
        data: {
          'caption': caption,
          'display_picture': displayPicture,
          'display_content': postContent,
        },
        token: token,
      ).then((value) {
        emit(CreatePostSuccessState());
      });
    } catch (error) {
      print(error.toString());
      emit(CreatePostErrorState(error.toString()));
    }
  }
}
