import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/strings.dart';
import 'package:social_app/features/posts/business_logic/cubit/posts_cubit.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..getPosts(),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is GetPostsSuccessState) {
            print('login is success');
          } else if (state is GetPostsErrorState) {
            print(state.error);
          }
        },
        builder: (context, state) {
          var cubit = PostsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Shop app'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, loginScreen);
                    },
                    icon: const Icon(Icons.logout_outlined))
              ],
            ),
            body: cubit.posts.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        cubit.posts[index].displayName,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    if (cubit.posts[index].caption != null)
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          cubit.posts[index].caption!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        cubit.posts[index].displayContent,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),        
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        cubit.posts[index].createdAt,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 211, 201, 201)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: cubit.posts.length,
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, newPostScreen);
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
