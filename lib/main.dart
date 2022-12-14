import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBlocBloc(),
      child: MaterialApp(
        theme: ThemeData(

            //scaffoldBackgroundColor: Color.fromARGB(153, 145, 145, 145),
            ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController1 = ScrollController();
  ValueNotifier isbottom = ValueNotifier(0);

  //final ScrollController _scrollController2 = ScrollController();

  double _opacity = 0;
  //bool isbottom = false;
  List list = [];
  void onListen() {
    //print(_scrollController.offset);
    setState(() {
      _opacity = 1 / 270 * (_scrollController.offset);
    });
//list.clear();
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      // setState(() {
      //   isbottom = true;
      // });
      isbottom.value = 1;
      isbottom.notifyListeners();
      print("reload");
      list.clear();
      BlocProvider.of<UserBlocBloc>(context).add(Loadmore());
    } else {
      isbottom.value = 0;
      isbottom.notifyListeners();
      // setState(() {
      //   isbottom = false;
      // });
    }
  }

  void onlisten2() {
    //print(_scrollController1.position);
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(onListen);
    _scrollController1.addListener(onlisten2);

    //data();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.removeListener(onListen);
    _scrollController1.removeListener(onlisten2);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UserBlocBloc>(context).add(Intialize());
    });
    //BlocProvider.of<UserBlocBloc>(context).add(Intialize());
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color.fromARGB(255, 176, 176, 176),
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "lib/assets/home.png",
                    scale: 8,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "lib/assets/history.png",
                    scale: 8,
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "lib/assets/articles.png",
                    scale: 8,
                  ),
                  label: "Articles"),
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    width: 80,
                    height: 50,
                    child: FloatingActionButton(
                      child: Image.asset(
                        "lib/assets/plus_2.png",
                        scale: 10,
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(22.0))),
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 222, 242, 71),
                      onPressed: () {
                        // data();
                      },
                    ),
                  ))
            ]),
        backgroundColor: const Color.fromARGB(255, 178, 239, 253),
        body: SafeArea(
          child: Stack(
            children: [
              NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor:
                            const Color.fromARGB(255, 192, 243, 254),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 150.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundImage: const NetworkImage(
                                    "https://media.wired.com/photos/592676467034dc5f91beb80e/master/pass/MarkZuckerberg.jpg"),
                              ),
                              const Text(
                                'Home',
                                style: const TextStyle(color: Colors.black),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30,
                                child: Image.asset(
                                  "lib/assets/notifications.png",
                                  scale: 6,
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: false,
                        elevation: 0,
                        flexibleSpace: Padding(
                          padding: const EdgeInsets.only(top: 90.0, bottom: 0),
                          child: Container(
                            height: 200,
                            child: ListView.separated(
                                controller: _scrollController1,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  final colors = [
                                    Colors.black,
                                    const Color.fromARGB(255, 14, 206, 152),
                                    const Color.fromARGB(255, 8, 133, 228),
                                    const Color.fromARGB(255, 232, 127, 28)
                                  ];
                                  final asset = [
                                    "lib/assets/top_right_arrow.png",
                                    "lib/assets/bottom_left_arrow.png"
                                  ];
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: colors[index % 4],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: 150,
                                    height: 10,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                Image.asset(
                                                  asset[index % 2],
                                                  scale: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Owe me",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "\$ 12500",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "2 Debts",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                                separatorBuilder: ((context, index) =>
                                    const SizedBox(
                                      width: 15,
                                    )),
                                itemCount: 10),
                          ),
                        ),
                        expandedHeight: 270.0,
                        forceElevated: innerBoxIsScrolled,
                      ),
                    ];
                  },
                  body: Stack(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 222, 239, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 65.0, left: 30, right: 30),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "My debts",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      const Text("See All",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  153, 152, 152, 152),
                                              fontSize: 19))
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Expanded(
                                    child: BlocBuilder<UserBlocBloc,
                                        UserBlocState>(
                                      builder: (context, state) {
                                        if (state.user == []) {
                                          return const CircularProgressIndicator(
                                            color: Colors.green,
                                          );
                                        } else {
                                          list.addAll(state.user);
                                          return Column(
                                            children: [
                                              Expanded(
                                                child: ListView.separated(
                                                    itemBuilder:
                                                        ((context, index) {
                                                      // print(isbottom.value);
                                                      // print(state.isEnd);
                                                      if (index ==
                                                              list.length - 1 &&
                                                          isbottom.value == 1) {
                                                        return Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      } else {
                                                        return ListTile(
                                                          leading: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0), //or 15.0
                                                            child: Container(
                                                              height: 45.0,
                                                              width: 40.0,
                                                              color: Color
                                                                  .fromARGB(
                                                                      74,
                                                                      255,
                                                                      14,
                                                                      86),
                                                              child:
                                                                  Image.network(
                                                                list[index][1],
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          tileColor:
                                                              Colors.white,
                                                          trailing: const Text(
                                                              "\$ 100",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)),
                                                          title: Text(
                                                              list[index][0]),
                                                          subtitle: const Text(
                                                            "Untill 20/10/22",
                                                          ),
                                                        );
                                                      }
                                                    }),
                                                    separatorBuilder:
                                                        ((context, index) =>
                                                            const Divider()),
                                                    itemCount: list.length),
                                              ),
                                              // if (!state.isEnd &&
                                              //     isbottom.value == 1)
                                              //   CircularProgressIndicator()
                                              // else if (state.isEnd &&
                                              //     isbottom.value == 0)
                                              //   Text("end of list")
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                          opacity: 1 - _opacity, child: const Overlapwidget()),
                    ],
                  )),
              // Positioned(
              //   top: 250,
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     child: Overlapwidget(),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class Overlapwidget extends StatelessWidget {
  const Overlapwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(.6),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: Image.asset(
                  "lib/assets/plus.png",
                  scale: 10,
                ),
              ),
            ),
            const Text("NEW")
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(.6),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: Image.asset(
                  "lib/assets/topright-arrow.png",
                  scale: 10,
                ),
              ),
            ),
            const Text("PAY OFF")
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(.6),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: Image.asset(
                  "lib/assets/bottomleft_arrow.png",
                  scale: 10,
                ),
              ),
            ),
            const Text("LEND")
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(.6),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: Image.asset(
                  "lib/assets/grid.png",
                  scale: 10,
                ),
              ),
            ),
            const Text("MORE")
          ],
        )
      ],
    );
  }
}
