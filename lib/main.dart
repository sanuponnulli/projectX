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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
                  label: "Articles")
            ]),
        backgroundColor: const Color.fromARGB(255, 192, 243, 254),
        body: SafeArea(
          child: Stack(
            children: [
              NestedScrollView(
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
                              CircleAvatar(),
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
                          padding:
                              const EdgeInsets.only(top: 100.0, bottom: 10),
                          child: Container(
                            height: 200,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  final colors = [
                                    Colors.black,
                                    const Color.fromARGB(255, 14, 206, 152),
                                    const Color.fromARGB(255, 8, 133, 228),
                                    const Color.fromARGB(255, 232, 127, 28)
                                  ];
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: colors[index % 4],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: 150,
                                    height: 10,
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
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50.0, horizontal: 50),
                              child: ListView.separated(
                                  itemBuilder: ((context, index) {
                                    return const ListTile(
                                      tileColor: Colors.white,
                                      title: Text("data"),
                                    );
                                  }),
                                  separatorBuilder: ((context, index) =>
                                      const Divider()),
                                  itemCount: 27),
                            ),
                          ),
                        ),
                      ),
                      Overlapwidget()
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
        )
      ],
    );
  }
}
