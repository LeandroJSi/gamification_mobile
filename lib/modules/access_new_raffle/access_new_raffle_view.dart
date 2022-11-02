import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/modules/access_new_raffle/access_new_raffle_controller.dart';
import 'package:tcc_gamification/theme/themes.dart';

import '../../shared/widgets/custom_circular_progress_indicator.dart';

class AccessNewRaffleView extends GetView<AccessNewRaffleController> {
  const AccessNewRaffleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Novo sorteio",
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    VerificationCode(
                        itemSize: 42,
                        textStyle: TextStyle(fontSize: 24),
                        keyboardType: TextInputType.text,
                        underlineColor: TccColors.baseColor,
                        length: 6,
                        cursorColor: TccColors.baseColor,
                        isSecure: true,
                        onCompleted: (String password) {
                          controller.password.value = password;
                        },
                        onEditing: (bool editing) {
                          controller.passwordFilled.value = !editing;
                        }),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.passwordFilled.value
                          ? () {
                              controller.verifyPassword();
                            }
                          : () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                          primary: controller.passwordFilled.value
                              ? TccColors.baseColor
                              : Colors.grey),
                      child: const Text(
                        'Acessar novo sorteio',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
