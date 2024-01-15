import 'package:ciperschools_assignment_app/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Confirm',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueGrey),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Are you sure you want to exit?',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.blueGrey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                  color: const Color(0xFF7E3DFF),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  title: 'Yes',
                  textColor: Colors.white),
              button(
                  color: const Color(0xFF7E3DFF),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'No',
                  textColor: Colors.white),
            ],
          )
        ],
      ),
    ),
  );
}
