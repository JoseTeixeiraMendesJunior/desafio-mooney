import 'dart:ffi';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  /// see which profile is selected;
  var profileSelected = 0.obs;

  void updateProfile(int value) {
    if (value == int.parse(profileSelected.toString())) {
      profileSelected.value = 0;
    } else {
      profileSelected.value = value;
    }
    update();
  }

  void GoToNextPage() {
    if (profileSelected.value != 0) {
      print('Avança para a próxima página');
    }
  }
}
