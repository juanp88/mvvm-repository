import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/viewmodel/timezone_view_model.dart';
import '../data/models/time_zone_model.dart';

typedef void RefreshCallback();
String dropdownValue = "";

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key, required this.dropElements});

  final List<String> dropElements;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    var timeZoneProvider = context.watch<TimeZoneViewModel>();
    dropdownValue = widget.dropElements.first;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (String? value) {
          debugPrint(value);
          // timeZoneProvider
          //     .setTimeZoneList(TimeZone(datetime: "Prueba", timezone: value));
          timeZoneProvider.getNewTimeZones(value!);
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items:
            widget.dropElements.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
