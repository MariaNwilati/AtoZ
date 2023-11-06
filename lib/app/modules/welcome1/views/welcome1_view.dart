import 'package:atoz/app/modules/sign_in/views/sign_in_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome1_controller.dart';

class Welcome1View extends GetView<Welcome1Controller> {
  const Welcome1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const SizedBox(
            height: 1000,
            width: 1000,
            child: Image(
              image: AssetImage('assets/images/welcome1.jpg'),
            ),
          ),
          Positioned(
            bottom: 123,
            right: 112,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: RaisedButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                onPressed: () {
                  Get.to(const SignInView());
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                color: Colors.black,
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
