import '../time_zone_model.dart';
import 'base_mapper.dart';

class TimeZoneMapper implements Mapper<TimeZone> {
  @override
  TimeZone fromMap(Map<String, dynamic> json) {
    return TimeZone(datetime: json['datetime'], timezone: json['timezone']);
  }

  @override
  Map<String, dynamic>? toMap(TimeZone model) =>
      {"datetime": model.datetime, "timezone": model.timezone};
}
