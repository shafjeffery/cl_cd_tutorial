import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'ProfilePage.dart';
import 'SettingsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FactoryDashboard(),
    );
  }
}

class FactoryDashboard extends StatefulWidget {
  const FactoryDashboard({super.key});

  @override
  _FactoryDashboardState createState() => _FactoryDashboardState();
}

class _FactoryDashboardState extends State<FactoryDashboard> {
  static final List<String> factoryNames = ['Factory 1', 'Factory 2', 'Factory 3', 'Factory 4'];
  static final List<IconData> factoryIcons = [Icons.factory, Icons.factory, Icons.factory, Icons.factory];
  int selectedIndex = 1; // factory button
  int buttonIndex = 1; // navbar

  // Sensor readings for each factory
  List<double> sensorReadings = [0, 1549.37, 0, 0];
  List<double> steamPressure = [0, 34.19, 0, 0];
  List<double> steamFlow = [0, 22.82, 0, 0];
  List<double> waterLevel = [0, 55.41, 0, 0];
  List<double> powerFrequency = [0, 50.08, 0, 0];

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
      case 2: // Settings
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SettingsPage(),//
        )).then((value) {
          // Handle settings update here
          if (value != null) {
            setState(() {
              sensorReadings[selectedIndex] = value; // Update the sensor reading for the selected factory
            });
          }
        });
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: Text(
                          '${sensorReadings[selectedIndex]} kW',
                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WhiteBox(child: SensorWidget(value: steamPressure[selectedIndex], unit: 'bar', label: 'Steam Pressure')),
                        WhiteBox(child: SensorWidget(value: steamFlow[selectedIndex], unit: 'T/H', label: 'Steam Flow')),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WhiteBox(child: SensorWidget(value: waterLevel[selectedIndex], unit: '%', label: 'Water Level')),
                        WhiteBox(child: SensorWidget(value: powerFrequency[selectedIndex], unit: 'Hz', label: 'Power Frequency')),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        '${DateTime.now().toString()}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
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

class SensorWidget extends StatelessWidget {
  final double value;
  final String unit;
  final String label;

  const SensorWidget({Key? key, required this.value,required this.unit, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color getGaugeColor(double value) {
      if (value > 29) {
        return Colors.green;
      } else if (value < 29) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text label on top
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15.0,
            color: Colors.grey[500]
          ),
        ),
        SizedBox(height: 3.0),
        // Gauge in the middle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            startAngle: 180,
                            endAngle: 0,
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: true,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.3,
                              color: Colors.grey[300],
                              thicknessUnit: GaugeSizeUnit.factor,


                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: value,
                                width: 15,
                                color: getGaugeColor(value),
                                pointerOffset: 0.3,
                                cornerStyle: CornerStyle.bothFlat,
                              ),
                              MarkerPointer(
                                value: value,
                                markerOffset: -12,
                                markerHeight: 10,
                                markerWidth: 10,
                                color: getGaugeColor(value),
                              ),
                            ],
                            annotations:<GaugeAnnotation> [
                              GaugeAnnotation(widget: Text(
                                '$value $unit',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                              positionFactor: 1.0,
                              angle: 90,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height:0),
        // Gauge reading at the bottom
      ],
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
