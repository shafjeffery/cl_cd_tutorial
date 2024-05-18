import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'ProfilePage.dart';
import 'main.dart';



class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static final List<String> factoryNames = ['Factory 1', 'Factory 2', 'Factory 3', 'Factory 4'];
  static final List<IconData> factoryIcons = [Icons.factory, Icons.factory, Icons.factory, Icons.factory];
  int selectedIndex = 2;
  int buttonIndex = 2;



  void _onItemTapped(int index) {
    setState(() {
      buttonIndex = index;
    });

    // Navigate to the corresponding page
    switch (index) {

      case 0: // Profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      case 1: // Home (Factory Dashboard)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FactoryDashboard()),
        );// Close the ProfilePage and go back to the FactoryDashboard
        break;
      case 2: // Settings
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SettingsPage()),
            );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Center(
          child: Text(
            factoryNames[selectedIndex],
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black, // Set icon color to black
            onPressed: () {
              _onItemTapped(1); // Navigate to settings page
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.0),
          // Dashboard Widget
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Minimum Threshold',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.info_outline, size: 28), // Adjust the size of the info icon
                          Spacer(),
                          Container(
                            width: 55, // Adjust the width here
                            height: 40, // Adjust the height here
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.purple.shade900, size: 25), // Adjust the size of the pencil icon
                              onPressed: () {
                                // Handle edit button press
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Steam\nPressure',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 100), // Adding space between the two sections
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Steam\nFlow',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menempatkan teks pada ujung kiri dan kanan
                        children: [
                          Expanded(
                            child: Container(
                              width: 140, // Adjust the width of the container
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey.shade700), // Add border
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.grey.shade700),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '29',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: double.infinity,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          'bar',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20), // Adding space between the two sections
                          Expanded(
                            child: Container(
                              width: 140, // Adjust the width of the container
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey.shade700), // Add border
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.grey.shade700),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '22',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: double.infinity,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          'T/H',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Water\nLevel',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 100), // Adding space between the two sections
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Power\nFrequency',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menempatkan teks pada ujung kiri dan kanan
                        children: [
                          Expanded(
                            child: Container(
                              width: 140, // Adjust the width of the container
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey.shade700), // Add border
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.grey.shade700),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '53',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: double.infinity,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          '%',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20), // Adding space between the two sections
                          Expanded(
                            child: Container(
                              width: 140, // Adjust the width of the container
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey.shade700), // Add border
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.grey.shade700),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '48',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: double.infinity,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          'Hz',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 3.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int index = 0; index < factoryNames.length; index++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: FactoryButton(
                          icon: factoryIcons[index],
                          text: factoryNames[index],
                          onPressed: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          isSelected: index == selectedIndex,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: buttonIndex,
        selectedItemColor: Colors.deepPurple,
      ),
    );
  }
}




class WhiteBox extends StatelessWidget {
  final Widget child;

  const WhiteBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}

class FactoryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;
  final bool isSelected;

  const FactoryButton({Key? key, required this.text, required this.icon, this.onPressed, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:30.0, horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.black,
              size: 25.0,
            ),
            SizedBox(height: 3.0),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.black,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
