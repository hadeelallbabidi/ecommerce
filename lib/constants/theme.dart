import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color.fromARGB(212, 202, 73, 245),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor:const  Color.fromARGB(213, 154, 15, 201),
          textStyle:const  TextStyle(color: Color.fromARGB(213, 154, 15, 201)),
          side: const BorderSide(
            color: Color.fromARGB(213, 154, 15, 201),
            width: 1.7,
          ),
          disabledForegroundColor:const 
              Color.fromARGB(213, 154, 15, 201).withOpacity(0.38)),
    ),
    textTheme:const TextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            disabledBackgroundColor: Colors.grey,
            textStyle: const TextStyle(
              color: Color.fromARGB(213, 154, 15, 201),
              fontSize: 18.0,
            )
            )),
            primarySwatch: Colors.purple,
            canvasColor:const Color.fromARGB(213, 154, 15, 201) ,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0.0,
              toolbarTextStyle: TextStyle(
                color: Colors.black,
              ),
              iconTheme: IconThemeData(color:  Color.fromARGB(213, 154, 15, 201))
            )
            );
OutlineInputBorder outlineInputBorder =
    const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
