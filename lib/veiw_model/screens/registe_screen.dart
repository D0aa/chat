import 'package:chat_app/veiw/data/bloc/auth_cubit.dart';
import 'package:chat_app/veiw/data/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/widget/elevated_button_custom.dart';
import '../components/widget/text_custom.dart';
import '../components/widget/text_form_field_custom.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  var cubit=AuthCubit.get(context);
                  return Form(
                    key: cubit.registerFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Icon(Icons.chat, size: 80.sp, color: Colors.grey[800]),
                        SizedBox(
                          height: 50.h,
                        ),
                        const TextCustom(
                            text: 'Let\'s create an account for you'),
                        SizedBox(
                          height: 10.h,
                        ),

                         TextFormFieldCustom(
                          hintText: 'Name',
                          controller: cubit.registerNameController,
                          keyboardType: TextInputType.name,
                          validator: (String? value) {
                            if ((value ?? '').isEmpty) {
                              return 'name is required';
                            }
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                         TextFormFieldCustom(hintText: 'Email',
                           controller: cubit.registerEmailController,
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
                           },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                         TextFormFieldCustom(
                          hintText: 'Password',
                          textInputAction: TextInputAction.done,
                           controller: cubit.registerPasswordController,
                           keyboardType: TextInputType.visiblePassword,
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
                        SizedBox(height: 20.h),
                        state is RegisterLoadingState?CircularProgressIndicator.adaptive():

                        SizedBox(
                          height: 15.h,
                        ),
                        ElevatedButtonCustom(
                            onPressed: () {
                              if(cubit.registerFormKey.currentState!.validate()){
                                cubit.registerWithFirebase().then((value) => Navigator.pop(context));
                              }
                            },
                            text: 'Sign Up',
                            backgroundColor: Colors.black,
                            color: Colors.white),
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextCustom(
                                text: 'Already a member ?',
                                color: Colors.black54,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const TextCustom(
                                    text: 'Login Now',
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
