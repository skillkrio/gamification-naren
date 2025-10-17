// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer, ReadContext;

import 'package:roughdraft/core/constants/color_constants.dart' show AppColors;
import 'package:roughdraft/core/constants/sizing_constants.dart';
import 'package:roughdraft/core/widgets/core_nextbutton.dart';
import 'package:roughdraft/gamification/view/pages/dob_screen.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({
    Key? key,
    required this.questions,
    this.prevQuestion = '',
  }) : super(key: key);
  final String questions;
  final String prevQuestion;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  String? selectedGender;
  @override
  void initState() {
    super.initState();
    // selectedGender = context.read<GamificationController>().gender;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizing.dynamicHeaderTitlePadding,
      ),
      decoration: BoxDecoration(
        color: Color(AppColors.appBarForegroundColor),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizing.nameWidgetVerticalBorderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                "${widget.prevQuestion} ${context.read<GamificationController>().userName}",
                style: TextStyle(
                  color: Color(AppColors.genderPrevQuestionTextColor),
                  fontSize: AppSizing.genderScreenPrevQuestionHeight,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 30),
              Text(
                widget.questions,
                style: TextStyle(
                  color: Color(AppColors.genderQuestionTextColor),
                  fontSize: AppSizing.genderScreenQuestionHeight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  IntrinsicWidth(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Male"),
                      leading: Radio<String>(
                        value: "male",
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                            context.read<GamificationController>().setGender(
                              selectedGender!,
                            );
                          });
                        },
                      ),
                    ),
                  ),
                  IntrinsicWidth(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Female'),
                      leading: Radio<String>(
                        value: "female",
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                            print("Button value: $value");
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Consumer<GamificationController>(
                builder: (context, gamificationController, child) =>
                    GestureDetector(
                      onTap: () {
                        if (selectedGender != null) {
                          //Next Page
                          context.read<GamificationController>().setGender(
                            selectedGender!,
                          );
                          context.read<GamificationController>().index++;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DobScreen();
                              },
                            ),
                          );
                        }
                      },
                      child: CoreNextButton(
                        gamificationController: gamificationController,
                        isSelectedState: gamificationController.gender != null
                            ? true
                            : false,
                      ),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
