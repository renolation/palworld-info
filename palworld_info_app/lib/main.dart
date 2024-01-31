import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/utils/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.latoTextTheme(ThemeData(brightness: Brightness.light).textTheme),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1D1D1E),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.latoTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

