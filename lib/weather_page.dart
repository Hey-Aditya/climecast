import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/additional_info_item.dart';

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
      body: SingleChildScrollView(
        child: Padding(
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

              const SizedBox(
                height: 25,
              ),

              // const Placeholder(
              //   fallbackHeight: 125,
              // ),

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

              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // //Box(My Own Iteration/Idea)
                    // Card(
                    //   elevation: 10,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(16),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(10.0),
                    //     child: SizedBox(
                    //       width: 100,
                    //       child: Column(
                    //         children: [
                    //           Text(
                    //             "01:00",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //           SizedBox(height: 8),
                    //           Icon(
                    //             Icons.water_drop,
                    //             size: 40,
                    //           ),
                    //           SizedBox(height: 8),
                    //           Text(
                    //             "29°C",
                    //             style: TextStyle(
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w200,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(width: 2),

                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //Have a consistent UI, not like mine.
                children: [
                  //Humidity
                  AdditionalInformationItem(),

                  // const SizedBox(
                  //   width: 15,
                  // ),

                  //Wind Speed
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Icon(
                          Icons.air,
                          size: 38,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Wind Speed",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "12.85" + "km/h",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // const SizedBox(
                  //   width: 15,
                  // ),

                  //Pressure
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Icon(
                          Icons.thermostat,
                          size: 38,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Pressure",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "1001 mBar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //AQI(made without using SizedBox)
                  Column(
                    children: [
                      Icon(
                        Icons.waves,
                        size: 38,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "AQI",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "118",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // const SizedBox(
              //   height: 30,
              // ),

              // const Placeholder(
              //   fallbackHeight: 125,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
