import 'package:flutter/material.dart';
void main() => runApp(GreenTrayApp() as Widget);

class GreenTrayApp {
}

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({Key? key}) : super(key: key);

  @override
  _FrequencyPageState createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  String selectedFrequency = 'Daily'; // Default selection
  DateTime? selectedDate; // To hold selected date

  // List of frequency options
  final List<String> frequencyOptions = ['Daily', 'Weekly', 'Monthly', 'Yearly'];

  // Function to pick a date from calendar
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default today's date
      firstDate: DateTime.now(), // Starting today
      lastDate: DateTime(2101), // Future limit
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Delivery Frequency'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Frequency:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedFrequency,
              items: frequencyOptions.map((String frequency) {
                return DropdownMenuItem<String>(
                  value: frequency,
                  child: Text(frequency),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFrequency = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Delivery Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _selectDate(context),
              child: const Text(
                'Choose Date',
                style: TextStyle(fontSize: 16),
              ),
            ),
            selectedDate != null
                ? Text(
                    "Selected date: ${selectedDate!.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 16),
                  )
                : const Text(
                    'No date selected',
                    style: TextStyle(fontSize: 16),
                  ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle the save or next logic here
                if (selectedDate != null) {
                  // Navigate to the next screen or save data
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
