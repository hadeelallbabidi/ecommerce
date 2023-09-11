import 'package:flutter/material.dart';


class TopTitle extends StatelessWidget {
  final String title, subtitle;
  const TopTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*const SizedBox(
          height: 12.0,
        ),
        if (title == "Loogin" ) const BackButton(),*/
        Text(
          title,
          style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
              color:  Color.fromARGB(213, 154, 15, 201)),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(subtitle,
            style: const TextStyle(
                fontSize: 19.0,
                color:  Color.fromARGB(213, 154, 15, 201),
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
