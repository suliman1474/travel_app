import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../cubit/app_cubits.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-1.jpg',
    'welcome-4.jpg',
    'welcome-2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: images.length,
              itemBuilder: (_, index) {
                return Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/' + images[index]),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 150,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //first column============
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: 'Trips',
                            ),
                            AppText(
                              text: 'Mountain',
                              size: 30.0,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: AppText(
                                text:
                                    'Mountains hicks give an incredible sense of freedom along with endurance test',
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 200,
                              child: GestureDetector(
                                onTap: () {
                                  print('click');
                                  BlocProvider.of<AppCubits>(context).getData();
                                },
                                child: Row(
                                  children: [
                                    ResponsiveButton(
                                      width: 100,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //=========Column for dots========
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 2.0),
                              width: 8,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: index == indexDots
                                      ? Colors.deepPurple
                                      : Colors.deepPurple.withOpacity(0.3)),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
