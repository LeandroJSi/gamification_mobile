import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/routes/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text(
                'Sorteios',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.raffleList);
              },
            ),
            ListTile(
              title: const Text(
                'Novo sorteio',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.accessNewRaffle);
              },
            ),
            ListTile(
              title: const Text(
                'Procurar usuário por Celular',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.searchUserByDocument);
              },
            ),
          ],
        ),
      ),
    );
  }
}
