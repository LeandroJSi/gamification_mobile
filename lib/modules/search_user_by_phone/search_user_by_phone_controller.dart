import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SearchUserByPhoneController extends GetxController {
  final GlobalKey<FormState> searchUserByPhoneController =
      GlobalKey<FormState>();
  final TextEditingController phoneTextEditingController =
      TextEditingController(text: '(19) 98712-811');

  final RxBool isSearchButtonEnabled = false.obs;

  String? validatePhone(String? phone) {
    if (phone == "") {
      return 'Preencha o Celular';
    }
    if (phone != null && phone!.length < 11) {
      return 'Preencha um celular válido';
    }
    return null;
  }

  onChangeDocument(String document) {
    if (UtilBrasilFields.removeCaracteres(document).length == 11) {
      enableSearchButton();
    } else {
      disableSearchButton();
    }
  }

  enableSearchButton() {
    isSearchButtonEnabled.value = true;
  }

  disableSearchButton() {
    isSearchButtonEnabled.value = false;
  }

  validateForm() async {
    if (searchUserByPhoneController.currentState!.validate()) {
      searchUserByPhoneController.currentState!.save();
      FocusManager.instance.primaryFocus?.unfocus();
      disableSearchButton();

      await Get.toNamed(
          '${AppRoutes.searchUserByPhoneResult}?phone=${UtilBrasilFields.removeCaracteres(phoneTextEditingController.value.text)}');
      phoneTextEditingController.text = '';
    }
  }
}
