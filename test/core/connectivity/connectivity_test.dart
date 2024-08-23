import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/core/connectivity/connectivity.dart';

import '../../helpers/test_helpers/test_helpers.mocks.dart';



void main() {
  late MockConnectivity mockConnectivity;
  late NetworkConnectivityImp networkConnectivityImp;
  setUp(() {
    mockConnectivity = MockConnectivity();
    networkConnectivityImp = NetworkConnectivityImp(mockConnectivity);
  });
  group("Network Connection Test", () {
    test("should return true if mobile available", () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);
      // act
      final result = await networkConnectivityImp.isInternetConnected();
      // assert
      expect(result, equals(true));
    });

    test("should return true if wifi available", () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      // act
      final result = await networkConnectivityImp.isInternetConnected();
      // assert
      expect(result, equals(true));
    });

    test("should return false if wifi or mobile network are not available",
        () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.other);
      // act
      final result = await networkConnectivityImp.isInternetConnected();
      // assert
      expect(result, equals(false));
    });
  });
}
