import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/themes_controller.dart';

class ThemesView extends GetView<ThemesController> {
  const ThemesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ThemesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
