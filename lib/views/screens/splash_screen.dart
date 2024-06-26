import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/constant/image_assets.dart';
import 'package:graduation_project/views/screens/language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
       const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Language(),
       ),
      );
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: Image.asset(AppImageAsset.splashScreen),
              ),
            ),
           const Text('Developed By My Team',
             style: TextStyle(
                 color:Color(0XFFC57C28),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
