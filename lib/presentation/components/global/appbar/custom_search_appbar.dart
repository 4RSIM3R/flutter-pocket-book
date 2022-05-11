import 'package:flutter/material.dart';

class CustomSearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSearchAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Text('This is me'),
      ),
      preferredSize: Size(double.infinity, 100),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 100);
}
