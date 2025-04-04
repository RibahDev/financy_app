import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/themes/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/themes/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/services/mock_auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //is é uma verificação do tipo bool "se ele for isso"
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => CustomCircularProgressIndicator(),
        );
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => Scaffold(body: Center(child: Text('Nova Tela!'))),
          ),
        );
      }

      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
        Navigator.pop(context);
        customModalBottomSheet(context);
      }
    });
  }

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
                  controller: _nameController,
                  labelText: 'your name',
                  hintText: 'JOHN DOE',
                  inputFormatters: [UppercaseTextFormatter()],
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  controller: _emailController,
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
                  _controller.signUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
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
