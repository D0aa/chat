import 'package:chat_app/veiw/data/bloc/auth_cubit.dart';
import 'package:chat_app/veiw/data/bloc/auth_state.dart';
import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:chat_app/veiw_model/components/widget/text_custom.dart';
import 'package:chat_app/veiw_model/components/widget/text_form_field_custom.dart';
import 'package:chat_app/veiw_model/screens/chat_screen.dart';
import 'package:chat_app/veiw_model/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../veiw/data/local/local_keys.dart';
import '../../veiw/utils/navigation.dart';
import '../components/conversation/active_chat_widget.dart';
import '../components/conversation/conversation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg'),
          radius: 35,
        ),
        title: const TextCustom(text: 'Chats',fontSize: 24),
        centerTitle: false,
        actions:  [
          CircleAvatar(
            backgroundColor: Colors.white30,
            child: Icon(Icons.camera_alt, color: Colors.black54),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.white30,
            child: Icon(Icons.edit, color: Colors.black54),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
           onTap: (){
             Navigation.push(context, LoginScreen());
             CashHelper.clearDate();
           },
            child: CircleAvatar(
              backgroundColor: Colors.white30,
              child: Icon(Icons.logout, color: Colors.black54),
            ),
          ),
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=AuthCubit.get(context);
            AuthCubit.get(context).getUsers();
            return Column(
              children: [
                TextFormFieldCustom(
                  hintText: 'search',
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                    height: 110,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            ActiveChatWidget(
                              user: cubit.fireUsers[index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 5),
                        itemCount: cubit.fireUsers.length)),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          ConversationWidget(user: cubit.fireUsers[index],onTap: (){
                            String id=cubit.fireUsers[index].uid ??'';
                            String name=cubit.fireUsers[index].name ??'';
                            Navigation.push(context, ChatScreen(id: id,name: name,));
                          }),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            height: 7,
                          ),
                      itemCount: cubit.fireUsers.length),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
