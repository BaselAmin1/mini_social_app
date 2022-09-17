import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/strings.dart';
import 'package:social_app/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/shared_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      if (state is AuthSuccessState) {
        Navigator.pushReplacementNamed(context, postsScreen);
        print('login is success');
      } else if (state is AuthErrorState) {
        print(state.error);
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
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
                    const Text(
                      'Login now',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    defaultTextField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      hintText: 'Enter User name',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) return 'user name is Empty';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    defaultTextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      hintText: 'Enter Password',
                      prefixIcon: Icons.password_outlined,
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        icon: cubit.isPassword
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'password is Empty';
                        return null;
                      },
                      isPassword: cubit.isPassword,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    defaultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userAuth(
                                path: 'login',
                                userName: userNameController.text,
                                password: passwordController.text);
                          }
                        },
                        widget: state is AuthLoadingState
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Login')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account ?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, registerScreen);
                            },
                            child: const Text('Register Now'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
