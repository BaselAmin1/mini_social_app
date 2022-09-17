import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/strings.dart';
import 'package:social_app/features/auth/presentation/widgets/shared_widgets.dart';
import 'package:social_app/features/posts/business_logic/cubit/posts_cubit.dart';

class NewPostScreen extends StatelessWidget {
   NewPostScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  var captionController = TextEditingController();

  var displayPictureController = TextEditingController();

  var postContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is CreatePostSuccessState) {
            Navigator.pushNamed(context, postsScreen);
            print('register is done');
          }
          if (state is CreatePostErrorState) {
            print(state.error);
          }
        },
        builder: (context, state) {
          var cubit = PostsCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Post here'),
                        const SizedBox(
                          height: 24,
                        ),
                        defaultTextField(
                          controller: captionController,
                          keyboardType: TextInputType.text,
                          hintText: 'Enter your caption here',
                          prefixIcon: Icons.closed_caption,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        defaultTextField(
                          controller: postContentController,
                          keyboardType: TextInputType.text,
                          hintText: 'Enter your content here',
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        defaultTextField(
                          controller: displayPictureController,
                          keyboardType: TextInputType.text,
                          hintText: 'Enter your display picture here',
                          prefixIcon: Icons.picture_as_pdf,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.createPost(
                                  caption: captionController.text,
                                  displayPicture: displayPictureController.text,
                                  postContent: postContentController.text,
                                );
                              }
                            },
                            widget: const Text('post')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
