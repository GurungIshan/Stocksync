import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(height: 30),

                /// BIG LOGO
                Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                  fit: BoxFit.contain,
                ),

                // const SizedBox(height: 10),

                /// TITLE
                const Text(
                  'StockSync IMS',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 0.6,
                  ),
                ),

                const SizedBox(height: 26),

                // /// SUBTITLE
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12),
                //   child: Text(
                //     'A powerful inventory management system to track stock, prevent shortages, and manage business operations efficiently.',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 15,
                //       color: Colors.white.withOpacity(0.85),
                //       height: 1.5,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 40),

                /// FEATURE CARDS (VERTICAL)
                const _VerticalFeatureCard(
                  icon: Icons.notifications_active,
                  title: 'Low Stock Alerts',
                  description:
                      'Receive instant alerts when inventory reaches critical levels.',
                ),
                SizedBox(height: 16),
                const _VerticalFeatureCard(
                  icon: Icons.bar_chart_rounded,
                  title: 'Reports & Analytics',
                  description:
                      'Generate detailed reports to understand sales and stock trends.',
                ),
                SizedBox(height: 16),
                const _VerticalFeatureCard(
                  icon: Icons.inventory_2,
                  title: 'Centralized Inventory',
                  description:
                      'Manage all products, categories, and suppliers from one system.',
                ),

                const SizedBox(height: 42),

                /// LOGIN BUTTON
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 82, 94),
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 14),

                /// SIGNUP BUTTON
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 54),
                    side: const BorderSide(color: Color.fromARGB(179, 0, 0, 0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 128, 66, 66),
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                /// FOOTER
                Text(
                  '© 2025 StockSync IMS. All rights reserved.',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= FEATURE CARD =================
class _VerticalFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _VerticalFeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 189, 189, 189).withOpacity(0.32),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color.fromARGB(255, 189, 189, 189).withOpacity(0.32),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 34, color: const Color.fromARGB(255, 5, 82, 94)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      22,
                      21,
                      21,
                    ).withOpacity(0.75),
                    fontSize: 13,
                    height: 1.4,
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
