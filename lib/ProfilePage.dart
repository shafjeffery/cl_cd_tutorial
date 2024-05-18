import 'package:flutter/material.dart';
import 'SettingsPage.dart';
import 'main.dart'; //

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static final List<String> factoryNames = ['Factory 1', 'Factory 2', 'Factory 3', 'Factory 4'];
  static final List<IconData> factoryIcons = [Icons.factory, Icons.factory, Icons.factory, Icons.factory];
  int selectedIndex = 0;
  int buttonIndex = 0;
  bool _agreeToTerms = false;

  void _onItemTapped(int index) {
    setState(() {
      buttonIndex = index;
    });
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            factoryNames[selectedIndex],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: () {
              _onItemTapped(2); // Navigate to SettingsPage
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 5.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( left: 5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Image.asset(
                              'images/upm.png',
                              width: 150,
                              height: 100,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Welcome !',
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(height: 1),
                          Container(
                            height: 340,
                            width: 340,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5), // Shadow color
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              color: Color.fromARGB(255, 249, 208, 206),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Enter your mobile number to activate your account.',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    '',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'images/malaysia flag.png',
                                            height: 30, // Adjust height as needed
                                          ),
                                          const SizedBox(width: 10), // Add some space between the image and the text
                                          const Text(
                                            '+60',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 30),
                                      Expanded(
                                        child: Container(
                                          height: 50, // Adjust height as needed
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '',
                                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                            ),
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _agreeToTerms,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _agreeToTerms = newValue!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _agreeToTerms = !_agreeToTerms;
                                          });
                                        },
                                        child: const Text(
                                          'I agree to the terms & conditions',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                   Container(
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ActivationPage()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.white),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        )),
                                      ),
                                      child: const Text(
                                        'Get Activation Code',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 106, 62, 113),
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  )

                                ],
                              ),
                            ),

                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                // Add onTap functionality for the disclaimer and privacy statement
                              },
                              child: const Text(
                                'Disclaimer | Privacy Statement',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              'Copyright UPM & Kejuruteraan Minyak Sawit \nCSS Sdn. Bhd.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )

                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(), // Placeholder for profile page content
                    ),
                  ],
                ),
              ),
            ),

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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
      ),

    );
  }
}

class ActivationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 20.0), // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0), // Add padding below the image
              child: Image.network(
                'https://www.upm.edu.my/assets/images23/20170406143426UPM-New_FINAL.jpg',
                width: 200, // Adjust width as needed
                height: 100, // Adjust height as needed
              ),
            ),
            Text(
              'Welcome !',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1), // Add some space between the text and the white box
            Container(
              height: 350,
              width: 350, // Adjust height and width of the white box
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white, // Change color to white
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter the activation code you receive via SMS.',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20), // Add some space between the text and the form box
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white, // Change color of form box to white
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black), // Add black outline
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'OTP',
                                hintStyle: TextStyle(color: Colors.grey.shade700), // Add grey hint text color
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Adjust padding as needed
                                border: InputBorder.none, // Remove border
                              ),
                              maxLength: 6, // Limit input to 6 characters
                              keyboardType: TextInputType.number, // Set keyboard type to number
                              textAlign: TextAlign.center, // Center the text
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Add space between the form box and the new content
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive?",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(width: 5), // Add space between the text and the "Tap here" text
                        GestureDetector(
                          onTap: () {
                            // Add functionality for the "Tap here" action
                          },
                          child: Text(
                            'Tap here',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Add space between the "Tap here" and the button
                    Center(
                      child: Container(
                        width: 160, // Adjust button width as needed
                        height: 50, // Adjust button height as needed
                        child: ElevatedButton(
                          onPressed: () {
                            // Add functionality for the activate button
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ActivationSuccessPage()),
                            );
                          },
                          child: const Text(
                            'Activate',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40), // Add space below the pink box
            Center( // Center the text horizontally
              child: GestureDetector(
                onTap: () {
                  // Add onTap functionality for the disclaimer and privacy statement
                },
                child: const Text(
                  'Disclaimer | Privacy Statement',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // Add some space between the two texts
            const Center( // Center the text horizontally
              child: Text(
                'Copyright UPM & Kejuruteraan Minyak Sawit \nCSS Sdn. Bhd.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),

    );
  }
}



class ActivationSuccessPage extends StatefulWidget {
  @override
  _ActivationSuccessPageState createState() => _ActivationSuccessPageState();
}

class _ActivationSuccessPageState extends State<ActivationSuccessPage> {
  static final List<String> factoryNames = ['Factory 1', 'Factory 2', 'Factory 3', 'Factory 4'];
  static final List<IconData> factoryIcons = [Icons.factory, Icons.factory, Icons.factory, Icons.factory];
  int selectedIndex = 0;
  int buttonIndex = 0;

  void _onPlusButtonPressed(BuildContext context) {
    // Navigate to the "Invitation" page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InvitationPage()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        // Navigate to the previous page
        Navigator.pop(context);
      } else if (index == 1) {
        // Navigate to MyHomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FactoryDashboard()),
        );
      } else if (index == 2) {
        // Navigate to the SettingsPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Factory 1',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add your settings action here
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade400, // Set grey color as background
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 340,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        _buildWhiteBoxWithContactInfo("Shaf", "+601135835837"),
                        SizedBox(height: 10),
                        _buildWhiteBoxWithContactInfo("Eric", "+6010347759"),
                        SizedBox(height: 10),
                        _buildWhiteBoxWithContactInfo("Kevin", "+60178483y49"),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _onPlusButtonPressed(context);
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(fontSize: 40),
                                  ),
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 120.0,
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
        ),
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
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildWhiteBoxWithContactInfo(String name, String contactInfo) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              contactInfo,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class InvitationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Factory 2',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade300,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            Center(
              child: Text(
                'Invitation',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Invite users',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Owner's Name",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Type here',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Owner's Phone Number",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Flag_of_Malaysia.svg/1200px-Flag_of_Malaysia.svg.png',
                  width: 40,
                  height: 30,
                ),
                SizedBox(width: 10),
                Text(
                  '+60',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
                  primary: Colors.grey.shade400,
                ),
              ),
            ),
          ],
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

