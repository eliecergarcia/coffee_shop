import 'package:flutter/material.dart';

class ButtonAddMinusCarShop extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const ButtonAddMinusCarShop(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed as void Function()?,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
