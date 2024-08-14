import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tiga_belas_apps/core/common/app/providers/user_provider.dart';
import 'package:tiga_belas_apps/core/routes/router.dart';
import 'package:tiga_belas_apps/core/services/injection_container.dart';
import 'package:tiga_belas_apps/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // ChangeNotifierProvider(create: (_) => DashboardController()),
        // ChangeNotifierProvider(create: (_) => CourseOfTheDayNotofier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tiga Belas Education Center Apps',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.openSans().fontFamily,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          colorScheme:
              ColorScheme.fromSwatch(accentColor: Colors.white),
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
