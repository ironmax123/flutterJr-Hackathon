import 'package:flutter/material.dart';
import 'package:room_check/primary/utils/color.dart';

class HomeScreenLimit extends StatelessWidget {
  final ValueNotifier limitTime;
  const HomeScreenLimit({
    super.key,
    required this.limitTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '残り',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryBlack,
              ),
            ),
          ),
          const Text(
            '0:00',
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryBlack,
            ),
          ),
          TimerCircle(
            progressNotifier: ValueNotifier<double>(4.0),
            totalTime: 60,
          )
        ],
      ),
    );
  }
}

class TimerCircle extends StatelessWidget {
  final int totalTime;
  final ValueNotifier<double> progressNotifier;

  const TimerCircle({
    super.key,
    required this.totalTime,
    required this.progressNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: progressNotifier,
      builder: (context, progress, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // グレー背景
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: 1,
                strokeWidth: 12,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade300),
              ),
            ),
            // 青い進捗バー
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
