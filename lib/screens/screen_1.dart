
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_textstyle.dart';
import '../models/additional_cover.dart';
import '../widgets/collapsed_card.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/expanded_card.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  ExpandableController firstController = ExpandableController();
  ExpandableController secondController = ExpandableController();

  List<AdditionalCover> coverList = [
    AdditionalCover(
      index: 1,
      name: "Cruise Cover",
      isSelected: false,
    ),
    AdditionalCover(
      index: 2,
      name: "Travel Disruption Option",
      isSelected: false,
    ),
    AdditionalCover(
      index: 3,
      name: "Vacation Rental Protection",
      isSelected: false,
    ),
    AdditionalCover(
      index: 4,
      name: "Personal liability option",
      isSelected: false,
    ),
    AdditionalCover(
      index: 5,
      name: "Adventure and extreme sports",
      isSelected: false,
    ),
    AdditionalCover(
      index: 6,
      name: "Winter Sports",
      isSelected: false,
    ),
    AdditionalCover(
      index: 7,
      name: "Gadget Cover",
      isSelected: false,
    ),
    AdditionalCover(
      index: 8,
      name: "Golf Cover",
      isSelected: false,
    ),
    AdditionalCover(
      index: 9,
      name: "Single item cover",
      isSelected: false,
    ),
    AdditionalCover(
      index: 10,
      name: "Excess waver",
      isSelected: false,
    ),
    AdditionalCover(
      index: 11,
      name: "Car hire Excess waiver",
      isSelected: false,
    ),
  ];

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.appBackgroundColor,
      // backgroundColor: CustomColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Appbar
              CustomAppBar(size: size),
              //User photo
              Padding(
                padding: const EdgeInsets.fromLTRB(133, 20, 25, 0),
                child: Image.asset("assets/images/main_screen_avator.png",height: 120),
              ),
              //Title Text
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text("Hi, I'm Amber.", style: CustomTextStyle.larkenTextRegular.copyWith(fontSize: 34)),
              ),
              //Sub Text
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 6, 25, 0),
                child: Text("What type of cover would you like a quote for?", style: CustomTextStyle.larkenTextRegular.copyWith(fontSize: 36)),
              ),
              //Annual Cover
              ExpandablePanel(
                controller: firstController,
                theme: const ExpandableThemeData(
                  useInkWell: false,
                  hasIcon: false,
                ),
                collapsed: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 69, 25, 10),
                  child: CollapsedCard(
                      titleText: "Annual cover",
                      subTitleText: "Recommended if you travel 2+ times per year",
                      onTap: () {
                        setState(() {
                          firstController.toggle();
                        });
                      },
                      price: "1180"),
                ),
                expanded: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 69, 25, 10),
                  child: ExpandedCard(
                    titleText: "Annual cover",
                    subTitleText: "Recommended if you travel 2+ times per year",
                    onTap: () {
                      setState(() {
                        firstController.toggle();
                      });
                    },
                    price: "1180",
                    coverList: coverList,
                    secondTitleText: 'Destinations to cover?',
                    secondSubtitleText: 'Select the destinations to cover.',
                    firstScreen: false,
                  ),
                ),
              ),
              //Single Cover
              ExpandablePanel(
                controller: secondController,
                theme: const ExpandableThemeData(
                  useInkWell: false,
                  hasIcon: false,
                ),
                collapsed: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 69, 25, 10),
                  child: CollapsedCard(
                      titleText: "Single trip cover",
                      subTitleText: "If you’re only going away for less then 90 days.",
                      onTap: () {
                        setState(() {
                          secondController.toggle();
                        });
                      },
                      price: "180"),
                ),
                expanded: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 69, 25, 10),
                  child: ExpandedCard(
                    titleText: "Single trip cover",
                    subTitleText: "If you’re only going away for less then 90 days.",
                    onTap: () {
                      setState(() {
                        secondController.toggle();
                      });
                    },
                    price: "180",
                    coverList: coverList,
                    secondTitleText: 'Where are you going?',
                    secondSubtitleText: 'Travelling to multiple countries?\nPlug them in!',
                    firstScreen: true,
                  ),
                ),
              ),
              //Quote Button
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 37, 25, 0),
                child: Container(
                  width: double.infinity,
                  height: 65,
                  decoration: const BoxDecoration(
                    color: CustomColors.gray,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Center(
                    child: Text(
                      "Get your quote",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,fontFamily: "LarkenDEMO-Italic.otf"
                      ),
                    ),
                  ),
                ),
              ),
              //Referral Code
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 37, 25, 0),
                child: Center(
                  child: Text(
                    "Have a friend’s referral code?",
                    style: CustomTextStyle.interText.copyWith(fontSize: 18, decoration: TextDecoration.underline),
                  ),
                ),
              ),
              //bottom Padding
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
