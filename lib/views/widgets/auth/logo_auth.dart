import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/constant/image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0XFFAB6A28),
      radius: 70,
      child: CircleAvatar(
        radius: 67,
        backgroundImage: AssetImage(AppImageAsset.logo),
      ),
    );
  }
}