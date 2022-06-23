import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Source : https://www.flaticon.com/free-icon/sweatshirt_5499091
  List<Map<String, dynamic>> imgCategoryUrl = [
    {
      'img': 'https://cdn-icons-png.flaticon.com/512/5499/5499206.png',
      'title': 'Shoes'
    },
    {
      'img': 'https://cdn-icons-png.flaticon.com/512/5499/5499181.png',
      'title': 'Tshirt'
    },
    {
      'img': 'https://cdn-icons-png.flaticon.com/512/5499/5499091.png',
      'title': 'Jacket'
    },
    {
      'img': 'https://cdn-icons-png.flaticon.com/512/5499/5499015.png',
      'title': 'Clothes'
    },
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Container(
            height: 25,
            child: Image.network(
              'https://caraguna.com/wp-content/uploads/2022/02/caraguna-logo-last.png',
            ),
          ),
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade100,
        body: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              // SliverAppBar(
              //   elevation: 0,
              //   title: Container(
              //     height: 25,
              //     child: Image.network(
              //       'https://caraguna.com/wp-content/uploads/2022/02/caraguna-logo-last.png',
              //     ),
              //   ),
              //   leading: Icon(
              //     Icons.menu,
              //     color: Colors.black,
              //   ),
              //   actions: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.search,
              //         color: Colors.black,
              //       ),
              //     )
              //   ],
              //   backgroundColor: Colors.transparent,
              //   centerTitle: true,
              // ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Our Product',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text('Sort by',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13)),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey.shade600,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ])),
              SliverAppBar(
                  titleSpacing: 0,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Container(
                    height: 50,
                    child: ListView.builder(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: imgCategoryUrl.length,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.only(bottom: 6, right: 5, top: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        1, 2), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Container(
                                    width: 50,
                                    child: Image.network(
                                        imgCategoryUrl[index]['img'])),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  imgCategoryUrl[index]['title'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          );
                        }),
                  )),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 2 / 3,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Text('grid item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate([])),
              SliverList(delegate: SliverChildListDelegate([])),
            ]));
  }
}
