
import 'package:chat_app/model/fire_user.dart';
import 'package:chat_app/veiw_model/components/widget/text_custom.dart';
import 'package:flutter/material.dart';
class ActiveChatWidget extends StatelessWidget {
  final FireUser user;
  const ActiveChatWidget({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage('https://i.pinimg.com/736x/10/91/94/1091948c6b80b65b9eef8c163f0ae42a.jpg'),
            ),

            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.lightGreen,
            )
          ],
        ),
        SizedBox(width: 10,),
        TextCustom(text: user.name?.split(' ').first??''),
      ],
    );
  }
}
