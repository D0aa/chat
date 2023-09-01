import 'package:chat_app/veiw/data/bloc/auth_cubit.dart';
import 'package:chat_app/veiw/data/bloc/auth_state.dart';
import 'package:chat_app/veiw/data/bloc/chat_cubit/chat_cubit.dart';
import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:chat_app/veiw/data/local/local_keys.dart';
import 'package:chat_app/veiw_model/components/conversation/message_wedgit.dart';
import 'package:chat_app/veiw_model/components/widget/text_custom.dart';
import 'package:chat_app/veiw_model/components/widget/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../veiw/data/bloc/chat_cubit/chat_state.dart';

class ChatScreen extends StatelessWidget {
  final String id;
  final String name;
  final MainAxisAlignment? mainAxisAlignment;
  const ChatScreen({super.key,required this.id,required this.name, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    var cubit=ChatCubit.get(context);
    ChatCubit.get(context).getProfile();

    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ChatCubit.get(context).getAllMessage(id);
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.black26,
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg'),
              radius: 15,
            ),
            title:  TextCustom(text: name.split(' ').first ??'',fontSize: 24),
            centerTitle: false,
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white30,
                child: Icon(Icons.call, color: Colors.black54),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white30,
                child: Icon(Icons.video_camera_back, color: Colors.black54),
              ),
              SizedBox(
                width: 10,
              ),


            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 8.sp,left: 8.sp,right: 8.sp),
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                         Flex(
                           direction: Axis.horizontal,
                             mainAxisAlignment: cubit.fireMessage[index].fromUid==CashHelper.get(key: LocalKeys.uid)?
                             MainAxisAlignment.end:MainAxisAlignment.start,
                             children: [
                           MessageWidget(
                             message: cubit.fireMessage[index],
                           ),
                         ]) ,
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            height: 7,
                          ),
                      itemCount: cubit.fireMessage.length ??0),
                ),
                Row(
                  children: [
                    Expanded(child: TextFormFieldCustom(
                      hintText: 'add your message',
                      controller: cubit.newMessage,
                      validator: (value) {
                        if ((value ?? '').trim().isEmpty) {
                          return 'Must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    ),
                    IconButton(onPressed: () async {
                      cubit.sendMessage(id);
                    }, icon: Icon(Icons.send_rounded))
                  ],
                )
              ],
            ),
          )
        );
      },
    );
  }
}
