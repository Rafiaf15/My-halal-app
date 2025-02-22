import 'package:flutter/material.dart';
import 'package:belajar_flutter/widgets/side_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, // Pasang GlobalKey pada Scaffold
      drawer: const SidePanel(),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/food_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar Replacement
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Gunakan GlobalKey untuk membuka drawer
                        scaffoldKey.currentState?.openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.wifi,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            // Tindakan untuk notifikasi
                          },
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Greeting and Logo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 25,
                      child: Image.asset(
                        "assets/logo.png", // Replace with your logo path
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "HI! ADAM",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Bottom Menu Buttons
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menu Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: _buildMenuItem(Icons.qr_code_scanner, "Scan"),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: _buildMenuItem(Icons.restaurant_menu, "Food"),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: _buildMenuItem(Icons.favorite, "Favorite"),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: _buildMenuItem(Icons.calendar_today, "Reservation"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // News Section
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "News",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildNewsCard("assets/podomoro.jpg"),
                            _buildNewsCard("assets/buy1.jpg"),
                            _buildNewsCard("assets/shinjuramen.png"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Recommended Section
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Recommended",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildRecommendedCard(
                                "McDonald's Podomoro Park",
                                "750 m",
                                "assets/podomoro.jpg"),
                            _buildRecommendedCard(
                                "Marugame Udon, Batu",
                                "2 km",
                                "assets/marugame.jpg"),
                            _buildRecommendedCard(
                                "Shinjyu Ramen, Bandung",
                                "400 m",
                                "assets/shinjuramen.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        backgroundColor: Colors.white, // Set the background color to white
        selectedItemColor: Colors.black, // Set the selected item color to black
        unselectedItemColor: Colors.black.withOpacity(0.6), // Set the unselected item color to a slightly transparent black
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Nearby",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  // Helper Widget for Menu Item
  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
          child: Icon(icon, size: 30, color: Colors.green),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Helper Widget for News Card
  Widget _buildNewsCard(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Helper Widget for Recommended Card
  Widget _buildRecommendedCard(String title, String distance, String imagePath) {
    return Container(
      width: 220,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image for Recommended Card
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // rounded corners for the image
            child: Image.asset(
              imagePath,
              width: 220,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          // Text below image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  distance,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
