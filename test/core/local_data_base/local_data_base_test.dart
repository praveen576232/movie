import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/core/local_data_base/local_data_base.dart';

import '../../helpers/test_helpers/test_helpers.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late LocalDataBaseImp localDataBaseImp;
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataBaseImp = LocalDataBaseImp(mockSharedPreferences);
  });

  group("local Data base tests", () {
    const key = "test_database_key";
    const jsonData = {"a": 2, "b": 3};
    test("Should save json Object", () async {
      //arrange
      when(mockSharedPreferences.setString(key, jsonEncode(jsonData)))
          .thenAnswer((_) async => true);
      //act
      final result = await ((localDataBaseImp.saveJsonObject(key, jsonData)));
      // assets
      expect(result, equals(true));
    });

    test("Should get json Object", () async {
      //arrange
      when(mockSharedPreferences.getString(key))
          .thenAnswer((_) => jsonEncode(jsonData));
      //act
      final result = ((localDataBaseImp.getJsonObject(key)));
      // assets
      expect(result, equals(jsonData));
    });
  });
}
