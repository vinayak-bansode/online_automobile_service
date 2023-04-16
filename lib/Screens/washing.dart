import 'package:flutter/material.dart';
import 'package:online_automobile_service/Screens/dashboard.dart';
import 'package:online_automobile_service/Screens/home_appbar.dart';

class TimeSlotSelectionScreen extends StatefulWidget {
  const TimeSlotSelectionScreen({Key? key}) : super(key: key);

  @override
  _TimeSlotSelectionScreenState createState() =>
      _TimeSlotSelectionScreenState();
}

class _TimeSlotSelectionScreenState extends State<TimeSlotSelectionScreen> {
  String? _selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onTap: () {}, title: 'Select Time Slot'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          RadioListTile(
            title: const Text('10am-11am'),
            value: '10am-11am',
            groupValue: _selectedTimeSlot,
            onChanged: (value) => setState(() => _selectedTimeSlot = value),
          ),
          RadioListTile(
            title: const Text('11am-12pm'),
            value: '11am-12pm',
            groupValue: _selectedTimeSlot,
            onChanged: (value) => setState(() => _selectedTimeSlot = value),
          ),
          RadioListTile(
            title: const Text('2pm-3pm'),
            value: '2pm-3pm',
            groupValue: _selectedTimeSlot,
            onChanged: (value) => setState(() => _selectedTimeSlot = value),
          ),
          RadioListTile(
            title: const Text('3pm-4pm'),
            value: '3pm-4pm',
            groupValue: _selectedTimeSlot,
            onChanged: (value) => setState(() => _selectedTimeSlot = value),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectedTimeSlot == null
                ? null
                : () {
                    // Save the selected time slot here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ));
                  },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
