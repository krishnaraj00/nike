import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Homepage.dart';

void main() {
  runApp(const NikeOnboardingApp());
}

class NikeOnboardingApp extends StatelessWidget {
  const NikeOnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPager(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}

class SplashPager extends StatefulWidget {
  const SplashPager({super.key});

  @override
  State<SplashPager> createState() => _SplashPagerState();
}

class _SplashPagerState extends State<SplashPager> {
  final PageController _controller = PageController();
  int selectedOption = -1;
  int currentPage = 0;

  List<String> options = ["Men's", "Women's", "Boys'", "Girls'"];
  List<String> images = [
    'https://i.pravatar.cc/100?img=1',
    'https://i.pravatar.cc/100?img=2',
    'https://i.pravatar.cc/100?img=3',
    'https://i.pravatar.cc/100?img=4',
  ];

  void nextPage() {
    if (currentPage < 3) {
      setState(() {
        currentPage++;
      });
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  double get progress => (currentPage + 1) / 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // Splash 1
              splashBackground(
                child: splashContent(
                  icon: Icons.arrow_forward,
                  title:
                  "To personalise your\n experience and \nconnect you to sport.",
                  buttonText: "Get Started",
                  onPressed: nextPage,
                ),
              ),



              // Splash 2
              splashBackground(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Center(
                        child: Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "Which products do\nyou use the most?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),

                      buildOptionRow(0, images[0], options[0]),
                      const Divider(color: Colors.white70),
                      buildOptionRow(1, images[1], options[1]),
                      const SizedBox(height: 16),
                      Text(
                        "Any others?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 16),
                      buildOptionRow(2, images[2], options[2]),
                      const SizedBox(height: 8),
                      const Divider(color: Colors.white70),
                      const SizedBox(height: 8),
                      buildOptionRow(3, images[3], options[3]),
                      const Spacer(),
                      Center(child: elevatedWhiteButton("Next", nextPage)),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

              // Splash 3
              splashBackground(
                child: splashContent(
                  title:
                  "Want to use location \n Services to help you \n find the closest Nike\n Store, access in-store \n and location-based\n features, and see \n experiences near you?",
                  buttonText: "Next",
                  onPressed: nextPage,
                ),
              ),

              // Splash 4
              splashBackground(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Center(
                        child: Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Get personalised ads\nby enabling app tracking",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(Icons.check, color: Colors.white),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Get personalised Nike ads on partner platforms based on your app activity",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(Icons.info_outline, color: Colors.white),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "On the next prompt, if you select 'Ask App Not to Track', you may see less relevant Nike ads.",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Learn more",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "On iOS, your permission is required to track your activity on this app on this device. This can be updated at any time from your device settings.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: elevatedWhiteButton("Next", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const IntermediateSplash()),
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Linear progress indicator

        ],
      ),
    );
  }

  Widget buildOptionRow(int index, String imageUrl, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Radio<int>(
            value: index,
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

Widget splashBackground({required Widget child}) {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(
        'assets/image/Group 784.png',
        fit: BoxFit.cover,
      ),
      Container(color: Colors.black.withOpacity(0.6)),
      child,
    ],
  );
}

Widget splashContent({
  IconData? icon,
  required String title,
  required String buttonText,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) Icon(icon, color: Colors.white, size: 40),
        const SizedBox(height: 30),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Center(child: elevatedWhiteButton(buttonText, onPressed)),
        const SizedBox(height: 30),
      ],
    ),
  );
}

Widget elevatedWhiteButton(String label, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    onPressed: onPressed,
    child: Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

class IntermediateSplash extends StatefulWidget {
  const IntermediateSplash({super.key});

  @override
  State<IntermediateSplash> createState() =>
      _IntermediateSplashState();
}

class _IntermediateSplashState extends State<IntermediateSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _fadeController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  NikeHomePage()),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF130026), // Dark purple
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            'assets/image/Group 646.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
