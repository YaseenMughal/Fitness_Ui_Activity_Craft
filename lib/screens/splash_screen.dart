import 'package:calories_fitness_app/component/constant_component/color_constant.dart';
import 'package:calories_fitness_app/component/constant_component/image_constant.dart';
import 'package:calories_fitness_app/component/widget_component/bottom_nav_bar.dart';
import 'package:calories_fitness_app/component/widget_component/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: deviceHeight,
            width: deviceWidth,
            decoration: const BoxDecoration(color: AppColor.blackColor),
            child: Image.asset(AppImage.mainImage, fit: BoxFit.fill),
          ),
          Container(
            height: deviceHeight * .4,
            width: deviceWidth,
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Manage Your Daily\n Activity So Easily",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(color: AppColor.mainColor, fontWeight: FontWeight.w700, fontSize: deviceWidth * .08),
                ),
                SizedBox(height: deviceHeight * .02),
                Text(
                  "This smart tool is designed to help you\n manager your daily activity.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(fontSize: deviceWidth * .045, fontWeight: FontWeight.w400, color: AppColor.greyColor),
                ),
                AppButton.mainButton(
                  width: deviceWidth * .9,
                  context: context,
                  text: "Get Started",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavBar()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
