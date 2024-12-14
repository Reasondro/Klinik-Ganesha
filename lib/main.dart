import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/router/routing_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
      url: dotenv.env["SUPABASE_PROJECT_URL"]!);

  GoRouter router = RoutingService().router;
  Supabase.instance.client.auth.onAuthStateChange.listen((AuthState data) {
    router.refresh();
  });

  runApp(MyApp(
    router: router,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
