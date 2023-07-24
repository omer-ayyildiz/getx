import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ornek/controller/main_controller.dart';
import 'package:intl/intl.dart';
import 'package:getx_ornek/models/record.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({
    Key? key,
    required this.record,
  }) : super(key: key);
  final MainController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ListTile(
          leading: _buildDate(),
          title: _buildWeight(),
          trailing: _buildIcons(),
        ),
      ),
    );
  }

  Row _buildIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
          color: Colors.grey,
        ),
        IconButton(
            onPressed: () {
              _controller.deleteRecord(record);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ],
    );
  }

  Center _buildWeight() {
    return Center(
        child: Text(
      record.weight.toString(),
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ));
  }

  Text _buildDate() => Text(DateFormat('EEE,MMM d').format(record.dateTime));
}
