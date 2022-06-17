import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/split/split_controller.dart';
import 'package:splitcalc/app/view/utils/app_text_field.dart';

class SplitRandomPage extends StatefulWidget {
  SplitController splitController = Get.find();

  SplitRandomPage({Key? key}) : super(key: key);

  @override
  State<SplitRandomPage> createState() => _SplitRandomPageState();
}

class _SplitRandomPageState extends State<SplitRandomPage> {
  final onesTEC = TextEditingController();
  final tensTEC = TextEditingController();
  final hundredsTEC = TextEditingController();
  final thousandsTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplitRandom'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Informe o numero e veja as partes'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => Text('${widget.splitController.random}')),
              Obx(
                () => widget.splitController.sumEquals.value
                    ? const Text('=')
                    : const Text('~'),
              ),
              Obx(
                () => Text(
                  '${widget.splitController.number}',
                  style: TextStyle(
                      color: widget.splitController.sumEquals.value
                          ? Colors.black
                          : Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AppTextField(
                    width: 70,
                    controller: thousandsTEC,
                    onChanged: (value) {
                      widget.splitController.updatePlace(pos: 3, value: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      'thousands',
                      style: TextStyle(
                          color: widget.splitController.placesError[3]
                              ? Colors.black
                              : Colors.red),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  AppTextField(
                    width: 70,
                    controller: hundredsTEC,
                    onChanged: (value) {
                      widget.splitController.updatePlace(pos: 2, value: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      'hundreds',
                      style: TextStyle(
                          color: widget.splitController.placesError[2]
                              ? Colors.black
                              : Colors.red),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  AppTextField(
                    width: 70,
                    controller: tensTEC,
                    onChanged: (value) {
                      widget.splitController.updatePlace(pos: 1, value: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      'tens',
                      style: TextStyle(
                          color: widget.splitController.placesError[1]
                              ? Colors.black
                              : Colors.red),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  AppTextField(
                    width: 70,
                    controller: onesTEC,
                    onChanged: (value) {
                      widget.splitController.updatePlace(pos: 0, value: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      'ones',
                      style: TextStyle(
                          color: widget.splitController.placesError[0]
                              ? Colors.black
                              : Colors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
          // ElevatedButton(
          //     onPressed: () => widget.splitController.updateRandom(),
          //     child: const Text('Next value')),
          Obx(
            () => widget.splitController.sumEquals.value
                ? ElevatedButton(
                    onPressed: () {
                      clearAllTEC();
                      widget.splitController.updateRandom();
                    },
                    child: const Text('Next value'),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  clearAllTEC() {
    onesTEC.clear();
    tensTEC.clear();
    hundredsTEC.clear();
    thousandsTEC.clear();
  }
}
