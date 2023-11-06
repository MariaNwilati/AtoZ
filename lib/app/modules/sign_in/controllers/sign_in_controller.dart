import 'package:atoz/app/data/models/user_login_response_model.dart';
import 'package:atoz/app/modules/home/views/home_view.dart';
import 'package:atoz/app/modules/sign_in/views/sign_in_view.dart';
import 'package:atoz/app/service/api_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  var isPasswordHidden = true.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  // Instance For Shared Data
  final GetStorage authBox = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "provide valid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "password must be of 6 characters at least ";
    }
    return null;
  }

  checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      login(email: email, password: password);
    }
    loginFormKey.currentState!.save();
  }

  void login({required String email, required String password}) async {
    final response =
        await http.post(Uri.parse('${baseUrl}api/auth/login'), body: {
      'email': email,
      'password': password
    }, headers: {
      'Accept': 'application/json',
    });
    print(email);
    print(password);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var loginResponse = loginResponseModelFromJson(response.body);
      var token = loginResponse.token;
      var name = loginResponse.user.fName;
      var emai = loginResponse.user.email;

      authBox.write('token', token);
      authBox.write('firstName', name);
      authBox.write('email', emai);
      print(authBox.read(
          '///////////////////////////////////////////////////////////////////////////////////////////'));

      print(authBox.read('token'));
      print(authBox.read('firstName'));
      print(authBox.read('email'));
      // authBox.write('userId', user);
      // authBox.write('username', );
      // authBox.write('userId', user);
      Get.snackbar("successful ", "successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white);

      Get.off( HomeView(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700));
    } else {
      Get.snackbar("Field", "some thing went wrong ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white);
    }
  }
}
