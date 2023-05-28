import 'package:flutter/material.dart';

class AnsBtn extends StatelessWidget {
  final String ansText;
  final void Function() selectAns;

  const AnsBtn({super.key, required this.ansText, required this.selectAns});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 36, 1, 43),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: selectAns,
      child: Text(ansText),
    );
  }
}
