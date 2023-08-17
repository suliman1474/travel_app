import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../constants/url.dart';
import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    var images = {
      'balloning.jpg': 'Balloning',
      'hicking.jpg': 'Hicking',
      'kayaking.jpg': 'Kayaking',
      'snorkling.jpg': 'Snorkling',
    };
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //=============discover text========
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: AppLargeText(text: 'Discover'),
                ),
                const SizedBox(
                  height: 30,
                ),
                //=============tabbar==========
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      // labelPadding: const EdgeInsets.only(left: 0, right: 0),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: Colors.deepPurple, radius: 4),
                      tabs: [
                        Tab(
                          text: 'Places',
                        ),
                        Tab(
                          text: 'Inspiration',
                        ),
                        Tab(
                          text: 'Emotions',
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(info[index]);
                                },
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            Urls.imageUrl + info[index].img),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            );
                          }),
                      Text('ther'),
                      Text('dkf'),
                    ],
                  ),
                ),
                //===============Explore more==============
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Explore more',
                        size: 22,
                      ),
                      AppText(
                        text: 'See all',
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //================horizental list=================
                Container(
                  height: 120,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('assets/' +
                                          images.keys.elementAt(index)),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleoffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleoffset, radius, _paint);
  }
}
