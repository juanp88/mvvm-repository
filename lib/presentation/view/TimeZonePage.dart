import 'package:flutter/material.dart';

import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_repository/data/models/mappers/page_model_mapper.dart';
import 'package:mvvm_repository/data/models/page_model.dart';
import 'package:mvvm_repository/data/models/time_zone_model.dart';
import 'package:mvvm_repository/widgets/drop_down_button.dart';
import '../viewmodel/timezone_view_model.dart';

class TimeZonePage extends StatefulWidget {
  final Map<String, dynamic> data;
  TimeZonePage({Key? key, required this.data}) : super(key: key);

  @override
  State<TimeZonePage> createState() => _TimeZonePageState();
}

class _TimeZonePageState extends State<TimeZonePage> {
  late DateTime currentDate;
  late String currentTimeZone;
  List<String> dropElements = [];
  late TzPageModel model;

  @override
  void initState() {
    super.initState();
    getCurrentDate(context);
  }

  @override
  Widget build(BuildContext context) {
    var timeZoneProvider = context.watch<TimeZoneViewModel>();
    var mapper = PageModelMapper();

    model = mapper.fromMap(widget.data);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(model.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(child: Text("Choose a TimeZone to display")),
          const Divider(),
          CustomDropdownButton(dropElements: model.elements),
          Center(
            child: ListTile(
                title: const Text("Hora al iniciar el proyecto"),
                subtitle: Text(currentDate.toString())),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: timeZoneProvider.timeZoneList.length,
              itemBuilder: (BuildContext context, int index) {
                TimeZone timeZoneElement = timeZoneProvider.timeZoneList[index];
                return ListTile(
                  title: Text(timeZoneElement.timezone ?? ""),
                  subtitle: Text(timeZoneElement.datetime ?? ""),
                );
              }),
        ],
      ),
    );
  }

  void getCurrentDate(BuildContext context) async {
    currentDate = DateTime.now();
    currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
  }
}
