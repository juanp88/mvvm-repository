import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_repository/data/models/mappers/time_zone_mapper.dart';
import 'package:mvvm_repository/data/models/time_zone_model.dart';
import 'package:mvvm_repository/data/services/api_service.dart';

abstract class TimeZonesRepository {
  Future<TimeZone> getTimeZoneData(String timeZone);
}

class TimeZoneRepositoryImpl implements TimeZonesRepository {
  final http.Client _client;

  TimeZoneRepositoryImpl({required http.Client client}) : _client = client;

  @override
  Future<TimeZone> getTimeZoneData(String timeZone) async {
    var jsonData = await ApiService().getTimeZoneData(_client, timeZone);
    TimeZone data = TimeZoneMapper().fromMap(jsonData);

    return data;
  }
}
