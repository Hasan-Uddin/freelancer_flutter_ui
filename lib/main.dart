import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freelancer_flutter_ui/data/api_services/frelancers_api.dart';
import 'package:freelancer_flutter_ui/domain/providers/freelancer_provider.dart';
import 'package:freelancer_flutter_ui/domain/providers/popular_services_provider.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/freelancer_tile.dart';
import 'package:provider/provider.dart';
import 'core/themes/app_theme.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  debugPaintBaselinesEnabled = false;
  debugPaintSizeEnabled = false;
  debugPaintPointersEnabled = false;
  debugPaintLayerBordersEnabled = false;
  runApp(
    MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => PopularServiceProvider()),
        ChangeNotifierProvider(create: (_) => FreelancerProvider()),
      ],
      child: const FreelancerApp(),
    ),
  );
}

class FreelancerApp extends StatefulWidget {
  const FreelancerApp({super.key});

  @override
  State<FreelancerApp> createState() => _FreelancerAppState();
}

class _FreelancerAppState extends State<FreelancerApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freelance Scaffold',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Material(child: HomeScreen()),
    );
  }
}
