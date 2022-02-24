import 'package:bankapp/app/modules/views/auth/login_page.dart';
import 'package:bankapp/app/modules/views/auth/register_page.dart';
import 'package:bankapp/app/shared/core/exports.dart';
import 'package:bankapp/app/shared/services/auth_wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      //initialRoute: '/welcome',
      home: GetIt.I<AuthWrapper>().auth,
      routes: {
        '/home': (_) => const HomePage(),
        '/pix': (_) => const PixPage(),
        '/user': (_) => const UserPage(),
        '/extract': (_) => const ExtractPage(),
        '/deposit': (_) => const DepositPage(),
        '/cards': (_) => const CardsPage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/welcome': (_) => const WelcomePage(),
      },
    );
  }
}

// return ScreenUtilInit(
//       designSize: const Size(392, 759),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: () => MaterialApp(
//         title: 'BankApp',
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme.theme(),
//         builder: (context, widget) {
//           ScreenUtil.setContext(context);
//           return MediaQuery(
//             data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//             child: widget!,
//           );
//         },
//         initialRoute: '/',
//         routes: {
//           '/': (_) => const HomePage(),
//           '/user': (_) => const UserPage(),
//           '/extract': (_) => const ExtractPage(),
//           '/deposit': (_) => const DepositPage(),
//           '/cards': (_) => const CardsPage(),
//         },
//       ),
//     );
