import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/split/split_controller.dart';
import 'package:splitcalc/app/view/utils/app_text_field.dart';

class SplitMyPage extends StatefulWidget {
  SplitController splitController = Get.find();
  SplitMyPage({Key? key}) : super(key: key);

  @override
  State<SplitMyPage> createState() => _SplitMyPageState();
}

class _SplitMyPageState extends State<SplitMyPage> {
  @override
  Widget build(BuildContext context) {
    final numberTEC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SplitMy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Informe o numero e veja as partes'),
          const SizedBox(height: 10),
          SizedBox(
            width: 100,
            child: AppTextField(
              controller: numberTEC,
              enabled: true,
              onChanged: (value) {
                widget.splitController.updateNumber(value);
              },
            ),
          ),
          const SizedBox(height: 10),
          Obx(() => Text('${widget.splitController.number}')),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Obx(() => Text('${widget.splitController.numPlaces[3]}')),
                  const SizedBox(height: 10),
                  const Text('thousands'),
                ],
              ),
              Column(
                children: [
                  Obx(() => Text('${widget.splitController.numPlaces[2]}')),
                  const SizedBox(height: 10),
                  const Text('hundreds'),
                ],
              ),
              Column(
                children: [
                  Obx(() => Text('${widget.splitController.numPlaces[1]}')),
                  const SizedBox(height: 10),
                  const Text('tens'),
                ],
              ),
              Column(
                children: [
                  Obx(() => Text('${widget.splitController.numPlaces[0]}')),
                  const SizedBox(height: 10),
                  const Text('ones'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
