// ignore_for_file: use_build_context_synchronously
import 'package:ecommeres/constants/constants.dart';
import 'package:ecommeres/constants/routes.dart';
import 'package:ecommeres/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommeres/screens/auth_ui/sign_up/sign_up.dart';
import 'package:ecommeres/screens/home/home.dart';
import 'package:ecommeres/widgets/priamary_button/primary.button.dart';
import 'package:ecommeres/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              const TopTitle(
                title: "Login ",
                subtitle: " Welcome Back To E Commerce to Storia",
              ),
              const SizedBox(
                height: 46.0,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined), hintText: "E-mail"),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password_outlined),
                    hintText: "Password",
                    suffixIcon: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: Icon(
                          isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ))),
              ),
              const SizedBox(
                height: 36.0,
              ),
              PrimarButton(
                title: "LOGIN",
                onPressed: () async {
                  bool isVaildated = loginVaildation(email.text, password.text);
                  if (isVaildated) {
                    bool isLoagined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLoagined) {
                      Routes.instance.pushAndRemoverUntil(
                          widget: const Home(), context: context);
                      // }
                    }
                  }
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Center(child: Text("Don't have an account?")),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: const SignUp(), context: context);
                  },
                  child: Text(
                    "Cearte an Account",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
