// ignore_for_file: use_build_context_synchronously

import 'package:ecommeres/constants/constants.dart';
import 'package:ecommeres/constants/routes.dart';
import 'package:ecommeres/screens/home/home.dart';
import 'package:ecommeres/widgets/priamary_button/primary.button.dart';
import 'package:ecommeres/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                title: "Create Account ",
                subtitle: " Welcome To E-commerec",
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: "Name"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined), hintText: "E-mail"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_outlined), hintText: "Phone"),
              ),
              const SizedBox(
                height: 10.0,
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
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              PrimarButton(
                title: "Create an account",
                onPressed: () async {
                  bool isVaildated = signUpVaildation(
                      email.text, password.text, name.text, phone.text);
                  if (isVaildated) {
                    bool isLoagined = await FirebaseAuthHelper.instance
                        .singUp(name.text, email.text, password.text, context);
                    if (isLoagined) {
                      Routes.instance.pushAndRemoverUntil(
                          widget: const Home(), context: context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Center(child: Text("I have already an account?")),
              const SizedBox(
                height: 4.0,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
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
