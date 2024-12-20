import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/router/routing_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final ColorScheme klinikColorTheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 247, 162),
    brightness: Brightness.light);

final ThemeData klinikTheme = ThemeData().copyWith(
  colorScheme: klinikColorTheme,
  textTheme: GoogleFonts.dmSansTextTheme().copyWith(
    titleLarge:
        GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 35),
    titleMedium: GoogleFonts.dmSans(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        color: klinikColorTheme.secondary),
    titleSmall: GoogleFonts.dmSans(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: klinikColorTheme.primary),
    labelSmall: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: 15),
  ),
  appBarTheme: AppBarTheme(
    color: klinikColorTheme.surfaceContainer,
    foregroundColor: klinikColorTheme.primary,
  ),
  navigationBarTheme: NavigationBarThemeData(
    iconTheme: WidgetStateProperty.resolveWith((Set<WidgetState> states) =>
        states.contains(WidgetState.selected)
            ? (IconThemeData(color: klinikColorTheme.primary))
            : (IconThemeData(color: klinikColorTheme.onSurface))),
    height: 65,
    backgroundColor: klinikColorTheme.surfaceContainer,
    // indicatorColor: klinikColorTheme.secondaryContainer,
    // indicatorColor: klinikColorTheme.inversePrimary,
    indicatorColor: klinikColorTheme.secondaryContainer,
    // indicatorColor: Color.fromARGB(0, 0, 0, 0),

    indicatorShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    // indicatorShape: const CircleBorder(),
    // indicatorShape: const BeveledRectangleBorder(),
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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
      url: dotenv.env["SUPABASE_PROJECT_URL"]!);
  GoRouter router = RoutingService().router;
  Supabase.instance.client.auth.onAuthStateChange.listen((AuthState data) {
    // print("just refreshed");
    router.refresh();
  });

  runApp(MyApp(
    router: router,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.router});

  final GoRouter router;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    await Future.delayed(const Duration(milliseconds: 650));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Klinik Ganesha",
      theme: klinikTheme,
      routerConfig: widget.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
