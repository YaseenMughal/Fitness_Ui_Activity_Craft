import 'package:calories_fitness_app/component/constant_component/color_constant.dart';
import 'package:calories_fitness_app/component/widget_component/app_widget.dart';
import 'package:calories_fitness_app/component/widget_component/button_widget.dart';
import 'package:calories_fitness_app/provider/checkBox_provider.dart';
import 'package:calories_fitness_app/screens/plandetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
              AppWidget.topBar(),
              const SizedBox(height: 20.0),
              AppWidget.topBanner(context),
              AppWidget.doubleText(
                text: "Category",
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: categoryBox(
                      planText: "Personal",
                      planCount: "3",
                      width: deviceWidth * .4,
                      icon: Icons.person_2_outlined,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 5,
                    child: categoryBox(
                      planText: "Work",
                      planCount: "8",
                      width: deviceWidth * .4,
                      icon: Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
              AppWidget.doubleText(
                text: "On Going Plan",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PlanDetailScreen()));
                },
              ),
              Consumer<CheckBoxProvider>(
                builder: (context, value, child) {
                  return planBox(
                    title: "Creating webflow design and\nresponsive on mobile",
                    check1Text: "Create Lo Fi",
                    check2Text: "Create Landing Page",
                    value1: value.checkBox1,
                    onChanged1: (p0) {
                      value.toggleCheckBox1();
                    },
                    value2: value.checkBox2,
                    onChanged2: (p0) {
                      value.toggleCheckBox2();
                    },
                    icon: Icons.menu_book_sharp,
                  );
                },
              ),
              Consumer<CheckBoxProvider>(
                builder: (context, value, child) {
                  return planBox(
                    title: "Workout",
                    check1Text: "Jogging Fort",
                    check2Text: "Running",
                    value1: value.checkBox3,
                    onChanged1: (p0) {
                      value.toggleCheckBox3();
                    },
                    value2: value.checkBox4,
                    onChanged2: (p0) {
                      value.toggleCheckBox4();
                    },
                    icon: Icons.run_circle_outlined,
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget categoryBox({required String? planText, required String? planCount, required double? width, required IconData? icon}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlanDetailScreen()));
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.greyColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppWidget.iconWidget(
                    icon: icon,
                    boxColor: AppColor.mainColor,
                    iconColor: AppColor.greyColor,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    "$planText Plan",
                    style: GoogleFonts.ubuntu(fontSize: 12.0, color: AppColor.mainColor, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Text(
                "$planCount Plans Remaining",
                style: GoogleFonts.ubuntu(fontSize: 14.0, color: AppColor.greyColor, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Go to Plan",
                    style: GoogleFonts.ubuntu(fontSize: 14.0, color: AppColor.mainColor, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 10.0),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColor.mainColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget planBox(
      {required String title,
      required String check1Text,
      required String check2Text,
      required bool value1,
      required ValueChanged<bool?> onChanged1,
      required bool value2,
      required ValueChanged<bool?> onChanged2,
      required IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.greyColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidget.iconWidget(icon: icon),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.ubuntu(fontSize: 16.0, color: AppColor.mainColor, fontWeight: FontWeight.w600),
                  ),
                  AppButton.checkButton(
                    value: value1,
                    onChanged: onChanged1,
                    text: check1Text,
                    decoration: value1 == true ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                  AppButton.checkButton(
                    value: value2,
                    onChanged: onChanged2,
                    text: check2Text,
                    decoration: value2 == true ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
