import 'dart:math';

import 'package:get/get.dart';

class SumController extends GetxController {
  var numRandom = ''.obs;
  var denRandom = ''.obs;
  var sumRandom = ''.obs;
  var numerator = ''.obs;
  var denominator = ''.obs;
  var sum = ''.obs;
  var numEquals = false.obs;
  var denEquals = false.obs;
  var sumEquals = false.obs;
  var numPlaces = [].obs;
  var denPlaces = [].obs;
  var sumPlaces = [].obs;
  var sumPlacesError = [].obs;
  var placeLimit = 4;
  @override
  void onInit() {
    super.onInit();
    createValues();
    updateRandom();
    ever(numerator, (value) => checkNum());
    ever(denominator, (value) => checkDen());
    ever(sum, (value) => checkSum());
  }

  checkNum() {
    if (numerator == numRandom) {
      numEquals(true);
    } else {
      numEquals(false);
    }
  }

  checkDen() {
    if (denominator == denRandom) {
      denEquals(true);
    } else {
      denEquals(false);
    }
  }

  checkSum() {
    if (sum == sumRandom) {
      sumEquals(true);
    } else {
      sumEquals(false);
    }
  }

  updatePlace({
    required String parcel,
    required int pos,
    required String value,
  }) {
    if (parcel == 'num') {
      numPlaces[pos] = value;
    } else if (parcel == 'den') {
      denPlaces[pos] = value;
    }
    calcSumPlaces();
    if (check(pos, value)) {
      mountNumDen(parcel);
      mountSum();
    }
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

  mountNumDen(
    String parcel,
  ) {
    if (parcel == 'num') {
      numerator(numPlaces.reduce((previousValue, element) =>
          ((int.tryParse(previousValue) ?? 0) + (int.tryParse(element) ?? 0))
              .toString()));
    } else if (parcel == 'den') {
      denominator(denPlaces.reduce((previousValue, element) =>
          ((int.tryParse(previousValue) ?? 0) + (int.tryParse(element) ?? 0))
              .toString()));
    }
  }

  mountSum() {
    sum(sumPlaces.reduce((previousValue, element) =>
        ((int.tryParse(previousValue) ?? 0) + (int.tryParse(element) ?? 0))
            .toString()));
  }

  updateRandom() {
    resetNum();
    resetDen();
    resetSum();
    int numRandomTemp = Random().nextInt(1000);
    int denRandomTemp = Random().nextInt(1000);

    numRandom(numRandomTemp.toString());
    denRandom(denRandomTemp.toString());
    sumRandom((numRandomTemp + denRandomTemp).toString());
  }

  updateParcel(String value, String parcel) {
    split(value, parcel);
    if (parcel == 'num') {
      numerator(value);
    } else if (parcel == 'den') {
      denominator(value);
    }
    calcSumPlaces();
    mountSum();
  }

  calcSumPlaces() {
    int numTemp, denTemp;
    for (var i = 0; i < placeLimit; i++) {
      numTemp = int.tryParse(numPlaces[i]) ?? 0;
      denTemp = int.tryParse(denPlaces[i]) ?? 0;
      sumPlaces[i] = (numTemp + denTemp).toString();
      sumPlacesError[i] = check(i, numPlaces[i]) && check(i, denPlaces[i]);
    }
  }

  split(String value, String parcel) {
    if (value.isNotEmpty && value.length <= placeLimit) {
      var valueReversed = value.split('').reversed.toList();
      if (parcel == 'num') {
        resetNum();
        for (int i = 0; i < valueReversed.length; i++) {
          numPlaces[i] = valueReversed[i].padRight(i + 1, '0');
        }
      } else {
        resetDen();
        for (int i = 0; i < valueReversed.length; i++) {
          denPlaces[i] = valueReversed[i].padRight(i + 1, '0');
        }
      }
    }
  }

  resetNum() {
    for (var i = 0; i < placeLimit; i++) {
      numPlaces[i] = '';
    }
    numerator('');
  }

  resetDen() {
    for (var i = 0; i < placeLimit; i++) {
      denPlaces[i] = '';
    }
    denominator('');
  }

  resetSum() {
    for (var i = 0; i < placeLimit; i++) {
      sumPlaces[i] = '';
    }
    sum('');
  }

  createValues() {
    for (var i = 0; i < placeLimit; i++) {
      numPlaces.add('0');
      denPlaces.add('0');
      sumPlaces.add('0');
      sumPlacesError.add(true);
    }
  }
}
