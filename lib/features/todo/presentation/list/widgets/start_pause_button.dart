import 'package:flutter/material.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Start',
          ),
          Icon(
            Icons.play_arrow,
          ),
        ],
      ),
    );
  }
}
