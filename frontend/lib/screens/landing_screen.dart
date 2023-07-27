import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Waste Kitchen'),
      ),
      body: Column(
        children: [
          //
          Text("Landing Page",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }
}
