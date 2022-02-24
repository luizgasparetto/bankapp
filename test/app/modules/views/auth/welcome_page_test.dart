import 'package:bankapp/app/shared/core/exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late MockNavigatorObserver _navigatorObserver;

  setUp(() => _navigatorObserver = MockNavigatorObserver());

  group('WelcomePage |', () {
    testWidgets('should render the WelcomePage', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: WelcomePage()));

      expect(find.text('Hey! Welcome'), findsOneWidget);

      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });

    testWidgets('should go to LoginPage', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const WelcomePage(),
        navigatorObservers: [_navigatorObserver],
      ));

      final haveAccountButton = find.byKey(const Key('accountButton'));
      expect(haveAccountButton, findsOneWidget);

      await tester.tap(haveAccountButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      // verify(_navigatorObserver.didPush(
      //     MaterialPageRoute(builder: (_) => const WelcomePage()),
      //     MaterialPageRoute(builder: (_) => const LoginPage())));
      expect(find.text('Hello Again!'), findsOneWidget);
    }, skip: true);
  });
}
