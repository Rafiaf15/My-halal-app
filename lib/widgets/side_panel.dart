import 'package:flutter/material.dart';

class SidePanelApp extends StatelessWidget {
  const SidePanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey, // Pasang GlobalKey pada Scaffold
        appBar: AppBar(
          title: const Text('Side Panel Example'),
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Gunakan GlobalKey untuk membuka drawer
              scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: const SidePanel(),
        body: const Center(
          child: Text(
            'Content here',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF364F46),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Adam',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.transparent),
            ),
            ListTile(
              leading: const Icon(Icons.account_box_rounded, color: Colors.white),
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),  // Tambahkan logika navigasi di sini jika diperlukan
               );  // Tambahkan logika navigasi di sini jika diperlukan
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text(
                'Favorite',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritePage()),  // Tambahkan logika navigasi di sini jika diperlukan
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.white),
              title: const Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Tambahkan logika navigasi di sini jika diperlukan
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Tambahkan logika sign-out di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Center(
        child: Text(
          'Account Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Center(
        child: Text(
          'Favorite Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}


void main() {
  runApp(const SidePanelApp());
}
