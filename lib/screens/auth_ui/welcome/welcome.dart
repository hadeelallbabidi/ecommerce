import 'package:ecommeres/constants/routes.dart';
import 'package:ecommeres/screens/auth_ui/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/priamary_button/primary.button.dart';
import '../../../widgets/top_titles/top_titles.dart';
import '../sign_up/sign_up.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopTitle(
              title: "Welcome",
              subtitle: "Buy any item from using app",
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Image.asset(
              "assets/images/welcome2.png",
              width: 300,
            )),
          
            const SizedBox(
              height: 18.0,
            ),
            PrimarButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push(widget: const Login(), context:context);
              },
            ),
            const SizedBox(
              height: 18.0,
            ),
            PrimarButton(
              title: "Sign Up",
              onPressed: () {
                 Routes.instance
                        .push(widget: const SignUp(), context: context);
              },
            )
          ],
        ),
      ),
    );
  }
}
