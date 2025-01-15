import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(TatoeApp());
}

class TatoeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TATOE',
      theme: ThemeData(),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Random _random = Random();
  int _randomNumber = 0;

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = _random.nextInt(10000); // Generate a random number between 0 and 9999
    });
  }

  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent so the gradient is visible
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]), // Dark blue back arrow
          onPressed: () {
            // Add any custom back logic here if needed
            Navigator.pop(context); // This will handle navigation back
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue[800]!, Colors.purple[800]!], // Space-inspired gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Title
              Text(
                'TATOE',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[400],
                ),
              ),
              SizedBox(height: 30),
              // Box with random number
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[900], // Dark blue color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$_randomNumber',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.grey[300], // Font color same as the background
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Add Team Button
              ElevatedButton(
                onPressed: _navigateToNextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700], // Dark green button
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add Team',
                  style: TextStyle(
                    color: Colors.grey[300], // Font color same as the background
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  void _navigateToThirdPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThirdPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent so the gradient is visible
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]), // Dark blue back arrow
          onPressed: () {
            Navigator.pop(context); // This will handle navigation back
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue[800]!, Colors.purple[800]!], // Space-inspired gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Title
              Text(
                'TATOE',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[400],
                ),
              ),
              SizedBox(height: 30),
              // Message Text
              Text(
                'You got assigned to a case!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              // Case Details Button
              ElevatedButton(
                onPressed: () => _navigateToThirdPage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Dark blue button
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Case Details',
                  style: TextStyle(
                    color: Colors.grey[300], // Font color same as the background
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int _remainingTime = 5 * 60; // 5 minutes in seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void _onTaskClick(String taskName) {
    print('$taskName clicked');
  }

  void _navigateToFourthPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FourthPage()), // Navigate to the FourthPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent so the gradient is visible
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]), // Dark blue back arrow
          onPressed: () {
            Navigator.pop(context); // This will handle navigation back
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue[800]!, Colors.purple[800]!], // Space-inspired gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Time Remaining Counter
              Text(
                'Time remaining: ${_formatTime(_remainingTime)}',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              // Photo Placeholder
              Container(
                color: Colors.grey[300],
                width: 200,
                height: 200,
                child: Center(
                  child: Icon(Icons.image, size: 100, color: Colors.black),
                ),
              ),
              SizedBox(height: 30),
              // Text below photo
              Text(
                'Your case is waiting!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow[200], // Best color to stand out against the background
                ),
              ),
              SizedBox(height: 30),
              // Task Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _onTaskClick("Task 1: Fix the tube"),
                    child: Text(
                      'Task 1: Fix the tube',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  TextButton(
                    onPressed: () => _onTaskClick("Task 2: Electricity"),
                    child: Text(
                      'Task 2: Electricity',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              // To Submit Button
              ElevatedButton(
                onPressed: () => _navigateToFourthPage(context), // Navigate to the Fourth Page
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Dark blue button
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'To Submit',
                  style: TextStyle(
                    color: Colors.grey[300], // Font color same as the background
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue[800]!, Colors.purple[800]!], // Space-inspired gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Title with bigger size and futuristic style
                Text(
                  'Submit your Case',
                  style: TextStyle(
                    fontSize: 50, // Increased font size for emphasis
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400],
                    letterSpacing: 5, // Adds some spacing between letters
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blueAccent,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                // Futuristic Photo Upload Form with glowing effect
                GestureDetector(
                  onTap: () {
                    // Trigger file upload logic
                    print('Upload photo clicked');
                  },
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue[900], // Dark background for futuristic feel
                      borderRadius: BorderRadius.circular(20), // Rounded edges
                      border: Border.all(
                        color: Colors.blueAccent, // Glowing border effect
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(

                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 80,
                        color: Colors.white.withOpacity(0.8), // Subtle icon color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Futuristic Text Box for typing message
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                    filled: true,
                    fillColor: Colors.blue[900], // Dark background for textbox
                    hintStyle: TextStyle(
                      color: Colors.grey[300], // Light hint text
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white, // Text color inside the box
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 40),

                // Finish Case Button with futuristic style
                ElevatedButton(
                  onPressed: () {
                    print('Finish Case button pressed');
                    // Handle case submission logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700], // Dark green button
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    elevation: 10,
                  ),
                  child: Text(
                    'Finish Case',
                    style: TextStyle(
                      color: Colors.grey[300], // Font color same as the background
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
