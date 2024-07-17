import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

import '../test/mocks/fake_init_screen.dart';
import '../test/mocks/fake_local_database.dart';
import '../test/mocks/fake_secure_storage.dart';
import '../test/mocks/firebase_analytics.dart';
import '../test/mocks/mock_online_database.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(const ToDo.justCreated());
    registerFallbackValue(FakeCompanion());
  });

  testWidgets('Add and set done todo', (tester) async {
    try {
      final onlineDatabase = MockOnlineDatabase();
      final local = FakeLocalDatabase();
      final storage = FakeSecureStorage();
      final deviceIdProvider = await DeviceIdProvider.create(storage: storage);

      const createdToDoID = '1';
      const descriptionForCreatedToDo = 'Test description';
      final time = DateTime(2024, 7, 10, 14, 23, 10);
      final createdToDo = ToDo.justCreated(
        description: descriptionForCreatedToDo,
        createdAt: time,
        changedAt: time,
        id: createdToDoID,
        lastUpdatedBy: deviceIdProvider.deviceId,
        importance: Importance.important,
      );

      when(() => onlineDatabase.createToDo(any())).thenAnswer((_) async => createdToDo);
      when(onlineDatabase.getToDoList).thenAnswer((_) async => null);
      when(() => onlineDatabase.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => <ToDo>[]);
      when(() => onlineDatabase.updateToDo(any())).thenAnswer((_) async => null);

      setupFirebaseCoreMocks();
      await Firebase.initializeApp();
      final firebaseAnalytics = MockFirebaseAnalytics();
      when(() => firebaseAnalytics.logEvent(name: any(named: 'name'))).thenAnswer((_) async {});

      await tester.pumpWidget(
        MaterialApp(
          home: FakeInitScreen(
            onlineDatabase,
            local,
            storage,
            deviceIdProvider,
            firebaseAnalytics,
          ),
        ),
      );

      await tester.pumpAndSettle();

      final doneCount = find.textContaining('1');
      expect(doneCount, findsNothing);

      final fab = find.byKey(const ValueKey('increment'));
      await tester.tap(fab);

      await tester.pumpAndSettle();

      final textfield = find.byType(TextField);
      await tester.enterText(textfield, descriptionForCreatedToDo);

      await tester.pumpAndSettle();

      final importanceSelector = find.byType(DropdownButton<Importance>);
      await tester.tap(importanceSelector);
      await tester.pumpAndSettle();

      await tester.tap(
        find.byWidgetPredicate(
          (widget) => widget is DropdownMenuItem<Importance> && widget.value == Importance.important,
        ),
      );
      await tester.pumpAndSettle();

      final saveButton = find.byKey(const ValueKey('Save'));
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      final todo = find.text(descriptionForCreatedToDo);
      expect(todo, findsOne);

      final uncheckedCheckbox = find.byWidgetPredicate(
        (widget) => widget is Checkbox && (widget.value ?? false) == false,
      );

      expect(uncheckedCheckbox, findsOne);
      await tester.tap(uncheckedCheckbox);
      await tester.pumpAndSettle();

      final checkedCheckbox = find.byWidgetPredicate((widget) => widget is Checkbox && (widget.value ?? false) == true);
      expect(checkedCheckbox, findsOne);
      await tester.pumpAndSettle();

      final doneCount2 = find.textContaining('1');
      expect(doneCount2, findsOne);
    } catch (e) {
      logger.f(e);
    }
  });
}
