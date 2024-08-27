import 'package:calories_fitness_app/component/constant_component/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton {
  static Widget mainButton({
    required BuildContext context,
    final double? height,
    final double? width,
    required String text,
    required void Function()? onTap,
    final Color? borderColor,
    final double? borderWidth,
    final Color? boxColor,
    final Color? textColor,
    final double? fontsize,
  }) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceHeight * .03),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? deviceHeight * .07,
          width: width ?? deviceWidth * .5,
          decoration: BoxDecoration(
            color: boxColor ?? AppColor.mainColor,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: borderColor ?? AppColor.mainColor,
              width: borderWidth ?? 1.0,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.ubuntu(fontSize: fontsize ?? 20.0, color: textColor ?? AppColor.whiteColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  static Widget checkButton({
    required bool value, 
    required ValueChanged<bool?> onChanged, 
    required String text, 
    TextDecoration? decoration,
    }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            shape: const CircleBorder(),
            checkColor: AppColor.whiteColor,
            activeColor: Colors.green,
            tristate: true,
            side: const BorderSide(color: AppColor.blackColor, width: 1.0),
            value: value,
            onChanged: onChanged),
        const SizedBox(width: 2.0),
        Text(
          text, style: GoogleFonts.ubuntu(fontSize: 12.0, fontWeight: FontWeight.w400, color: AppColor.greyColor, decoration: decoration)),
      ],
    );
  }
}
