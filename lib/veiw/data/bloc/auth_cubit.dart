import 'package:bloc/bloc.dart';
import 'package:chat_app/model/fire_user.dart';
import 'package:chat_app/veiw/data/bloc/auth_state.dart';
import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../veiw_model/components/widget/toast_message.dart';
import '../local/local_keys.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();

  Future<void> loginWithFireBase() async {
    emit(LoginLoadingState());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text).then((value) async {
      print(value.user.toString());
      await CashHelper.put(key: LocalKeys.uid, value: value.user?.uid);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is FirebaseException) {
        print(error.message);
        showToast(
            message: error.message ?? 'there is an error');
      }
      emit(LoginErrorState());
      throw error;
    });
  }

  Future<void> registerWithFirebase() async {
    emit(RegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: registerEmailController.text,
        password: registerPasswordController.text)

        .then((value) async {
      await FirebaseFirestore.instance.collection('users').add({
        'name': registerNameController.text,
        'email': registerEmailController.text,
        'uid': value.user?.uid,
      }

      ).then((value2) async {
        registerNameController.clear();
        registerPasswordController.clear();
        registerEmailController.clear();
        showToast(message: 'Register Successfully');
        emit(RegisterSuccessState());
      });
    }).catchError((error) {
      if (error is FirebaseException) {
        print(error.message);
        showToast(message: error.message ?? 'there is an error');
      }
      emit(RegisterErrorState());
      throw error;
    });
  }

  List<FireUser> fireUsers = [];

  Future<void> getUsers() async {
    emit(GetUsersLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((value) {
      fireUsers = [];
      for (var i in value.docs) {
        FireUser user = FireUser.fromJson(i.data());
        fireUsers.add(user);
        emit(GetUsersSuccessState());
      }
    });
  }




}
