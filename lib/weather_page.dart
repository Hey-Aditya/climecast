import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double temp = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    String cityName = 'London';
    try {
      final res = await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openWeatherAPIKey'),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An expected error occurred!';
      }

      setState(() {
        temp = data['list'][0]['main']['temp'] - 273.15;
      });
    } catch (e) {
      throw e.toString();
    }

    // debugPrint(res.body);
  }

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
      body: temp == 0
          ? const LinearProgressIndicator()
          : SingleChildScrollView(
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
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  // const SizedBox(height: 15),
                                  Text(
                                    '${temp.toStringAsFixed(2)}°C',
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                      // color: Colors.amber,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const Icon(
                                    Icons.cloudy_snowing,
                                    size: 60,
                                  ),
                                  const SizedBox(height: 15),
                                  const Text(
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

                          HourlyForecastItem(
                            time: "01:00",
                            icon: Icons.cloud,
                            temperature: "30°C",
                          ),
                          HourlyForecastItem(
                            time: "02:00",
                            icon: Icons.sunny_snowing,
                            temperature: "29°C",
                          ),
                          HourlyForecastItem(
                            time: "03:00",
                            icon: Icons.cloud,
                            temperature: "29°C",
                          ),
                          HourlyForecastItem(
                            time: "04:00",
                            icon: Icons.air,
                            temperature: "28°C",
                          ),
                          HourlyForecastItem(
                            time: "05:00",
                            icon: Icons.cloudy_snowing,
                            temperature: "27°C",
                          ),
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
                        AdditionalInformationItem(
                          icon: Icons.water_drop,
                          label: "Humidity",
                          value: "80%",
                        ),

                        // const SizedBox(
                        //   width: 15,
                        // ),

                        //Wind Speed
                        AdditionalInformationItem(
                          icon: Icons.air,
                          label: "Wind Speed",
                          value: "12.85" + " km/h",
                        ),

                        // SizedBox(
                        //   width: 100,
                        //   child: Column(
                        //     children: [
                        //       Icon(
                        //         Icons.air,
                        //         size: 38,
                        //       ),
                        //       SizedBox(height: 6),
                        //       Text(
                        //         "Wind Speed",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w100,
                        //         ),
                        //       ),
                        //       SizedBox(height: 6),
                        //       Text(
                        //         "12.85" + "km/h",
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // const SizedBox(
                        //   width: 15,
                        // ),

                        //Pressure
                        AdditionalInformationItem(
                          icon: Icons.thermostat,
                          label: "Pressure",
                          value: "1001 mBar",
                        ),

                        // SizedBox(
                        //   width: 100,
                        //   child: Column(
                        //     children: [
                        //       Icon(
                        //         Icons.thermostat,
                        //         size: 38,
                        //       ),
                        //       SizedBox(height: 6),
                        //       Text(
                        //         "Pressure",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w100,
                        //         ),
                        //       ),
                        //       SizedBox(height: 6),
                        //       Text(
                        //         "1001 mBar",
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        //AQI(made without using SizedBox)
                        AdditionalInformationItem(
                          icon: Icons.waves,
                          label: "AQI",
                          value: "118",
                        ),

                        // Column(
                        //   children: [
                        //     Icon(
                        //       Icons.waves,
                        //       size: 38,
                        //     ),
                        //     SizedBox(height: 6),
                        //     Text(
                        //       "AQI",
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w100,
                        //       ),
                        //     ),
                        //     SizedBox(height: 6),
                        //     Text(
                        //       "118",
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
