import 'package:calories_fitness_app/component/constant_component/color_constant.dart';
import 'package:calories_fitness_app/component/widget_component/button_widget.dart';
import 'package:calories_fitness_app/provider/activityCheck_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanDetailScreen extends StatefulWidget {
  const PlanDetailScreen({super.key});

  @override
  State<PlanDetailScreen> createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  final TextEditingController _activityController = TextEditingController();

  final List<Map<String, dynamic>> calories = [
    {
      "caloriesIcon": Icons.fireplace_outlined,
      "caloriesIconColor": Colors.orange,
      "caloriesCount": "130kkal",
      "caloriesText": "Calories burn",
    },
    {
      "caloriesIcon": Icons.energy_savings_leaf_outlined,
      "caloriesIconColor": Colors.yellow,
      "caloriesCount": "13g",
      "caloriesText": "Fat",
    },
    {
      "caloriesIcon": Icons.playlist_add_circle_outlined,
      "caloriesIconColor": Colors.green,
      "caloriesCount": "20g",
      "caloriesText": "Carbs",
    },
    {
      "caloriesIcon": Icons.safety_check_outlined,
      "caloriesIconColor": Colors.brown,
      "caloriesCount": "21.1g",
      "caloriesText": "Protein",
    },
  ];

  final List<String> activities = [
    "Streching 1 mins",
    "Jogging 5 km",
    "Yoga 60 mins",
    "Weight lifting",
    "Upper body workout",
    "Lower body workout",
  ];

  void _addActivity() {
    if (_activityController.text.isNotEmpty) {
      setState(() {
        activities.add(_activityController.text);
      });
      Provider.of<ActivityCheckProvider>(context, listen: false).addActivites();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plan Detail",
          style: GoogleFonts.ubuntu(
            fontSize: 16.0,
            color: AppColor.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceWidth,
                  child: EasyDateTimeLine(
                    activeColor: AppColor.mainColor,
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
                    },
                    headerProps: const EasyHeaderProps(
                      monthPickerType: MonthPickerType.dropDown,
                      showMonthPicker: true,
                      showHeader: true,
                      centerHeader: false,
                      showSelectedDate: true,
                      dateFormatter: DateFormatter.fullDateDMY(),
                    ),
                    dayProps: EasyDayProps(
                      dayStructure: DayStructure.dayStrDayNum,
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.blackColor,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      activeDayStyle: const DayStyle(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColor.mainColor,
                              AppColor.blackColor,
                            ],
                            // colors: [
                            //   // AppColor.BasicColor,
                            //   // AppColor.greyColor,
                            //   Color(0xff3371FF),
                            //   Color(0xff8426D6),
                            // ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: deviceHeight * .03),
                Text(
                  "Workout Report",
                  style: GoogleFonts.ubuntu(fontSize: 20.0, color: AppColor.mainColor, fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: workoutBox(
                        icon: calories[0]['caloriesIcon'],
                        color: calories[0]['caloriesIconColor'],
                        caloryCount: calories[0]['caloriesCount'],
                        caloryText: calories[0]['caloriesText'],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: workoutBox(
                        icon: calories[1]['caloriesIcon'],
                        color: calories[1]['caloriesIconColor'],
                        caloryCount: calories[1]['caloriesCount'],
                        caloryText: calories[1]['caloriesText'],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: deviceHeight * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: workoutBox(
                        icon: calories[2]['caloriesIcon'],
                        color: calories[2]['caloriesIconColor'],
                        caloryCount: calories[2]['caloriesCount'],
                        caloryText: calories[2]['caloriesText'],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: workoutBox(
                        icon: calories[3]['caloriesIcon'],
                        color: calories[3]['caloriesIconColor'],
                        caloryCount: calories[3]['caloriesCount'],
                        caloryText: calories[3]['caloriesText'],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: deviceHeight * .03),
                Text(
                  "Activity",
                  style: GoogleFonts.ubuntu(fontSize: 20.0, color: AppColor.mainColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: deviceHeight * .02),
                SizedBox(
                  height: deviceHeight * .5,
                  width: deviceWidth,
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                            height: deviceHeight * .1,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              color: AppColor.greyColor.withOpacity(0.2),
                            ),
                            child: Consumer<ActivityCheckProvider>(
                              builder: (context, value, child) {
                                return AppButton.checkButton(
                                  value: value.activities[index],
                                  onChanged: (p0) {
                                    value.toggleActivites(index);
                                  },
                                  text: activities[index],
                                  decoration: value.activities[index] ? TextDecoration.lineThrough : TextDecoration.none,
                                );
                              },
                            )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Activity",
        backgroundColor: Colors.green,
        onPressed: () => _showAddActivityDialog(context),
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }

  void _showAddActivityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add Your Daily Activity.",
          style: GoogleFonts.poppins(fontSize: 16, color: AppColor.mainColor, fontWeight: FontWeight.w800),
        ),
        content: TextField(
          controller: _activityController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: AppColor.mainColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2.0, color: AppColor.mainColor),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => _addActivity(),
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  Widget workoutBox({required IconData icon, required String caloryCount, required String caloryText, required Color color}) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: deviceHeight * .08,
              width: deviceWidth * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColor.greyColor.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: AppColor.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(icon, color: color),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          caloryCount,
                          style: GoogleFonts.poppins(fontSize: 14.0, color: AppColor.blackColor, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          caloryText,
                          style: GoogleFonts.poppins(fontSize: 12.0, color: AppColor.greyColor, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
