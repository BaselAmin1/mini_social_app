import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/app_router.dart';
import 'package:social_app/constants/observer.dart';
import 'package:social_app/features/auth/data/web_services/Auth_web_services.dart';
import 'package:social_app/features/posts/data/web_services/posts_web_services.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
  AuthWebServices.init();
  PostsWebServices.init();
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
