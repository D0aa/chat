import 'package:chat_app/veiw/data/bloc/auth_cubit.dart';
import 'package:chat_app/veiw/data/bloc/chat_cubit/chat_cubit.dart';
import 'package:chat_app/veiw/data/local/cash_helper.dart';
import 'package:chat_app/veiw_model/screens/login_page.dart';
import 'package:chat_app/veiw_model/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  // CashHelper.clearDate();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AuthCubit(),
                ),
                BlocProvider(
                  create: (context) => ChatCubit(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                  useMaterial3: true,
                ),
                home: const SplashScreen(),
              ));
        });
  }
}
