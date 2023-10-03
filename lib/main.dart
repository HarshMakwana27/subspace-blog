import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/screens/home_screen.dart';
import 'package:subspace/themes/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Sub Space',
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      home: const HomeScreen(),
      themeMode: ThemeMode.system,
    );
  }
}
