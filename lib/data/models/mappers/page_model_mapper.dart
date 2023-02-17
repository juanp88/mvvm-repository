import 'package:flutter/material.dart';
import 'package:mvvm_repository/data/models/mappers/base_mapper.dart';
import 'package:mvvm_repository/data/models/page_model.dart';

class PageModelMapper implements Mapper<TzPageModel> {
  @override
  TzPageModel fromMap(Map<String, dynamic> json) {
    return TzPageModel(
        title: json['title'], elements: List<String>.from(json["time-zones"]));
  }

  @override
  Map<String, dynamic>? toMap(TzPageModel data) {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
