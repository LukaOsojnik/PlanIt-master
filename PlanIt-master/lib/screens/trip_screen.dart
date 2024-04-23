import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterproject/screens/drugi_ekran.dart';
import "package:google_fonts/google_fonts.dart";

class TripScreen extends StatefulWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  TripScreenState createState() => TripScreenState();
}

class TripScreenState extends State<TripScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  double _budgetValue = 0;

  bool _isNextButtonEnabled() {
    return _locationController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _budgetValue > 0;
  }

  @override
  void initState() {
    super.initState();
    _locationController.addListener(_updateButtonState);
    _dateController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _locationController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    'Welcome to Croatia',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),

                // Najava kreiranja puta
                Text(
                  'Your trip starts here! ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Second Location TextField
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: TextField(
                              controller: _locationController,
                              decoration: InputDecoration(
                                hintText: 'Location',
                                filled: true,
                                prefixIcon: Icon(Icons.search),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 55),
                        Expanded(
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: TextField(
                              controller: _dateController,
                              decoration: InputDecoration(
                                hintText: 'Date of your trip',
                                filled: true,
                                prefixIcon: Icon(Icons.calendar_today),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              readOnly: true,
                              onTap: () {
                                _selectDate(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your budget (€)',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Slider(
                            value: _budgetValue,
                            divisions: 200,
                            min: 0,
                            max: 1000,
                            onChanged: (newValue) {
                              setState(() {
                                _budgetValue = newValue;
                              });
                            },
                            activeColor: Colors.blue,
                            label: _budgetValue.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _nextButton(),
                ),
                 // Ensure space for navigation bar
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 300,
          height: 80,
          child: ElevatedButton(
            onPressed: _isNextButtonEnabled()
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          text: _locationController.text,
                          date: _dateController.text,
                          value: _budgetValue,
                        ),
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isNextButtonEnabled() ? Colors.blue : Colors.grey,
              minimumSize: Size.fromHeight(60),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _isNextButtonEnabled() ? Colors.white : Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
