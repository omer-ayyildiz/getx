import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ornek/controller/main_controller.dart';
import 'package:getx_ornek/models/record.dart';
import 'package:getx_ornek/widgets/record_list_tile.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final MainController _controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('History'),
          actions: [
            IconButton(
              onPressed: () {
                _controller.addRecord();
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: // _controller.records.isEmpty
            records.isEmpty
                ? const Center(
                    child: Text('Herhangi bir veri bulunamadı!'),
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: _controller.records
                        .map(
                          (element) => RecordListTile(record: element),
                        )
                        .toList(),
                  ),
      ),
    );
  }
}
