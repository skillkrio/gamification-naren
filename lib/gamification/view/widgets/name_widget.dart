import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/core/constants/app_constants.dart';
import 'package:roughdraft/core/constants/color_constants.dart';
import 'package:roughdraft/core/constants/sizing_constants.dart';
import 'package:roughdraft/core/utils/text_field_utils.dart';
import 'package:roughdraft/core/widgets/core_nextbutton.dart';
import 'package:roughdraft/gamification/model/dynamic_widget_model.dart'
    show DynamicWidgetModel;
import 'package:roughdraft/gamification/view/pages/gamification_gender_screen.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({super.key, this.questions = "", this.hintText = ''});
  final String questions;
  final String hintText;

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  widget.questions,
                  style: TextStyle(
                    color: Color(AppColors.nameWidgetTitleColor),
                    fontWeight: FontWeight.w500,
                    fontSize: AppSizing.nameWidgetTitleSize,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  maxLength: 5,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  decoration: InputDecoration(
                    counterText: "",
                    hint: Text(
                      widget.hintText,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: AppSizing.nameWidgetHintTextSize,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Color(AppColors.textFieldFillColor),
                    filled: true,
                  ),
                  onChanged: (value) {
                    context.read<GamificationController>().setUserName(
                      value.trim(),
                    );
                  },
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return TextFieldConstants.nameCannotBeEmpty;
                    } else if (value!.isEmpty) {
                      return TextFieldConstants.minumumNameLength;
                    }
                    return null;
                  },
                ),
              ],
            ),
            Consumer<GamificationController>(
              builder: (context, gamificationController, child) =>
                  GestureDetector(
                    onTap: () {
                      if (gamificationController.userName == null) {
                        return;
                      } else if (_formKey.currentState!.validate()) {
                        //Next Page

                        context.read<GamificationController>().index++;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamificationGenderScreen(
                              prevQuestion: widget.questions,
                            ),
                          ),
                        ).then((value) {
                          context
                              .read<GamificationController>()
                              .recalculateProgress();
                        });
                      }
                    },
                    child: CoreNextButton(
                      isSelectedState: gamificationController.userName != null
                          ? true
                          : false,
                      gamificationController: gamificationController,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
