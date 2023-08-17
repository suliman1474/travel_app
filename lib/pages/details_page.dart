import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../constants/url.dart';
import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';
import '../widgets/app_button.dart';
import '../widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                //===========image=========
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  Urls.imageUrl + detail.place.img),
                              fit: BoxFit.cover)),
                    )),
                //==========icon=======
                Positioned(
                    left: 20,
                    top: 35,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ],
                    )),

                ///below card
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            AppLargeText(
                              text: '\$ ${detail.place.price}',
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                        //second
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(text: detail.place.location),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //====stars=======
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(5.0)',
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        //===========people
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: 'Number of people in your group',
                          color: Colors.black.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /////////======================Containers==========
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8.0),
                                child: AppButton(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.4),
                                  size: 50,
                                  borderColor: Colors.grey,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        //===========Description==========
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: Colors.black.withOpacity(0.6),
                        )
                      ],
                    ),
                  ),
                ),
                // end buttons
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        color: Colors.white,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: Colors.grey,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 280,
                        child: GestureDetector(
                          onTap: () {
                            print('click');
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Row(
                            children: [
                              ResponsiveButton(
                                isResponsive: true,
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
          ),
        ),
      );
    });
  }
}
