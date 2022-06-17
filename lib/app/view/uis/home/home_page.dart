import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitcalc/app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplitCalc'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Meu numero.'),
            onTap: () => Get.toNamed(Routes.home + Routes.splitMy),
          ),
          ListTile(
            title: const Text('Numero Ramdomico.'),
            onTap: () => Get.toNamed(Routes.home + Routes.splitRandom),
          ),
          ListTile(
            title: const Text('Minha soma.'),
            onTap: () => Get.toNamed(Routes.home + Routes.sumMy),
          ),
          ListTile(
            title: const Text('Soma Ramdomico.'),
            onTap: () => Get.toNamed(Routes.home + Routes.sumRandom),
          ),
        ],
      ),
    );
  }
}
