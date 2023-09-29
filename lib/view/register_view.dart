import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starttechtask/utils/extensions_helper.dart';
import 'package:starttechtask/utils/widgets/basic_filed.dart';
import 'package:starttechtask/utils/widgets/master_button.dart';
import 'package:starttechtask/utils/widgets/password_filed.dart';
import 'package:starttechtask/view/home_view.dart';

import '../view_model/logic_view_model.dart';

class RegisterView extends GetWidget<LogicViewModel> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 32, start: 16, end: 16, bottom: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: context.height * 0.15,
                      width: context.width * 0.3,
                      child: const Image(
                          image:
                              AssetImage('asset/images/ali_fouad_logo.png'))),
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.04,
                        bottom: context.height * 0.05),
                    child: Text(
                      'Register',
                      style: context.textTheme.headlineSmall?.copyWith(
                          color: const Color.fromRGBO(93, 20, 107, 1.0),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  BasicFiled(
                    text: 'Full name',
                    controller: controller.fullNameController,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * 0.01),
                    child: BasicFiled(
                      text: 'Phone number',
                      controller: controller.phoneNumberController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  BasicFiled(
                    text: 'Email Address',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.01,
                    ),
                    child: PasswordFiled(
                      text: 'Password',
                      controller: controller.passwordController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: context.height * 0.05,
                    ),
                    child: PasswordFiled(
                      text: 'Confirm Password',
                      controller: controller.confirmPasswordController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: context.height * 0.085),
                    child: MasterButton(
                      text: 'Register',
                      onPressed: () {
                        if (controller.emailController.text.contains('@') &&
                            controller.emailController.text.length >= 10 &&
                            controller.passwordController.text.length >= 4 &&
                            controller.phoneNumberController.text.isNotEmpty &&
                            controller.passwordController.text ==
                                controller.confirmPasswordController.text &&
                            controller.fullNameController.text.isNotEmpty) {
                          context.pushReplacement(const HomeView());
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Successfully',
                              message: 'You data added successfully',
                              duration: Duration(
                                milliseconds: 3000,
                              ),
                              backgroundColor: Colors.greenAccent,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              borderRadius: 10,
                            ),
                          );
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Wrong',
                              message: 'Enter login data correctly',
                              duration: Duration(
                                milliseconds: 3000,
                              ),
                              backgroundColor: Colors.redAccent,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              borderRadius: 10,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: const Color.fromRGBO(97, 91, 97, 1.0),
                        ),
                      ),
                      Text(
                        'Login',
                        style: context.textTheme.titleMedium?.copyWith(
                            color: const Color.fromRGBO(93, 20, 107, 1.0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
