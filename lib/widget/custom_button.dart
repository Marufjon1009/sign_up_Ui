import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  const MyButton({Key? key, this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CupertinoButton.filled(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Text(title!),
      ),
    );
  }
}
