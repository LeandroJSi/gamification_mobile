import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/themes.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({Key? key, required this.yesClicked})
      : super(key: key);

  final Function() yesClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Get.width * 0.9,
          height: Get.height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Deseja notificar os participantes do próximo sorteio?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                            child: Text(
                              "CANCELAR",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Get.back();
                            }),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TccColors.baseColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                            child: Text("SIM",
                                style: Get.textTheme.bodyText1!
                                    .copyWith(color: Colors.white)),
                            onPressed: () {
                              Get.back();
                              yesClicked();
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
