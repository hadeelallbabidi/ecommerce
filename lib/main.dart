import 'package:ecommeres/constants/theme.dart';
import 'package:ecommeres/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommeres/firebase_helper/firebase_options/firebase_options.dart';
import 'package:ecommeres/provider/app_provider.dart';
import 'package:ecommeres/screens/auth_ui/welcome/welcome.dart';
import 'package:ecommeres/screens/custom_bottom_bar/custom_buttom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-commeres',
          theme: themeData,
          home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomBottomBar();
              }
              return const welcome();
            },
          )),
    );
  }
}
