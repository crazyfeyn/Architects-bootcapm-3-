import 'package:application/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        leadingWidth: 75.sp,
        leading: TextButton(
            onPressed: () {},
            child: Text(
              'SKIP',
              style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/onBoarding_1.png",
                          width: 213.sp,
                          height: 277.78.sp,
                        ),
                        80.height(),
                        SizedBox(
                          width: 94.83.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 26.28.sp,
                                height: 4.sp,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Container(
                                width: 26.28.sp,
                                height: 4.sp,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Container(
                                width: 26.28.sp,
                                height: 4.sp,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Manage your tasks",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 32.sp,
                              color: Color(0xFFFFFFFF)),
                        ),
                        30.height(),
                        Text(
                          "You can easily manage all of your daily tasks in DoMe for free",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.sp)),
                        backgroundColor: Color(0xFF8875FF)),
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
