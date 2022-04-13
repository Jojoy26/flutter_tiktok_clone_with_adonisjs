// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/src/controllers/login_controller.dart';
import 'package:flutter_tik_tok/src/utils/input_types.dart';
import 'package:flutter_tik_tok/src/widgets/custom_button.dart';
import 'package:flutter_tik_tok/src/widgets/custom_text_field.dart';
import 'package:flutter_tik_tok/src/widgets/tiktok_clone_text.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = GetIt.I.get<LoginController>();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(left: 14, right: 14),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TikTokCloneText(),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      label: 'Email',
                      prefixIcon: Icons.email,
                      type: InputTypes.email,
                      onSaved: (text) {
                        controller.email = text as String;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      label: 'Password',
                      prefixIcon: Icons.lock,
                      type: InputTypes.password,
                      onSaved: (text) {
                        controller.password = text as String;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          controller.login();
                        }
                      },
                      label: 'Login',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: controller.goToSignUp,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
