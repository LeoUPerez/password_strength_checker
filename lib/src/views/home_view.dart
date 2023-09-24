import 'package:flutter/material.dart';
import 'package:password_strength_checker/src/common/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.black,
        title: const Text(
          'Create Your Account',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
