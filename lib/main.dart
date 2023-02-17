import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_repository/presentation/view/TimeZonePage.dart';
import 'package:mvvm_repository/presentation/viewmodel/timezone_view_model.dart';
import 'package:http/http.dart' as http;

import 'data/repository/time_zones_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var response = await rootBundle.loadString('assets/config/time_zones.json');
  Map<String, dynamic> data = await json.decode(response);

  runApp(MyApp(localData: data));
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic> localData;
  const MyApp({required this.localData, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TimeZonesRepository _timeZoneRepository =
        TimeZoneRepositoryImpl(client: http.Client());

    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          TimeZoneViewModel(timeZoneRepository: _timeZoneRepository),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TimeZonePage(data: localData),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
