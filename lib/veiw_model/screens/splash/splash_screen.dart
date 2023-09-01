import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:chat_app/veiw_model/screens/chat_screen.dart';
import 'package:chat_app/veiw_model/screens/home_screen.dart';
import 'package:chat_app/veiw_model/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../veiw/data/local/local_keys.dart';
import '../../../veiw/utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      if(CashHelper.get(key: LocalKeys.uid) ==null){
      Navigation.pushAndRemove(context, LoginScreen());}
      else {Navigation.push(context, HomeScreen());}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.chat, size: 80.sp, color: Colors.grey[800]),
      ),
    );
  }
}
