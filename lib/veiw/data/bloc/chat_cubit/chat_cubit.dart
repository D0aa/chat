import 'package:bloc/bloc.dart';
import 'package:chat_app/model/fire_task.dart';
import 'package:chat_app/model/fire_user.dart';
import 'package:chat_app/veiw/data/bloc/chat_cubit/chat_state.dart';
import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:chat_app/veiw/data/local/local_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);
  FireUser? currentUser;
  TextEditingController newMessage = TextEditingController();

  Future<void> getProfile() async {
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: CashHelper.get(key: LocalKeys.uid))
        .get()
        .then((value) {
      for (var i in value.docs) {
        currentUser = FireUser.fromJson(i.data());
      }
      emit(GetProfileSuccessState());
    });
  }

  Future<void> sendMessage(String toUid) async {
    getProfile();
    FireMessage newMessgae = FireMessage(
        fromUid: currentUser?.uid,
        text: newMessage.text,
        createdAt: Timestamp.now(),
        toUid: toUid);
    List<String> ids=[currentUser?.uid??'',toUid];
    ids.sort();
    String ChatRoomId=ids.join('-');
    await FirebaseFirestore.instance.collection('chatRoom').doc(ChatRoomId)
        .collection('message')
        .add(newMessgae.toJson());
    newMessage.clear();
    emit(SendMessageSuccessState());
  }

  List<FireMessage> fireMessage = [];

  Future<void> getAllMessage(String toUid) async {
    List<String> ids=[currentUser?.uid??'',toUid];
    ids.sort();
    String ChatRoomId=ids.join('-');
    await FirebaseFirestore.instance.collection('chatRoom').doc(ChatRoomId)
        .collection('message')
        .orderBy('createdAt')
        .snapshots()
        .listen((value) {
      fireMessage = [];
      for (var i in value.docs) {
        FireMessage all = FireMessage.fromJson(
          i.data(),
        );
        fireMessage.add(all);
      }
      emit(GetAllMessageSuccessState());
    });
  }
}
