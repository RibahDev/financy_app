import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/themes/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/themes/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Spend Smarter',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
            textAlign: TextAlign.center,
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images/sign.png'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'your name',
                  hintText: 'JOHN DOE',
                  inputFormatters: [UppercaseTextFormatter()],
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  labelText: 'your email',
                  hintText: 'john@email.com',
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'choose your password',
                  hintText: "********",
                  helperText:
                      "Must have at least 8 characters, 1 capital letter and 1 number.",
                  validator: Validator.validatePassword,
                ),
                PasswordFormField(
                  labelText: 'confirm your password',
                  hintText: "********",
                  validator:
                      (value) => Validator.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
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
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  log("Continuar lógica de login");
                } else {
                  log('Erro ao logar');
                }
              },
            ),
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
