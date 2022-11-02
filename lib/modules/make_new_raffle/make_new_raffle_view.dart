import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/modules/make_new_raffle/make_new_raffle_controller.dart';
import 'package:tcc_gamification/theme/themes.dart';

import '../../shared/widgets/custom_circular_progress_indicator.dart';

class MakeNewRaffleView extends GetView<MakeNewRaffleController> {
  const MakeNewRaffleView({Key? key}) : super(key: key);

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
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Form(
                            key: controller.makeNewRaffleFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total de participantes:'),
                                SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      "${controller.maxQuantityParticipants}",
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Theme.of(context).disabledColor,
                                    filled: true,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text('Quantidade a sortear:'),
                                TextFormField(
                                  controller: controller.formController,
                                  validator:
                                      controller.validateParticipantsNumber,
                                  decoration: InputDecoration(),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 32),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.validateForm();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(40),

                                      //padding: MaterialStateProperty.all(
                                      //  EdgeInsets.symmetric(horizontal: 120)),
                                      primary: TccColors.baseColor),
                                  child: const Text(
                                    "Sortear",
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
