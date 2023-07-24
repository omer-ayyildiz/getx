import 'package:get/get.dart';
import 'package:getx_ornek/models/record.dart';

class MainController extends GetxController {
  //Stream işlemi yaptık yani anlık yayınlama işlemi
  var records = [
    Record(dateTime: DateTime.now(), weight: 80, note: 'AAA'),
    Record(dateTime: DateTime.now(), weight: 40, note: 'BBB'),
    Record(dateTime: DateTime.now(), weight: 50, note: 'CCC'),
  ].obs;
  void addRecord() {
    records.add(Record(dateTime: DateTime.now(), weight: 80, note: 'XXX'));
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
