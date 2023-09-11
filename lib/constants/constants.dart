import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ShowMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(content: Builder(builder: (context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            color:  Color.fromARGB(213, 154, 15, 201),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading ......"),
          )
        ],
      ),
    );
  }));

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case " ERROR_EMAIL_ALREADY_IN_UES":
      return "Email already used Go to login Page. ";
    case "account-exists-with-different-credential":
      return "Email already used. Go To Login Page.";
    case "email-already-in-user":
      return "Email already used> Go To Login Page.";
    case "ERROR_WRONG_PASSWORD":
      return "Wrong-password";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "error-user-not-found":
      return "No user found with this email.";
    case "ERROR-USER-DISABLED":
      return "User disabled";
    case "ERROR-TOO-MANY-REQESTS":
      return "Too many reqests to log into this account.";
    case "opraetion-not-allowed":
      return "Too many requests to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid.";
    default:
      return "Login failed. Please try agin.";
  }
}

bool loginVaildation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    ShowMessage("Both Fields are empty");
    return false;
  } else if (email.isEmpty) {
    ShowMessage("Email is Empty.");
    return false;
  } else if (password.isEmpty) {
    ShowMessage("Password is Empty.");
    return false;
  } else {
    return true;
  }
}

bool signUpVaildation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    ShowMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    ShowMessage("Name is Empty.");
    return false;
  } else if (phone.isEmpty) {
    ShowMessage("Phone is Empty.");
    return false;
  } else if (email.isEmpty) {
    ShowMessage("Email is Empty.");
    return false;
  } else if (password.isEmpty) {
    ShowMessage("Password is Empty.");
    return false;
  } else {
    return true;
  }
}
