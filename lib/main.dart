import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/router/routing_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme klinikColorTheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 247, 162),
    brightness: Brightness.light);

final ThemeData klinikTheme = ThemeData().copyWith(
  colorScheme: klinikColorTheme,
  textTheme: GoogleFonts.dmSansTextTheme().copyWith(
    titleLarge:
        GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 35),
    titleMedium: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: 30),
    labelSmall: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: 15),
  ),
  appBarTheme: AppBarTheme(
    color: klinikColorTheme.surfaceContainer,
    foregroundColor: klinikColorTheme.primary,
  ),
  navigationBarTheme: NavigationBarThemeData(
    height: 60,
    backgroundColor: klinikColorTheme.surfaceContainer,
    indicatorColor: klinikColorTheme.secondaryContainer,
    // indicatorShape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(10)),
    // ),
    indicatorShape: const CircleBorder(),
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        // color: klinikColorTheme.onSurface,
        color: klinikColorTheme.primary,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  scaffoldBackgroundColor: klinikColorTheme.surface,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
      url: dotenv.env["SUPABASE_PROJECT_URL"]!);
  GoRouter router = RoutingService().router;
  Supabase.instance.client.auth.onAuthStateChange.listen((AuthState data) {
    print("just refreshed");
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
      title: "Klinik Ganesha",
      theme: klinikTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
