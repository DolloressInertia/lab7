// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:lab7/register_page.dart';
// import 'package:lab7/user_info_page.dart';
// //import 'home.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await EasyLocalization.ensureInitialized();

//   runApp(
//     EasyLocalization(
//       supportedLocales: const [
//         Locale('ru'), // Russian locale
//         Locale('kk'), // Kazakh locale
//       ],
//       path: 'assets/translations', // <-- Path to your JSON/ARB files
//       fallbackLocale: const Locale('ru'), // <-- Fallback language
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => RegisterPage(),
//         '/second': (context) => UserInfoPage(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BLoC packages
import 'register_page.dart';
import 'user_info_page.dart';

// Import the BLoC and Repository files (assuming paths based on your structure)
import 'bloc/auth_bloc.dart';
import 'repositories/auth_repository.dart';

// Instantiate the repository globally or pass it to MyApp
final AuthRepository authRepository = AuthRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize BLoC providers before the app starts
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'), // Russian locale
        Locale('kk'), // Kazakh locale
      ],
      path: 'assets/translations', // <-- Path to your JSON/ARB files
      fallbackLocale: const Locale('ru'), // <-- Fallback language
      // Pass the repository to MyApp
      child: MyApp(authRepository: authRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    // 1. Provide the AuthRepository to the widget tree
    return RepositoryProvider<AuthRepository>.value(
      value: authRepository,
      // 2. Provide the AuthBloc, which requires the AuthRepository
      child: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          // 2. FIX: Call the constructor using the named argument
          authRepository: context.read<AuthRepository>(),
        ),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // Use a key for the MaterialApp to help with BLoC testing/rebuilding if needed
          key: ValueKey(context.locale),

          initialRoute: '/',
          routes: {
            '/': (context) => const RegisterPage(), // Registration Page (Start)
            '/second': (context) =>
                const UserInfoPage(), // Main Page (Destination on Success)
          },
        ),
      ),
    );
  }
}
