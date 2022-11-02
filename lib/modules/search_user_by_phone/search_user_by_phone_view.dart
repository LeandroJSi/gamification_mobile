import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/modules/search_user_by_phone/search_user_by_phone_controller.dart';
import 'package:tcc_gamification/theme/themes.dart';

class SearchUserByPhoneView extends GetView<SearchUserByPhoneController> {
  const SearchUserByPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Procurar usuário por Celular",
        ),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Form(
                  key: controller.searchUserByPhoneController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Celular:'),
                      TextFormField(
                        controller: controller.phoneTextEditingController,
                        validator: controller.validatePhone,
                        decoration: InputDecoration(),
                        keyboardType: TextInputType.number,
                        maxLength: 15,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: controller.onChangeDocument,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: controller.isSearchButtonEnabled.value
                            ? () {
                                controller.validateForm();
                              }
                            : () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(40),
                            primary: controller.isSearchButtonEnabled.value
                                ? TccColors.baseColor
                                : Colors.grey),
                        child: const Text(
                          'Procurar',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
          ]),
        );
      }),
    );
  }
}
