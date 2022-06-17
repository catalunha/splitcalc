import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/sum/sum_controller.dart';
import 'package:splitcalc/app/view/utils/app_text_field.dart';

class SumRandomPage extends StatefulWidget {
  SumController sumController = Get.find();

  SumRandomPage({Key? key}) : super(key: key);

  @override
  State<SumRandomPage> createState() => _SumRandomPageState();
}

class _SumRandomPageState extends State<SumRandomPage> {
  final onesNumTEC = TextEditingController();
  final tensNumTEC = TextEditingController();
  final hundredsNumTEC = TextEditingController();
  final thousandsNumTEC = TextEditingController();
  final onesDenTEC = TextEditingController();
  final tensDenTEC = TextEditingController();
  final hundredsDenTEC = TextEditingController();
  final thousandsDenTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum Random Split'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() => Text('${widget.sumController.numRandom}')),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    Obx(() => Text('${widget.sumController.denRandom}')),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumRandom}')),
                  ],
                ),
              ),
              Obx(
                () => widget.sumController.sumEquals.value
                    ? const Text('=')
                    : const Text('~'),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() => Text(
                          '${widget.sumController.numerator}',
                          style: TextStyle(
                              color: widget.sumController.numEquals.value
                                  ? Colors.black
                                  : Colors.red),
                        )),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    Obx(() => Text(
                          '${widget.sumController.denominator}',
                          style: TextStyle(
                              color: widget.sumController.denEquals.value
                                  ? Colors.black
                                  : Colors.red),
                        )),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text(
                          '${widget.sumController.sum}',
                          style: TextStyle(
                              color: widget.sumController.denEquals.value
                                  ? Colors.black
                                  : Colors.red),
                        )),
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(
          //   width: 70,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Obx(() => Text('${widget.sumController.numRandom}')),
          //       const Align(alignment: Alignment.centerLeft, child: Text('+')),
          //       Obx(() => Text('${widget.sumController.denRandom}')),
          //       const Divider(height: 25, color: Colors.black),
          //       Obx(() => Text('${widget.sumController.sumRandom}')),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    AppTextField(
                      width: 60,
                      controller: thousandsNumTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'num',
                          pos: 3,
                          value: value,
                        );
                      },
                    ),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    AppTextField(
                      width: 60,
                      controller: thousandsDenTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'den',
                          pos: 3,
                          value: value,
                        );
                      },
                    ),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[3]}')),
                    Obx(
                      () => Text(
                        'thousands',
                        style: TextStyle(
                            color: widget.sumController.sumPlacesError[3]
                                ? Colors.black
                                : Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    AppTextField(
                      width: 60,
                      controller: hundredsNumTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'num',
                          pos: 2,
                          value: value,
                        );
                      },
                    ),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    AppTextField(
                      width: 60,
                      controller: hundredsDenTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'den',
                          pos: 2,
                          value: value,
                        );
                      },
                    ),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[2]}')),
                    Obx(
                      () => Text(
                        'hundreds',
                        style: TextStyle(
                            color: widget.sumController.sumPlacesError[2]
                                ? Colors.black
                                : Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    AppTextField(
                      width: 60,
                      controller: tensNumTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'num',
                          pos: 1,
                          value: value,
                        );
                      },
                    ),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    AppTextField(
                      width: 60,
                      controller: tensDenTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'den',
                          pos: 1,
                          value: value,
                        );
                      },
                    ),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[1]}')),
                    Obx(
                      () => Text(
                        'tens',
                        style: TextStyle(
                            color: widget.sumController.sumPlacesError[1]
                                ? Colors.black
                                : Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Column(
                  children: [
                    AppTextField(
                      width: 60,
                      controller: onesNumTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'num',
                          pos: 0,
                          value: value,
                        );
                      },
                    ),
                    const Align(
                        alignment: Alignment.centerLeft, child: Text('+')),
                    AppTextField(
                      width: 60,
                      controller: onesDenTEC,
                      onChanged: (value) {
                        widget.sumController.updatePlace(
                          parcel: 'den',
                          pos: 0,
                          value: value,
                        );
                      },
                    ),
                    const Divider(height: 25, color: Colors.black),
                    Obx(() => Text('${widget.sumController.sumPlaces[0]}')),
                    Obx(
                      () => Text(
                        'ones',
                        style: TextStyle(
                            color: widget.sumController.sumPlacesError[0]
                                ? Colors.black
                                : Colors.red),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Obx(
            () => widget.sumController.sumEquals.value
                ? ElevatedButton(
                    onPressed: () {
                      clearAllTEC();
                      widget.sumController.updateRandom();
                    },
                    child: const Text('Next value'),
                  )
                : const SizedBox(),
          ),
          // const SizedBox(height: 10),
          // Obx(() => Text(
          //     '${widget.sumController.numerator} + ${widget.sumController.denominator} = ${widget.sumController.sum}')),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  clearAllTEC() {
    onesNumTEC.clear();
    tensNumTEC.clear();
    hundredsNumTEC.clear();
    thousandsNumTEC.clear();
    onesDenTEC.clear();
    tensDenTEC.clear();
    hundredsDenTEC.clear();
    thousandsDenTEC.clear();
  }
}
