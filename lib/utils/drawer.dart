import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: const Image(
                          image: AssetImage(
                              "assets/assassins_creed_3_2012_game-1920x1080 (2).jpg"),
                        )),
                  ],
                ),
              )),
          const ListTile(
            title: Text("Home", style: TextStyle(fontSize: 18)),
          ),
          const ListTile(
            title: Text("My Accounts", style: TextStyle(fontSize: 18)),
          ),
          const ListTile(
            title: Text("Cart", style: TextStyle(fontSize: 18)),
          ),
          const ListTile(
            title: Text("My Orders", style: TextStyle(fontSize: 18)),
          ),
          const ListTile(
            title: Text("WishList", style: TextStyle(fontSize: 18)),
          ),
          const ListTile(
            title: Text("Settings", style: TextStyle(fontSize: 18)),
          ),
          const ListTile(
            title: Text("Logout", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
