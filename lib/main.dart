import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gst_search_screens/Bloc/RoutesBloc.dart';
import 'package:gst_search_screens/Screens/GstScreen.dart';
import 'package:gst_search_screens/Screens/HomeScreen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Root());
}

class Root extends StatelessWidget {
  final switchInTween = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
  final switchOutTween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              body: StreamBuilder<Routes>(
                  stream: RoutesBloc().getRoute,
                  initialData: Routes.HOME,
                  builder: (context, snapshot) {
                    return AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        switchOutCurve: Curves.easeInOutCubic,
                        switchInCurve: Curves.fastLinearToSlowEaseIn,
                        transitionBuilder: (child, animation) {
                          return SlideTransition(
                            position: snapshot.data == Routes.HOME
                                ? switchInTween.animate(animation)
                                : switchOutTween.animate(animation),
                            child: child,
                          );
                        },
                        child: getScreen(snapshot.data!));
                  }))),
    );
  }
}

Widget getScreen(Routes route) {
  switch (route) {
    case Routes.HOME:
      return Home();

    case Routes.GSTSCREEN:
      return GstScreen();

    default:
      return Home();
  }
}
