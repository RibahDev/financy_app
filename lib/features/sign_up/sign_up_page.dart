import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Spend Smarter',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Image.asset('assets/images/sign.png'),
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'your name',
                  hintText: 'John Doe',
                ),
                PasswordFormField(
                  labelText: 'choose your password',
                  hintText: "********",
                ),
                PasswordFormField(
                  labelText: 'confirm your password',
                  hintText: "********",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 20.0,
              bottom: 4.0,
            ),
            child: PrimaryButton(text: 'Sign Up', onPressed: () => log('btn')),
          ),
          MultiTextButton(
            onPressed: () => log('tap'),
            children: [
              Text(
                'Already have account?',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Log In',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenOne,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
