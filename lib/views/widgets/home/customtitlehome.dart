import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String title ;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: TextStyle(
              fontSize: 20,
              color: AppColor.primary,
              fontWeight: FontWeight.bold)),
    );
  }
}