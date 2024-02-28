import 'package:flutter/material.dart';
import 'package:hotel_management/result_screen.dart';

class SelectRoomsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> hotels;
  final String selectedCity;
  final DateTime startDate;
  final DateTime endDate;

  SelectRoomsScreen({
    required this.hotels,
    required this.selectedCity,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<SelectRoomsScreen> createState() => _SelectRoomsScreenState();
}

class _SelectRoomsScreenState extends State<SelectRoomsScreen> {
  int _roomCount = 1;
  int _adultCount = 1;
  int _childCount = 0;

  void _incrementRoomCount() {
    setState(() {
      _roomCount++;
    });
  }

  void _decrementRoomCount() {
    setState(() {
      if (_roomCount > 1) {
        _roomCount--;
      }
    });
  }

  void _incrementAdultCount() {
    setState(() {
      _adultCount++;
    });
  }

  void _decrementAdultCount() {
    setState(() {
      if (_adultCount > 1) {
        _adultCount--;
      }
    });
  }

  void _incrementChildCount() {
    setState(() {
      _childCount++;
    });
  }

  void _decrementChildCount() {
    setState(() {
      if (_childCount > 0) {
        _childCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Add the Number of Guests',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              tileColor: Colors.grey.shade200,
              title: Text(
                'Rooms',
                style: TextStyle(fontSize: 22),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 25,
                    ),
                    onPressed: _decrementRoomCount,
                  ),
                  Text(
                    '$_roomCount',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 25,
                    ),
                    onPressed: _incrementRoomCount,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.grey.shade200,
              title: Text(
                'Adults',
                style: TextStyle(fontSize: 22),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 25,
                    ),
                    onPressed: _decrementAdultCount,
                  ),
                  Text(
                    '$_adultCount',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 25,
                    ),
                    onPressed: _incrementAdultCount,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.grey.shade200,
              title: Text(
                'Children',
                style: TextStyle(fontSize: 22),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 25,
                    ),
                    onPressed: _decrementChildCount,
                  ),
                  Text(
                    '$_childCount',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 25,
                    ),
                    onPressed: _incrementChildCount,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        hotels: widget.hotels,
                        selectedCity: widget.selectedCity,
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                        roomCount: _roomCount,
                        adultCount: _adultCount,
                        childCount: _childCount,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
