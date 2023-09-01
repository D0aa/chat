
import 'package:chat_app/veiw_model/components/widget/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/fire_user.dart';
class ConversationWidget extends StatelessWidget {
  final FireUser user;
  final void Function()? onTap;
  const ConversationWidget({required this.user, super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Material(
      borderRadius: BorderRadius.circular(12.sp),
      color: Colors.grey.withOpacity(.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap:onTap ,
        child: Row(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(text: user.name??''),
                  // Text(user.lastMessage??'',style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            // Text(user.time??'',style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
