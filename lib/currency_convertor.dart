import 'package:flutter/material.dart';

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Convertio",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0), // Adjust the height as needed
          child: Text(
            "Convert your currency now!!",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₹ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: "Enter the amount in USD",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.blue,
                  ),
                  filled: true,
                  fillColor: Colors.white60,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 85;
                  });
                },
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(8),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal.shade50,
    );
  }
}
