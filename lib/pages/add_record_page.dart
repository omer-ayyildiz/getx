import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  int _selectValue = 70;
  DateTime _selectDate = DateTime.now();
  void pickDate(context) async {
    var initialDate = DateTime.now();
    _selectDate = await showDatePicker(
          builder: (context, child) {
            return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme(
                    brightness: Brightness.light,
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    secondary: Colors.yellow,
                    onSecondary: Colors.yellowAccent,
                    error: Colors.red,
                    onError: Colors.orange,
                    background: Colors.blueAccent,
                    onBackground: Colors.blueGrey,
                    surface: Colors.blue,
                    onSurface: Colors.black,
                  ),
                ),
                child: child ?? const Text(''));
          },
          context: context,
          initialDate: initialDate,
          firstDate: initialDate.subtract(const Duration(days: 365)),
          lastDate: initialDate.add(const Duration(days: 30)),
        ) ??
        _selectDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Record'),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.weightScale,
                    size: 40,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      NumberPicker(
                        itemCount: 3,
                        itemWidth: 80,
                        itemHeight: 50,
                        axis: Axis.horizontal,
                        minValue: 40,
                        maxValue: 70,
                        value: _selectValue,
                        onChanged: (value) {
                          setState(() {
                            _selectValue = value;
                          });
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      const Icon(
                        FontAwesomeIcons.chevronUp,
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat('EEE, MMM d').format(_selectDate),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text('Ekle'),
          )
        ],
      ),
    );
  }
}
