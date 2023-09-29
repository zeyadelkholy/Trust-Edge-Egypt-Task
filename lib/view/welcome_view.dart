import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:starttechtask/utils/extensions_helper.dart';
import 'package:starttechtask/utils/widgets/master_button.dart';
import 'package:starttechtask/view/register_view.dart';

import 'login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 32, start: 16, end: 16, bottom: 8),
            child: Column(
              children: [
                SizedBox(
                    height: context.height * 0.15,
                    width: context.width * 0.3,
                    child: const Image(
                        image: AssetImage('asset/images/ali_fouad_logo.png'))),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.height * 0.04, bottom: context.height * 0.3),
                  child: Text(
                    'Welcome to the app',
                    style: context.textTheme.headlineSmall?.copyWith(
                        color: const Color.fromRGBO(93, 20, 107, 1.0),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                MasterButton(
                  text: 'Login',
                  onPressed: () {
                    context.push(const LoginView());
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.height * 0.03),
                  child: OutlinedButton(
                    onPressed: () {
                      context.push(const RegisterView());
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder?>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          context.width * 0.75,
                          context.height * 0.07,
                        ),
                      ),
                    ),
                    child: Text(
                      'Register',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: const Color.fromRGBO(93, 20, 107, 1.0),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
