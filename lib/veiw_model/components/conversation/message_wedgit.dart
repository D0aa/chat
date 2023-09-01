import 'package:chat_app/model/fire_task.dart';
import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:chat_app/veiw/data/local/local_keys.dart';
import 'package:chat_app/veiw_model/components/widget/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWidget extends StatelessWidget {
  final FireMessage message;

  MessageWidget({super.key, required this.message});

  BorderRadiusGeometry? sendBorder = BorderRadiusDirectional.only(
    topStart: Radius.circular(12.r),
    bottomEnd: Radius.circular(12.r),
    bottomStart: Radius.circular(12.r),
  );
  BorderRadiusGeometry? receiveBorder = BorderRadiusDirectional.only(
    topEnd: Radius.circular(12.r),
    bottomEnd: Radius.circular(12.r),
    topStart: Radius.circular(12.r),
  );

  @override
  Widget build(BuildContext context) {
    bool isSender = message.fromUid == CashHelper.get(key: LocalKeys.uid);
    return Container(
      // constraints: const BoxConstraints(
      // maxWidth: 200,),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: isSender ? Colors.black12 : Colors.white70,
        borderRadius: isSender ? sendBorder : receiveBorder,
      ),
      child: TextCustom(
          text: message.text ?? '', fontSize: 12.sp,
          ),
    );
  }
}
