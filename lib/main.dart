import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip Calculator',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const TipCalc(),
    );
  }
}

class TipCalc extends StatefulWidget {
  const TipCalc({Key? key}) : super(key: key);

  @override
  _TipCalcState createState() => _TipCalcState();
}

class _TipCalcState extends State<TipCalc> {
  // default bill amount percentage which will be updated by user using a form
  double _billAmount = 0;

  // default tip percentage which will be updated by user using a form
  double _tipPercentage = 15;

  double _totalTip = 0;
  double _totalAmount = 0;

  @override
  void initState() {
    super.initState();
  }

  // this function calculates the tip and total amount
  // and updates the state
  void _updateAmounts() {
    setState(() {
      _totalTip = _billAmount * _tipPercentage / 100;
      _totalAmount = _billAmount + _totalTip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.deepPurple,
        title: const Text('Tip Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bill Amount'),
                initialValue: _billAmount.toString(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (val) {
                  _billAmount = double.tryParse(val) ?? 0;
                  _updateAmounts();
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tip Percentage'),
                initialValue: _tipPercentage.toString(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (val) {
                  _tipPercentage = double.tryParse(val) ?? 0;
                  _updateAmounts();
                },
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('Tip Amount: '),
                      Text(
                        _totalTip.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text('Total Amount: '),
                      Text(
                        _totalAmount.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}