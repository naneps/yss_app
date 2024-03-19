import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';
import 'package:yss_app/app/common/ui/buttons/common_button.dart';
import 'package:yss_app/app/common/ui/input/common_field.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: 'Welcome to',
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: ' YSS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: DefaultTheme.neutralColor,
                // color: Theme.of(context).primaryColor,
                // border: Border.all(
                //   color: Theme.of(context).primaryColor,
                // ),

                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    blurRadius: 20,
                    // spreadRadius: ,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(() {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Masukin akunmu',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextField(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: MdiIcons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextField(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: MdiIcons.lock,
                        suffixIcon: controller.showPassword.value
                            ? MdiIcons.eyeOff
                            : MdiIcons.eye,
                        onPressSuffix: () {
                          controller.showPassword.toggle();
                        },
                        obscureText: controller.showPassword.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      // text button forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            // Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),

                      Obx(() {
                        return AnimatedContainer(
                          width: controller.isLoading.value ? 50 : Get.width,
                          duration: const Duration(milliseconds: 500),
                          child: controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CommonButton(
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.formKey.currentState!.save();
                                      controller.login();
                                    }
                                  },
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 15,
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        );
                      }),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
