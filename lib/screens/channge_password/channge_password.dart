// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../constants/constants.dart';
// import '../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
// import '../../widgets/priamary_button/primary.button.dart';

// class ChanngePassword extends StatefulWidget {
//   const ChanngePassword({super.key});

//   @override
//   State<ChanngePassword> createState() => _ChanngePasswordState();
// }

// class _ChanngePasswordState extends State<ChanngePassword> {
//   @override
//   bool isShowPassword = true;
//   TextEditingController newpassword = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Change Password",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         children: [
//           TextFormField(
//             controller: newpassword,
//             obscureText: isShowPassword,
//             decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.password_outlined),
//                 hintText: "New Password",
//                 suffixIcon: CupertinoButton(
//                     onPressed: () {
//                       setState(() {
//                         isShowPassword = !isShowPassword;
//                       });
//                     },
//                     child: const Icon(
//                       Icons.visibility,
//                       color: Colors.grey,
//                     ))),
//           ),
//            const SizedBox(
//             height: 12.0,
//           ),
//           TextFormField(
//             controller: confirmpassword,
//             obscureText: isShowPassword,
//             decoration:const InputDecoration(
//                 prefixIcon:  Icon(Icons.password_outlined),
//                 hintText: "Confirm Password",
                
//                 ),
//           ),
//             const SizedBox(height: 12.0,),
//            PrimarButton(
//             title: "Update",
//             onPressed: () async {
//              if (newpassword.text.isEmpty) {
//                 ShowMessage("New Password is empty");
//               } else if (confirmpassword.text.isEmpty) {
//                 ShowMessage("Confirm Password is empty");
//               } else if (confirmpassword.text == newpassword.text) {
//                 FirebaseAuthHelper.instance
//                     .ChanngePassword(newpassword.text, context);
//               } else {
//                 ShowMessage("Confrim Password is not match");
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
