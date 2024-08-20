import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScaleAnimation;
  late Animation<Offset> _dishSlideAnimation;

  @override
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _dishSlideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );

    _controller.forward();
    pushToNextPage();
  }

  void navigate() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  pushToNextPage() {
    Future.delayed(const Duration(seconds: 3), navigate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * .35,
            left: screenWidth * .25,
            child: ScaleTransition(
              scale: _logoScaleAnimation,
              child: EatFunLogo(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                eatFontSize: 50,
                funFontSize: 44,
                imageHeight: 0.3,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SlideTransition(
              position: _dishSlideAnimation,
              child: Image.asset(
                splashDish,
                height: screenHeight * 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


