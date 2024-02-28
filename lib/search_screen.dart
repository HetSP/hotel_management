import 'package:flutter/material.dart';
import 'package:hotel_management/date_selectscreen.dart';

class SearchScreen extends StatefulWidget {
  final List<Map<String, dynamic>> hotels;

  SearchScreen({required this.hotels});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<String> cityNames; 
  String? selectedCity; 

  @override
  void initState() {
    super.initState();
    extractCityNames();
  }

  void extractCityNames() {
    cityNames =
        widget.hotels.map((hotel) => hotel['area'] as String).toSet().toList();
    cityNames.sort();
    selectedCity = cityNames.isNotEmpty ? cityNames[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, 
                  ),
                  child: DropdownButton<String>(
                    value: selectedCity,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue;
                      });
                    },
                    items:
                        cityNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Selected City: ${selectedCity ?? "None"}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateSelectScreen(
                            selectedCity: selectedCity ?? "None",
                            hotels: widget.hotels,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
