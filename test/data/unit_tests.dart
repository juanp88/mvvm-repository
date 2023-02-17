import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_repository/data/models/mappers/time_zone_mapper.dart';
import 'package:mvvm_repository/data/models/time_zone_model.dart';
import 'package:mvvm_repository/data/repository/time_zones_repository.dart';

import 'mock_json.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  final client = MockHttpClient();
  late TimeZonesRepository timeZonesRepository;
  const String timeZone = "America/Boa_Vista";

  setUp(() {
    registerFallbackValue(FakeUri());
    timeZonesRepository = TimeZoneRepositoryImpl(client: client);
  });

  void setUpMockHttpClientSuccess200(Map<String, dynamic> mockJson) {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response(json.encode(mockJson), 200));
  }

  TimeZone timeZoneModel = TimeZoneMapper().fromMap(mockResponseJson);

  group('TimeZoneRepository tests', () {
    test('getPosts returns the timezone data', () async {
      final expectedData = TimeZone(
          datetime: "2023-02-17T10:07:17.846493-04:00",
          timezone: "America/Boa_Vista");
// arrange
      setUpMockHttpClientSuccess200(mockResponseJson);
//act
      final data = await timeZonesRepository.getTimeZoneData(timeZone);
//assert
      expect(data.datetime, expectedData.datetime);
    });
  });
}
