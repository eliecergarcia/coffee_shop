import 'package:flutter/material.dart';

class ButtonCategory extends StatelessWidget {
  final String title;
  final Function onTap;
  const ButtonCategory({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style:const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 8, 62, 133),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
