import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/strings.dart';
import 'package:social_app/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/screens/login_screen.dart';
import 'package:social_app/features/auth/presentation/screens/register_screen.dart';
import 'package:social_app/features/posts/presentation/screens/new_post_screen.dart';
import 'package:social_app/features/posts/presentation/screens/posts_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    AppRouter();

    switch (settings.name) {

      
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child:  LoginScreen(),
          ),
        );


      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child:  RegisterScreen(),
          ),
        );


      case postsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const PostsScreen(),
          ),
        );


      case newPostScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child:  NewPostScreen(),
          ),
        );
    }
  }
}
