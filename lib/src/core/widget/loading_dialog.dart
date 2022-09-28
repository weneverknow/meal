import 'package:flutter/material.dart';

import '../config/style.dart';

class LoadingDialog {
  final BuildContext context;
  LoadingDialog(this.context);

  show() {
    showDialog(
        //barrierColor: Colors.transparent,

        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 209, 208, 208),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primarycolor,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
