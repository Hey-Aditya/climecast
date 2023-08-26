import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            // fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('refresh');
            },
            icon: const Icon(Icons.refresh_rounded),
          ),

          // InkWell(
          //   onTap: () {
          //     debugPrint('refresh');
          //   },
          //   child : const Icon(Icons.refresh_rounded),
          // ),

          // InkWell shows a radial splash.
          //GestureDectector can also be used for button purpose but it shows no animation.
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shadowColor: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 8,
                      sigmaY: 8,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          // const SizedBox(height: 15),
                          Text(
                            "36.75°C",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              // color: Colors.amber,
                            ),
                          ),
                          SizedBox(height: 15),
                          Icon(
                            Icons.cloudy_snowing,
                            size: 60,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Rain",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          // const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // const Placeholder(
            //   fallbackHeight: 200,
            //   // fallbackWidth: 200,
            // ),

            const SizedBox(
              height: 25,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Weather Forecast",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  //Box1
                  Card(
                    elevation: 10,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(16),
                    // ),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "01:00",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Icon(
                            Icons.air,
                            size: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "29°C",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 2),

                  //Box2
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(
                              "01:00",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.water_drop,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "29°C",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 2),

                  //Box3
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(
                              "01:00",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "29°C",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 2),

                  //Box4
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(
                              "01:00",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "29°C",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 2),

                  //Box5
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(
                              "01:00",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "29°C",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // const Placeholder(
            //   fallbackHeight: 125,
            // ),

            // const SizedBox(
            //   height: 30,
            // ),

            // const Placeholder(
            //   fallbackHeight: 125,
            // ),
          ],
        ),
      ),
    );
  }
}
