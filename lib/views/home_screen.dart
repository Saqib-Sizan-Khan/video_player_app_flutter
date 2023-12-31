import 'package:flutter/material.dart';
import 'package:video_player_app_flutter/widgets/vp_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            VPText(text: 'Trending Videos')
          ],
        ),
      ),
    );
  }
}
