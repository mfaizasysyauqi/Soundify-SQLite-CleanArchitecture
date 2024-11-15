import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundify/presentation/providers/primary_widget_state_provider.dart';
import 'package:soundify/presentation/providers/secondary_widget_state_provider.dart';
import 'package:soundify/presentation/screens/auth/login_screen.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the window manager
  await windowManager.ensureInitialized();

  // Configure window settings
  await WindowManager.instance.setMinimumSize(const Size(820, 550));
  await WindowManager.instance.setResizable(true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrimaryWidgetStateProvider()),
        ChangeNotifierProvider(create: (_) => SecondaryWidgetStateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Soundify',
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
