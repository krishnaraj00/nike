import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

import 'bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image
                const CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage("assets/image/person.png"),
                ),
                const SizedBox(height: 15),

                // Name
                Text(
                  "John Smith",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 12),

                // Edit Profile Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),
                  ),
                ),

                const SizedBox(height: 25),

                // Icon Row: Orders | Pass | Events | Settings
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _iconWithLabel(Icons.local_shipping_outlined, "Orders"),
                    _iconWithLabel(Icons.grid_view_outlined, "Pass"),
                    _iconWithLabel(Icons.event_outlined, "Events"),
                    _iconWithLabel(Icons.settings_outlined, "Settings"),
                  ],
                ),

                const SizedBox(height: 25),

                // Inbox with badge
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Inbox", style: GoogleFonts.poppins(fontSize: 18)),
                  subtitle:
                  Text("View messages", style: GoogleFonts.poppins(color: Colors.grey)),
                  trailing: badges.Badge(
                    badgeContent: Text(
                      '2',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                    ),
                    badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
                    child: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ),
                  onTap: () {},
                ),

                const Divider(),

                // Nike Member Rewards
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Your Nike Member Rewards", style: GoogleFonts.poppins(fontSize: 18)),
                  subtitle:
                  Text("2 available", style: GoogleFonts.poppins(color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () {},
                ),

                const Divider(),

                // Following Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Following (19)",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18)),
                    Text("Edit", style: GoogleFonts.poppins(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 25),

                // Following Images Row
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFollowingImage('assets/image/Rectangle 136.png'),
                      SizedBox(height: 50),
                      _buildFollowingImage('assets/image/Rectangle 137.png'),
                      SizedBox(height: 50),
                      _buildFollowingImage('assets/image/Rectangle 138.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const NikeBottomNavBar(currentIndex: 4),
    );
  }

  // Reusable icon + label widget
  Widget _iconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 35),
        const SizedBox(height: 10),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 13),
        ),
      ],
    );
  }

  // Reusable circular image for following
  Widget _buildFollowingImage(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          path,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
