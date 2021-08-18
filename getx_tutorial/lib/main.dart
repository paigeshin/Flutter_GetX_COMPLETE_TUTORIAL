import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_tutorial/components/namedroutes/new_main.dart';
import 'package:getx_tutorial/components/namedroutes/new_next_screen.dart';
import 'components/namedroutes/new_entry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
          name: "/newhome",
          page: () => NewHome(),
          // To control the transition route wise
          // If sepcified will override the default transition
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: "/newnextscreen/:someValue",
          page: () => NewNextScreen(),
        )
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetXTutorial"),
        ),
        body: NewEntry(),
      ),
    );
  }
}
