import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.withOpacity(0.2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: AppColors.light,
                strokeWidth: 8,
              ),
            ),
          ),
          Center(
            child: Text(
              'Загрузка...',
              style: AppTextStyles.heading2(),
            ),
          )
        ],
      ),
    );
  }
}
