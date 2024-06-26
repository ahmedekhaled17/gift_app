import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/views/screens/auth/welcome_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/datasource/static/static.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
MyServices myServices = Get.find();
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    bool isLast =false;
    return Scaffold(
        backgroundColor:const Color(0XFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                },
                child:  Text(
                    'skip',
                    style: TextStyle(color: AppColor.primary,fontSize: 22)
                ),
              ),
            )
          ],
        ),
      body:
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                   child: PageView.builder(
                      itemCount: onBoardingList.length,
                       controller: pageController,
                       physics: const BouncingScrollPhysics(),
                       onPageChanged: (int index){
                         if(index == onBoardingList.length-1) {
                           myServices.sharedPreferences.setString('onBoarding', '1');

                           isLast =true;
                         }
                       },
                      itemBuilder: (context,i) =>Column(
                        children: [
                          Expanded
                            (child: Lottie.asset(onBoardingList[i].image)),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(onBoardingList[i].title ,
                            style: TextStyle(
                              color: AppColor.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 24),
                          ),
                          const SizedBox(
                            height: 12,
                          ),

                           SizedBox(
                            width: double.infinity,
                            child: Text(onBoardingList[i].body,
                                style:TextStyle(
                                    color: AppColor.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                   ),
                 ),
                const SizedBox(height: 40,),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: onBoardingList.length,
                      effect:  ExpandingDotsEffect(
                        dotColor: AppColor.grey,
                        activeDotColor: AppColor.primary,
                        dotHeight: 12,
                        expansionFactor: 4,
                        dotWidth: 12,
                        spacing: 4,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      shape:const CircleBorder(),
                      onPressed: (){
                        if(isLast==true){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                        }
                        else {
                          pageController.nextPage(duration: const Duration(
                              milliseconds: 750
                          ), curve: Curves.fastLinearToSlowEaseIn
                          );
                        }
                      },
                      backgroundColor: AppColor.primary,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.white,
                      ),
                    )
                  ],
                ),
            ],
            ),
          ),
    );
  }
}
