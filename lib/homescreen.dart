import 'package:flutter/material.dart';
import 'package:hotel_management/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback logout;

  HomeScreen({required this.logout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> staticData = [
    {
      'name': 'Burj Al Arab',
      'image':
          'https://cdn.jumeirah.com/-/mediadh/dh/hospitality/jumeirah/hotels/dubai/burj-al-arab-jumeirah/hero/burj-al-arab-profile-exterior_6-4_landscape.jpg?h=800&w=1200&modified=20230522053739',
      'price': 'SR 400',
      'rooms': 5,
      'child': 5,
      'adults': 1,
      'area': 'Dubai'
    },
    {
      'name': 'Burj Khalifa',
      'image':
          'https://media1.thrillophilia.com/filestore/mv8lii5npb2sujxt08nke8voknys_1582311630_1508222873_burj-khalifa.jpg.png',
      'price': 'SR 300',
      'rooms': 5,
      'child': 4,
      'adults': 2,
      'area': 'Dubai'
    },
    {
      'name': 'The Oberoi Udaivilas',
      'image':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/73/88/53/premier-rooms-with-semi.jpg?w=700&h=-1&s=1',
      'price': 'SR 250',
      'rooms': 5,
      'child': 3,
      'adults': 3,
      'area': 'Udaipur'
    },
    {
      'name': 'The Leela Palace',
      'image':
          'https://imgcld.yatra.com/ytimages/image/upload/t_seo_Hotel_w_930_h_550_c_fill_g_auto_q_40_f_jpg/v1430903499/Domestic%20Hotels/Hotels_Udaipur/The%20Leela%20Palace%20Udaipur/exterior_dusk.jpg',
      'price': 'SR 200',
      'rooms': 5,
      'child': 2,
      'adults': 4,
      'area': 'Udaipur'
    },
    {
      'name': 'The Oberoi,',
      'image':
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/122447543.jpg?k=3d6b85b8d24805fcdded05b948dbaee0a80b631b6e3aa217b758c3fed59cdae1&o=&hp=1',
      'price': 'SR 190',
      'rooms': 5,
      'child': 1,
      'adults': 5,
      'area': 'New Delhi'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/logo.jpg'),
              ),
              Text(
                'oldInn',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.black87,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(hotels: staticData),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Search by city, landmark or hotel',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.amber[800],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Top Deals',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: staticData.length,
                    itemBuilder: (context, index) {
                      final hotel = staticData[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                              ListTile(
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recent Booking',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: staticData.length,
                    itemBuilder: (context, index) {
                      final hotel = staticData[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                              ListTile(
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 1) {
              widget.logout(); 
              Navigator.of(context)
                  .pop(); 
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'Share & Earn',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ));
  }
}
