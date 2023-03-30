import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/theme/app_box_decoration.dart';
import 'package:themoviedb/widgets/theme/app_text_style.dart';

abstract class AppErrors {
  static const passwordAuthError =
      AppErrorBox(errorMessage: 'Incorrect password.');
  static const usernameAuthError =
      AppErrorBox(errorMessage: 'We couldn\'t find your username.');
}

class AppErrorBox extends StatelessWidget {
  final String errorMessage;
  const AppErrorBox({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: AppBoxDecoration.errorBoxDecoration,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          color: Colors.white,
          child: Center(
              child: Text(
            errorMessage,
            textAlign: TextAlign.center,
          )),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(9.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(
              Icons.error,
              color: Colors.white,
              size: 17,
            ),
            SizedBox(width: 10),
            Text(
              'There was a problem.',
              style: AppTextStyle.errorTextStyle,
            ),
          ],
        ),
      )
    ]);
  }
}
