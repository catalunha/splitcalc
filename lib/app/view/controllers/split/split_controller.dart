import 'dart:math';

import 'package:get/get.dart';

class SplitController extends GetxController {
  var random = ''.obs;
  var number = ''.obs;
  var numPlaces = [].obs;
  var placesError = [].obs;
  var placeLimit = 4;
  var sumEquals = false.obs;

  @override
  void onInit() {
    super.onInit();
    createValues();
    updateRandom();
    ever(number, (value) => checkNumWithRandom());
  }

  checkNumWithRandom() {
    if (number == random) {
      sumEquals(true);
    } else {
      sumEquals(false);
    }
  }

  updateRandom() {
    resetNum();
    int randomInt = Random().nextInt(1000);
    random(randomInt.toString());
  }

  updateNumber(String value) {
    number(value);
    split(value);
  }

  updatePlace({required int pos, required String value}) {
    numPlaces[pos] = value;
    placesError[pos] = check(pos, value);

    if (check(pos, value)) {
      mountNumber();
    }
  }

  mountNumber() {
    number(numPlaces.reduce((previousValue, element) =>
        ((int.tryParse(previousValue) ?? 0) + (int.tryParse(element) ?? 0))
            .toString()));
  }

  bool check(int pos, String value) {
    bool result = false;
    int valueInt = int.tryParse(value) ?? 0;
    if (pos == 0 && valueInt >= 0 && valueInt <= 9) {
      result = true;
    } else if (pos == 1 &&
        (valueInt == 0 ||
            (valueInt >= 10 && valueInt <= 90 && valueInt % 10 == 0))) {
      result = true;
    } else if (pos == 2 &&
        (valueInt == 0 ||
            (valueInt >= 100 && valueInt <= 900 && valueInt % 100 == 0))) {
      result = true;
    } else if (pos == 3 &&
        (valueInt == 0 ||
            (valueInt >= 1000 && valueInt <= 9000 && valueInt % 1000 == 0))) {
      result = true;
    }
    return result;
  }

  split(String value) {
    if (value.isNotEmpty && value.length <= placeLimit) {
      var valueReversed = value.split('').reversed.toList();
      resetNum();
      for (int i = 0; i < valueReversed.length; i++) {
        numPlaces[i] = valueReversed[i].padRight(i + 1, '0');
      }
    }
  }

  resetNum() {
    for (var i = 0; i < placeLimit; i++) {
      numPlaces[i] = '';
    }
    number('');
  }

  createValues() {
    for (var i = 0; i < placeLimit; i++) {
      numPlaces.add('0');
      placesError.add(true);
    }
  }
}
