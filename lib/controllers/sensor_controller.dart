

import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class SensorController extends GetxController {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('sensor');

  var temperature = Rxn<double>();
  var humidity = Rxn<int>();
  var timestamp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _dbRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      temperature.value = double.tryParse(data['temperature'].toString());
      humidity.value = int.tryParse(data['humidity'].toString());
      timestamp.value = data['timestamp'].toString();
    });
  }
}
