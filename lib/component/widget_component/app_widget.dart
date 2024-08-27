
import 'package:calories_fitness_app/component/constant_component/color_constant.dart';
import 'package:calories_fitness_app/component/widget_component/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AppWidget {
  
  static topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: GoogleFonts.ubuntu(fontSize: 14.0, color: AppColor.greyColor, fontWeight: FontWeight.w400),
            ),
            Text(
              "Zaire Carder",
              style: GoogleFonts.ubuntu(fontSize: 20.0, color: AppColor.mainColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        AppWidget.iconWidget(icon: Icons.notifications_outlined),
      ],
    );
  }

  static doubleText({required String text, required void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.ubuntu(fontSize: 20.0, color: AppColor.mainColor, fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              "See all",
              style: GoogleFonts.ubuntu(fontSize: 14.0, color: AppColor.greyColor, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  static iconWidget({required IconData? icon, Color? iconColor, Color? boxColor}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: boxColor ?? Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Icon(icon ?? Icons.notifications_outlined, color: iconColor ?? AppColor.blackColor),
      ),
    );
  }

  static topBanner(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;
    return Container(
      width: deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColor.mainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Excellent, today's your\nplan is almost done",
                  style: GoogleFonts.ubuntu(fontSize: 16.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                ),
                AppButton.mainButton(
                  context: context,
                  height: deviceHeight * .05,
                  width: deviceWidth * .3,
                  fontsize: 14,
                  text: "View Plan",
                  boxColor: AppColor.whiteColor,
                  textColor: AppColor.mainColor,
                  onTap: () {},
                )
              ],
            ),
            CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 10,
              backgroundColor: AppColor.greyColor,
              progressColor: AppColor.whiteColor,
              animation: true,
              percent: 0.8,
              center: const Text(
                "80.0%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static appDialog(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        insetPadding: EdgeInsets.symmetric(vertical: deviceHeight * .3),
        title: Text(
          "Add Your Daily Activity.",
          style: GoogleFonts.poppins(fontSize: deviceWidth * .04, color: AppColor.mainColor, fontWeight: FontWeight.w800),
        ),
        content: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 1.0, color: AppColor.mainColor.withOpacity(0.2)), borderRadius: BorderRadius.circular(20.0)),
            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, color: AppColor.mainColor), borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.mainButton(
                context: context,
                height: deviceHeight * .03,
                width: deviceWidth * .2,
                fontsize: 14.0,
                text: "Cancel",
                boxColor: AppColor.errorColor,
                onTap: () => Navigator.of(context).pop,
              ),
              SizedBox(
                width: deviceWidth * .03,
              ),
              AppButton.mainButton(
                context: context,
                height: deviceHeight * .04,
                width: deviceWidth * .3,
                fontsize: 16.0,
                text: "Submit",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
