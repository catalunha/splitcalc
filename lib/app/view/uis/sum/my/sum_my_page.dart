import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/sum/sum_controller.dart';
import 'package:splitcalc/app/view/utils/app_text_field.dart';

class SumMyPage extends StatefulWidget {
  SumController sumController = Get.find();

  SumMyPage({Key? key}) : super(key: key);

  @override
  State<SumMyPage> createState() => _SumMyPageState();
}

class _SumMyPageState extends State<SumMyPage> {
  @override
  Widget build(BuildContext context) {
    final numeratorTEC = TextEditingController();
    final denominatorTEC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SumMy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Informe o numero e veja as partes'),
          const SizedBox(height: 10),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                AppTextField(
                  width: 80,
                  controller: numeratorTEC,
                  enabled: true,
                  onChanged: (value) {
                    widget.sumController.updateParcel(value, 'num');
                  },
                ),
                const Align(alignment: Alignment.centerLeft, child: Text('+')),
                AppTextField(
                  width: 80,
                  controller: denominatorTEC,
                  enabled: true,
                  onChanged: (value) {
                    widget.sumController.updateParcel(value, 'den');
                  },
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 15,
                  color: Colors.black,
                ),
                Obx(() => Text('${widget.sumController.sum}')),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    Obx(() => Text('${widget.sumController.numPlaces[3]}')),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    Obx(() => Text('${widget.sumController.denPlaces[3]}')),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[3]}')),
                    const Text('thousands'),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    Obx(() => Text('${widget.sumController.numPlaces[2]}')),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    Obx(() => Text('${widget.sumController.denPlaces[2]}')),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[2]}')),
                    const Text('hundreds'),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    Obx(() => Text('${widget.sumController.numPlaces[1]}')),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    Obx(() => Text('${widget.sumController.denPlaces[1]}')),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[1]}')),
                    const Text('tens'),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    Obx(() => Text('${widget.sumController.numPlaces[0]}')),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    Obx(() => Text('${widget.sumController.denPlaces[0]}')),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[0]}')),
                    const Text('ones'),
                  ],
                ),
              )
            ],
          ),
          // const SizedBox(height: 10),
          // Obx(() => Text(
          //     '${widget.sumController.numerator} + ${widget.sumController.denominator} = ${widget.sumController.sum}')),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
