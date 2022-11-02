import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/theme/themes.dart';

import '../../../routes/app_routes.dart';

class UniqueRaffle extends StatelessWidget {
  const UniqueRaffle(
      {Key? key, required this.raffleId, required this.raffleDate})
      : super(key: key);

  final int raffleId;
  final String raffleDate;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Get.toNamed('${AppRoutes.raffleResult}?raffleId=$raffleId');
      },
      child: Container(
        height: Get.height * 0.12,
        decoration: BoxDecoration(
          color: TccColors.baseColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: TccColors.baseColor),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sorteio $raffleId",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    raffleDate,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ads_click_sharp,
                      color: Colors.white,
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
