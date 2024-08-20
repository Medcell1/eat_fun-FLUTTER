import 'package:eat_fun/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'view.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  int _selectedSegment = 1;
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<Offset> _containerSlideAnimation;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _bounceAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _containerSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _flipAnimation = Tween<double>(begin: 0, end: math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleForm() {
    setState(() {
      _selectedSegment = _selectedSegment == 1 ? 2 : 1;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              CustomEatFunWidget(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              Positioned(
                top: screenHeight * 0.25,
                left: screenWidth * .15,
                child: SlideTransition(
                  position: _containerSlideAnimation,
                  child: Container(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: formBorderColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ScaleTransition(
                              scale: _bounceAnimation,
                              child: SizedBox(
                                height: 35,
                                child: CustomSlidingSegmentedControl<int>(
                                  initialValue: _selectedSegment,
                                  onValueChanged: (int value) {
                                    _toggleForm();
                                  },
                                  children: {
                                    1: CustomText(
                                      fontFamily: 'Rosario',
                                      textStyle: TextStyle(
                                        color: _selectedSegment == 1
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                      text: 'Log in',
                                    ),
                                    2: CustomText(
                                      fontFamily: 'Rosario',
                                      textStyle: TextStyle(
                                        color: _selectedSegment == 2
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                      text: 'Sign up',
                                    ),
                                  },
                                  isStretch: true,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: primaryColor),
                                  ),
                                  thumbDecoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.1),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.0, 2.0),
                                      ),
                                    ],
                                  ),
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCirc,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _flipAnimation,
                              builder: (context, child) {
                                return Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(_flipAnimation.value),
                                  alignment: Alignment.center,
                                  child: _flipAnimation.value <= math.pi / 2
                                      ? _buildForm(_selectedSegment)
                                      : Transform(
                                          transform: Matrix4.identity()
                                            ..rotateY(math.pi),
                                          alignment: Alignment.center,
                                          child: _buildForm(_selectedSegment),
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: screenHeight * 0.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        globalPizza,
                        height: screenHeight * 0.13,
                      ),
                      Image.asset(
                        globalBurger,
                        height: screenHeight * 0.13,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(int selectedSegment) {
    return selectedSegment == 1 ? _buildLoginForm() : _buildSignupForm();
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        const ReusableTextField(hintText: "Enter email or username"),
        20.spaceHeight(),
        const ReusableTextField(hintText: "Password"),
        20.spaceHeight(),
        const Align(
          alignment: Alignment.topRight,
          child: CustomText(
            textStyle: TextStyle(fontSize: 12),
            text: "Forgot Password?",
          ),
        ),
        20.spaceHeight(),
        CustomPrimaryButton(
          text: 'Log In',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        30.spaceHeight(),
        const CustomText(
          textStyle: TextStyle(color: formBorderColor, fontSize: 12),
          text: "OR",
        ),
        20.spaceHeight(),
        const OtherSignInMethodRow()
      ],
    );
  }

  Widget _buildSignupForm() {
    return Column(
      children: [
        const ReusableTextField(hintText: "Enter email or username"),
        20.spaceHeight(),
        const ReusableTextField(hintText: "Password"),
        20.spaceHeight(),
        const ReusableTextField(hintText: "Confirm Password"),
        20.spaceHeight(),
        const CustomPrimaryButton(text: "Sign Up"),
        30.spaceHeight(),
        const CustomText(
          textStyle: TextStyle(color: formBorderColor, fontSize: 12),
          text: "OR",
        ),
        20.spaceHeight(),
        const OtherSignInMethodRow()
      ],
    );
  }
}
