import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:hotel_management/select_roomscreen.dart';
import 'package:intl/intl.dart';

class DateSelectScreen extends StatefulWidget {
  final List<Map<String, dynamic>> hotels;
  final String selectedCity;

  DateSelectScreen({required this.hotels, required this.selectedCity});

  @override
  _DateSelectScreenState createState() => _DateSelectScreenState();
}

class _DateSelectScreenState extends State<DateSelectScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'When will you be there?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_startDate != null && _endDate != null)
            Text(
                'Selected Date Range: ${DateFormat('MM/dd/yyyy').format(_startDate!)} - ${DateFormat('MM/dd/yyyy').format(_endDate!)}'),
          SizedBox(height: 20),
          Expanded(
            child: dp.DayPicker.single(
              selectedDate: _startDate ?? DateTime.now(),
              onChanged: (date) {
                setState(() {
                  if (_startDate == null ||
                      _endDate != null ||
                      date.isBefore(_startDate!)) {
                    _startDate = date;
                    _endDate = null;
                  } else {
                    _endDate = date;
                  }
                });
              },
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectRoomsScreen(
                    hotels: widget.hotels,
                    selectedCity: widget.selectedCity,
                    startDate: _startDate!,
                    endDate: _endDate!,
                  ),
                ),
              );
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
