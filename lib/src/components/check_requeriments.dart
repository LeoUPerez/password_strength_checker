import 'package:flutter/material.dart';
import 'package:password_strength_checker/src/common/app_colors.dart';

class CheckRequeriments extends StatelessWidget {
  const CheckRequeriments({super.key, required this.textInfo, required this.checking});

  final String textInfo;
  final bool checking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.5),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: checking ? Colors.green : Colors.transparent,
                border: Border.all(width: .5, color: AppColors.white),
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * .10)),
            child: const Icon(Icons.check, color: AppColors.white, size: 11),
          ),
          const SizedBox(width: 10),
          Text(textInfo, style: const TextStyle(color: AppColors.white))
        ],
      ),
    );
  }
}
