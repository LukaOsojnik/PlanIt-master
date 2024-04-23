import 'package:flutter/material.dart';
import 'package:flutterproject/screens/treci_ekran.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatefulWidget {
  final String text;
  final String date;
  final double value;

  const SecondScreen({
    Key? key,
    required this.text,
    required this.date,
    required this.value,
  }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<bool> _isSelected = [];
  bool _isTapped = false;
  List<String> _selectedOptions = [];

  List<String> categories = [
    "Partying",
    "Sightseeing",
    "Adventure",
    "Adrenaline",
    "Sports",
    "Gastronomy",
    "Outdoor",
    "Old city",
    "Beaches",
    "Relaxing",
  ];

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(categories.length, (_) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Center(
            child: _titleWidget(),
          ),
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              spacing: 15.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.end,
              children: _buildSmallContainers(),
            ),
          ),
          Expanded(
            child: _nextButton(),
          ),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      height: 80,
      width: 350,
      alignment: Alignment.center,
      child: Text(
        "What are you up to?",
        style: GoogleFonts.comfortaa(
          textStyle: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          width: 300,
          height: 80,
          child: ElevatedButton(
            onPressed: _isTapped ? _navigateToNextScreen : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isTapped ? Colors.blue : Colors.grey,
              minimumSize: Size.fromHeight(60),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _isTapped ? Colors.white : Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThirdScreen(
          location:widget.text,
          date:widget.date,
          budget:widget.value,
          selectedOptions: _selectedOptions,
        ),
      ),
    );
  }

  List<Widget> _buildSmallContainers() {
    return List.generate(categories.length, (index) {
      final text = categories[index];
      final textLength = text.length;
      final double containerWidth = textLength * 10.0 + 10.0;

      return GestureDetector(
        onTap: () {
          setState(() {
            _isSelected[index] = !_isSelected[index];
            if (_isSelected[index]) {
              _selectedOptions.add(text);
            } else {
              _selectedOptions.remove(text);
            }
            _isTapped = _selectedOptions.isNotEmpty;
          });
        },
        child: Container(
          width: containerWidth,
          height: 40,
          decoration: BoxDecoration(
            color: _isSelected[index] ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: _isSelected[index] ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    });
  }

  
}

