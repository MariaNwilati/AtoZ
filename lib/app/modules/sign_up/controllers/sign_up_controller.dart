import 'package:atoz/app/data/models/user_signup_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../service/api_link.dart';
import 'package:http/http.dart' as http;

import '../../home/views/home_view.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      fnameController,
      lnameController,
      phoneController;
  var email = '';
  var password = '';
  var fname = '';
  var lname = '';
  var phone = '';
  final GetStorage authBox = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
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

  String? validatefname(String value) {
    if (value.length < 3) {
      return "name must be of 3 characters at least ";
    }
    return null;
  }

  String? validatelname(String value) {
    if (value.length < 3) {
      return "name must be of 3 characters at least ";
    }
    return null;
  }

  String? validatephone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "phone number required";
    }
    return null;
  }

  void checkSignup() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      signup(
          email: email,
          firstName: fname,
          lastName: lname,
          phone: phone,
          password: password);
    }
    loginFormKey.currentState!.save();
  }

  void signup(
      {required String email,
      required String firstName,
      required String lastName,
      required String phone,
      required String password}) async {
    // ignore: unused_local_variable

    try {
      final response =
          await http.post(Uri.parse('${baseUrl}api/auth/register'), body: {
        "f_name": firstName,
        "l_name": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        'roles_name': 'user',
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var signupResponse = signUpResponseModelFromJson(response.body);
        var token = signupResponse.token;
        print(token);
        authBox.write('token', token);
        Get.snackbar("successful ", "successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white);
        Get.off( HomeView(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 700));

        update();
        ;
      } else {
        Get.snackbar("Field", "some thing went wrong ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Field", "some thing went wrong ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white);
    }

    //   _userId = responseData['id'];
    //   authBox.write('userId', _userId);

    // } else {
    //   Get.snackbar("some thing went wrong ", "successful",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.orangeAccent,
    //       colorText: Colors.white);
    //   log(convert.jsonDecode(response.body));
    //   log("wrong");
    // }
  }
}
