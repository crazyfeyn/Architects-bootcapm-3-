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
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/onBoarding_1.png",
              width: 213.sp,
              height: 277.78.sp,
            ),
            40.height(),
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
            )
          ],
        ),
      ),
    );
  }
}
