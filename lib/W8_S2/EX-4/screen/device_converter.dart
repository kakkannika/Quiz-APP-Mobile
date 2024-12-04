import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final TextEditingController dollarController = TextEditingController();
  String selectedDevice = 'Euro';
  double convertedAmount = 0.0;

  final Map<String, double> conversionRates = {
    'Euro': 0.85, 
    'Riel': 4080.0, 
    'Dond': 24000.0,
  };

  @override
  void initState() {
    super.initState();
   }

  void convertCurrency() {
    final double? dollarAmount = double.tryParse(dollarController.text);
    if (dollarAmount != null) {
      setState(() {
        convertedAmount = dollarAmount * conversionRates[selectedDevice]!;
      });
    } else {
      setState(() {
        convertedAmount = 0.0; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
            controller: dollarController,
            decoration: InputDecoration(
              prefix: const Text('\$ '),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Enter an amount in dollar',
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          const Text("Device:"),
          DropdownButton<String>(
            value: selectedDevice,
            dropdownColor: Colors.orange,
            items: conversionRates.keys.map((String device) {
              return DropdownMenuItem<String>(
                value: device,
                child: Text(device),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedDevice = newValue!;
                convertCurrency();
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                convertedAmount > 0
                    ? '${convertedAmount.toStringAsFixed(2)} $selectedDevice'
                    : ' ',
                style: const TextStyle(color: Colors.black),
              )),
        ],
      )),
    );
  }
}