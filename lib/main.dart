import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/profile_tile.dart';
import 'package:provider/provider.dart';
import 'core/themes/app_theme.dart';
import 'domain/providers/home_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
      child: const FreelancerApp(),
    ),
  );
}

class FreelancerApp extends StatelessWidget {
  const FreelancerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freelance Scaffold',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
