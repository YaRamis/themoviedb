import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/errors/app_errors.dart';
import 'package:themoviedb/widgets/theme/app_button_style.dart';
import 'package:themoviedb/widgets/theme/app_input_decoration.dart';
import 'package:themoviedb/widgets/theme/app_text_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: AppTextStyle.defaultBlackTextStyle,
          ),
          SizedBox(
            height: 25,
            child: TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButtonStyle,
              child: const Text(
                'Sign Up',
                style: AppTextStyle.linkButtonTextStyle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'If you signed up but didn\'t get your verification email.',
            style: AppTextStyle.defaultBlackTextStyle,
          ),
          SizedBox(
            height: 25,
            child: TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButtonStyle,
              child: const Text(
                'Verify email',
                style: AppTextStyle.linkButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  Widget authErrorWidget = Container();

  final _usernameTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  void _auth() {
    setState(() {
      final username = _usernameTextEditingController.text;
      final password = _passwordTextEditingController.text;
      if (username != 'admin') {
        authErrorWidget = AppErrors.usernameAuthError;
      } else if (password != 'admin') {
        authErrorWidget = AppErrors.passwordAuthError;
      } else {
        authErrorWidget = Container();
      }
    });
  }

  void _resetPassword() {
    if (kDebugMode) {
      print('Password reset.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        authErrorWidget,
        const Text(
          'Username',
          style: AppTextStyle.inputGreetTextStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _usernameTextEditingController,
          decoration: AppInputDecoration.defaultInputDecoration,
        ),
        const SizedBox(height: 25),
        const Text(
          'Password',
          style: AppTextStyle.inputGreetTextStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextEditingController,
          obscureText: true,
          decoration: AppInputDecoration.defaultInputDecoration,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            TextButton(
              onPressed: _auth,
              style: AppButtonStyle.defaultButtonStyle,
              child: const Text('Login'),
            ),
            const SizedBox(width: 25),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButtonStyle,
              child: const Text('Reset password'),
            )
          ],
        )
      ],
    );
  }
}
