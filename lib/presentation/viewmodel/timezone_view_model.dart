import 'package:flutter/material.dart';

import '../../data/models/time_zone_model.dart';
import '../../data/repository/time_zones_repository.dart';

class TimeZoneViewModel extends ChangeNotifier {
  final List<TimeZone> _timeZoneList = [];
  final TimeZonesRepository _timeZoneRepository;

  TimeZoneViewModel({required TimeZonesRepository timeZoneRepository})
      : _timeZoneRepository = timeZoneRepository;

  get timeZoneList {
    return _timeZoneList;
  }

  setTimeZoneList(TimeZone timeZone) {
    _timeZoneList.add(timeZone);
    notifyListeners();
  }

  getNewTimeZones(String timeZone) async {
    var data = await _timeZoneRepository.getTimeZoneData(timeZone);
    setTimeZoneList(data);
  }
}
