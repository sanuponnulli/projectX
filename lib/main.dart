import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

          //scaffoldBackgroundColor: Color.fromARGB(153, 145, 145, 145),
          ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController1 = ScrollController();
  double _opacity = 0;
  void onListen() {
    setState(() {
      _opacity = 1 / 270 * (_scrollController.offset);
    });
    //print(_opacity);
  }

  void onlisten2() {
    //print(_scrollController1.position);
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(onListen);
    _scrollController1.addListener(onlisten2);
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
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color.fromARGB(255, 176, 176, 176),
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
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(22.0))),
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 222, 242, 71),
                      onPressed: () {},
                    ),
                  ))
            ]),
        backgroundColor: Color.fromARGB(255, 178, 239, 253),
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
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://media.wired.com/photos/592676467034dc5f91beb80e/master/pass/MarkZuckerberg.jpg"),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(color: Colors.black),
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
                        snap: true,
                        floating: true,
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
                                                SizedBox(
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
                                                Text(
                                                  "Owe me",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "\$ 12500",
                                                  style: TextStyle(
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
                                                Text(
                                                  "2 Debts",
                                                  style: TextStyle(
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
                                      Text(
                                        "My debts",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      Text("See All",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Expanded(
                                    child: ListView.separated(
                                        itemBuilder: ((context, index) {
                                          return ListTile(
                                            leading: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8.0), //or 15.0
                                              child: Container(
                                                height: 45.0,
                                                width: 40.0,
                                                color: Color(0xffFF0E58),
                                                child: Image.network(
                                                    fit: BoxFit.fill,
                                                    "https://media.wired.com/photos/592676467034dc5f91beb80e/master/pass/MarkZuckerberg.jpg"),
                                              ),
                                            ),
                                            tileColor: Colors.white,
                                            trailing: Text("\$ 100",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
                                            title: Text("Name"),
                                            subtitle: Text(
                                              "Untill 20/10/22",
                                            ),
                                          );
                                        }),
                                        separatorBuilder: ((context, index) =>
                                            const Divider()),
                                        itemCount: 27),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Opacity(opacity: 1 - _opacity, child: Overlapwidget()),
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
            Text("NEW")
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
            Text("PAY OFF")
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
            Text("LEND")
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
            Text("MORE")
          ],
        )
      ],
    );
  }
}
