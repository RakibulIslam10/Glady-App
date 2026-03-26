import 'dart:async';
import '../utils/basic_import.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.onResendCode});

  final VoidCallback onResendCode;

  @override
  State<TimerWidget> createState() => _TimerWidgetState(); // ✅ FIXED
}

class _TimerWidgetState extends State<TimerWidget> {
  late int totalTimeInSeconds;
  Timer? _timer;
  bool showResend = false;

  @override
  void initState() {
    super.initState();
    totalTimeInSeconds = _parseTime('00:60');
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel(); // ✅ safety (avoid multiple timers)

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalTimeInSeconds > 0) {
        setState(() {
          totalTimeInSeconds--;
        });
      } else {
        setState(() {
          showResend = true;
        });
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    setState(() {
      totalTimeInSeconds = _parseTime('00:30');
      showResend = false;
    });
    startTimer();
  }

  // Parse "mm:ss" → seconds
  int _parseTime(String time) {
    final parts = time.split(':');
    final minutes = int.parse(parts[0]);
    final seconds = int.parse(parts[1]);
    return minutes * 60 + seconds;
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds =
    (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.5,
      ),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          TextWidget(
            'Didn’t get a code? ',
            fontWeight: FontWeight.w400,
            fontSize: Dimensions.titleSmall,
          ),
          Space.width.v5,
          TextWidget(
            showResend
                ? 'Resend Code'
                : formatTime(totalTimeInSeconds),
            color: CustomColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.titleSmall,
            onTap: () {
              if (showResend) {
                widget.onResendCode();
                resetTimer();
              }
            },
          ),
        ],
      ),
    );
  }
}