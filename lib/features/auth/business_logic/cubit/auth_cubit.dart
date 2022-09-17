import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/strings.dart';
import 'package:social_app/features/auth/data/web_services/Auth_web_services.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  

  static AuthCubit get(context) => BlocProvider.of(context);

  Future userAuth({
    required String path,
    required String userName,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    emit(AuthLoadingState());
    try {
      await AuthWebServices.postAuthData(
        url: '/users/$path',
        data: {
          'username': userName,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      ).then((value) {
        token = value.data['token'];
        emit(AuthSuccessState());
      });
    } catch (error) {
      print(error.toString());
      emit(AuthErrorState(error.toString()));
    }
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(AuthChangePasswordVisibilityState());
  }
}
