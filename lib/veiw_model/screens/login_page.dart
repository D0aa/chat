import 'package:chat_app/veiw/data/bloc/auth_cubit.dart';
import 'package:chat_app/veiw/data/bloc/auth_state.dart';
import 'package:chat_app/veiw/utils/navigation.dart';
import 'package:chat_app/veiw_model/components/widget/text_custom.dart';
import 'package:chat_app/veiw_model/components/widget/text_form_field_custom.dart';
import 'package:chat_app/veiw_model/screens/home_screen.dart';

import 'package:chat_app/veiw_model/screens/registe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../components/widget/elevated_button_custom.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = AuthCubit.get(context);
                  return Form(
                    key: cubit.loginFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Icon(Icons.chat, size: 80.sp, color: Colors.grey[800]),
                        SizedBox(
                          height: 50.h,
                        ),
                        TextCustom(text: 'Welcome back you have been missed'),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormFieldCustom(hintText: 'Email',
                          controller: cubit.loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if ((value ?? '').isEmpty) {
                              return 'email is required';
                            } else if (!(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value ?? ''))) {
                              return 'email is invalid';
                            }
                            return null;
                          },),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormFieldCustom(
                          hintText: 'Password',
                          controller: cubit.loginPasswordController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if ((value ?? '').isEmpty) {
                              return 'Password is required';
                              // } else if (!(RegExp(
                              //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              //     .hasMatch(value ?? ''))) {
                              //   return 'Password is invalid';
                            } else if (value!.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ElevatedButtonCustom(
                            onPressed: () {
                              if (cubit.loginFormKey.currentState!.validate()) {
                                cubit.loginWithFireBase().then((value) =>{
                                  Navigation.push(context, HomeScreen())
                                });
                                }
                                },
                            text: 'Sign In',
                            backgroundColor: Colors.black,
                            color: Colors.white),
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextCustom(
                                text: 'Not a member ?',
                                color: Colors.black54,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigation.push(context, RegisterScreen());
                                  },
                                  child: TextCustom(
                                    text: 'Register Now',
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
