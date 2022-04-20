import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              color: AppColors.light,
              strokeWidth: 8,
            ),
          ),
          Text(
            'Загрузка...',
            style: AppTextStyles.heading2(),
          )
        ],
      ),
    );
  }
}
