import 'package:flutter/material.dart';

import 'widgets/inverted_color_button.dart';
import 'widgets/label_text_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isLogin = true, enableButton = false;

  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              isLogin ? "Login" : "Sign Up",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  isLogin
                      ? "Don't have an account ? "
                      : "Already have an account ? ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin ? "Sign up" : "Login",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 500,
              child: Column(
                children: [
                  if (!isLogin)
                    LabelTextField(
                      key: const ValueKey("name"),
                      label: "Name",
                      controller: _nameController,
                      onChanged: (_) {
                        setState(() {
                          enableButton = isAllBoxFilled;
                        });
                      },
                    ),
                  LabelTextField(
                    key: const ValueKey("email"),
                    label: "Email",
                    controller: _emailController,
                    onChanged: (_) {
                      setState(() {
                        enableButton = isAllBoxFilled;
                      });
                    },
                  ),
                  LabelTextField(
                    key: const ValueKey("password"),
                    label: "Password",
                    controller: _passwordController,
                    isPassword: true,
                    onChanged: (_) {
                      setState(() {
                        enableButton = isAllBoxFilled;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            InvertedColorButton(
              text: isLogin ? "Login" : "Sign Up",
              onPressed: enableButton ? () {} : null,
            )
          ],
        ),
      ),
    );
  }

  bool get isAllBoxFilled =>
      (isLogin || _nameController.text.isNotEmpty) &&
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;
}
