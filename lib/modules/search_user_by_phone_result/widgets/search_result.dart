import 'package:flutter/material.dart';

import 'custom_text.dart';

class SearchResult extends StatelessWidget {
  const SearchResult(
      {Key? key,
      required this.name,
      required this.phone,
      required this.email,
      required this.checkInPrize,
      required this.simulationPrize,
      required this.finalPrize,
      required this.luckyNumber,
      required this.status})
      : super(key: key);

  final String name;
  final String phone;
  final String email;
  final String checkInPrize;
  final String simulationPrize;
  final String finalPrize;
  final String luckyNumber;
  final int status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text1: 'Nome: ',
          text2: name,
        ),
        CustomText(
          text1: 'Telefone: ',
          text2: phone,
        ),
        CustomText(
          text1: 'E-mail: ',
          text2: email,
        ),
        CustomText(
          text1: 'Brinde de check-in: ',
          text2: checkInPrize,
        ),
        status != 'checkin'
            ? CustomText(
                text1: 'Brinde de simulação: ',
                text2: simulationPrize,
              )
            : SizedBox.shrink(),
        status == 'you_won' || status == 'withdrew_gift'
            ? CustomText(
                text1: 'Prêmio final: ',
                text2: finalPrize,
              )
            : SizedBox.shrink(),
        luckyNumber != ''
            ? CustomText(
                text1: 'Número da sorte: ',
                text2: luckyNumber,
              )
            : SizedBox.shrink()
      ],
    );
  }
}
