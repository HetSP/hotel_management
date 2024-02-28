import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> hotels;
  final String selectedCity;
  final DateTime startDate;
  final DateTime endDate;
  final int roomCount;
  final int adultCount;
  final int childCount;

  ResultScreen({
    required this.hotels,
    required this.selectedCity,
    required this.startDate,
    required this.endDate,
    required this.roomCount,
    required this.adultCount,
    required this.childCount,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredHotels = hotels.where((hotel) {
      return hotel['area'] == selectedCity &&
          hotel['rooms'] >= roomCount &&
          hotel['adults'] >= adultCount &&
          hotel['child'] >= childCount;
    }).toList();

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black87,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${selectedCity}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${startDate.day} ${DateFormat('MMMM').format(startDate)} ',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Text(
                    '- ${endDate.day} ${DateFormat('MMMM').format(endDate)}',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(width: 5,),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    '${adultCount}',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(width: 5,),
                  Icon(
                    Icons.key,
                    color: Colors.white,
                  ),
                  Text(
                    '${roomCount}',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: filteredHotels.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: filteredHotels.length,
                itemBuilder: (context, index) {
                  final hotel = filteredHotels[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: 280,
                      height: 300,
                      child: Column(
                        children: [
                          Container(
                            width: 280,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(hotel['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 280,
                            height: 60,
                            child: ListTile(
                              tileColor: Colors.grey.shade200,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(hotel['name']),
                                  Text(
                                    hotel['price'],
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text('No hotels match the criteria'),
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.sort),
              label: 'Sort',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt),
              label: 'Filter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
        ));
  }
}
