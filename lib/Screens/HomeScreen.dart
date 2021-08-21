import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_search_screens/Bloc/GstBloc.dart';
import 'package:gst_search_screens/Bloc/RoutesBloc.dart';
import 'package:gst_search_screens/Utils/SizeConfig.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isFirst = true, isLoading = false;

  String gstNumber = "";

  final switchInTween = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));

  AnimationController? slideAnimation;

  @override
  void initState() {
    super.initState();

    slideAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              switchOutCurve: Curves.easeInOutCubic,
              switchInCurve: Curves.fastLinearToSlowEaseIn,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: switchInTween.animate(animation),
                  child: child,
                );
              },
              child: isFirst
                  ? Container(
                      color: Colors.white,
                      key: ValueKey<int>(0),
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 10,
                        right: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.4,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Enter GST number",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                height: 0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              fillColor: Color(0xffF2F2F2),
                              filled: true,
                              border: InputBorder.none,
                              hintText: "Ex: 07AACCM9910C1ZP",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                height: 0,
                                color: Colors.grey,
                              ),
                            ),
                            onChanged: (value) {
                              gstNumber = value;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 8,
                          ),
                          !isLoading
                              ? ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    int res =
                                        await GstBloc().gstInExists(gstNumber);
                                    if (gstNumber.isNotEmpty && res == 0)
                                      RoutesBloc().toRoute(Routes.GSTSCREEN);
                                    else
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar((SnackBar(
                                        content: Text(
                                            res == 1
                                                ? "GST number invalid or does not exists"
                                                : "Connection Error",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        action: SnackBarAction(
                                          label: "OK",
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                          },
                                        ),
                                      )));
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff2DA05E)),
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(Size(
                                              SizeConfig.screenWidth! * 0.9,
                                              SizeConfig.screenHeight! * 0.06)),
                                      alignment: Alignment.center),
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      height: 0,
                                      color: Colors.white,
                                    ),
                                  ))
                              : Container(
                                  width: SizeConfig.screenWidth! * 0.9,
                                  height: SizeConfig.screenHeight! * 0.06,
                                  color: Color(0xff2DA05E),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                                ),
                          SizedBox(height: SizeConfig.screenHeight! * 0.392)
                        ],
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      key: ValueKey<int>(1),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 10,
                        right: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.4,
                          ),
                          Text(
                            "Enter Information Here",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB5B5B5),
                                fontSize: SizeConfig.blockSizeVertical! * 6),
                          ),
                          SizedBox(height: SizeConfig.screenHeight! * 0.532)
                        ],
                      ),
                    ),
            ),
            Container(
              height: SizeConfig.screenHeight! * 0.32,
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizontal! * 10,
                  SizeConfig.blockSizeVertical! * 4,
                  SizeConfig.blockSizeHorizontal! * 10,
                  SizeConfig.blockSizeVertical!),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(8 * SizeConfig.blockSizeVertical!),
                      bottomRight:
                          Radius.circular(8 * SizeConfig.blockSizeVertical!)),
                  color: Color(0xff2DA05E)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 15,
                  ),
                  Text(
                    "Select the type for",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical! * 3,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical!,
                  ),
                  Text(
                    "GST Number Search Tool",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical! * 4.5,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  Container(
                    width: SizeConfig.screenWidth! * 0.9,
                    height: SizeConfig.screenHeight! * 0.08,
                    padding: EdgeInsets.all(SizeConfig.blockSizeVertical!),
                    decoration: BoxDecoration(
                        color: Color(0xff1A884B),
                        borderRadius: BorderRadius.all(Radius.circular(
                            SizeConfig.blockSizeVertical! * 9))),
                    child: Stack(
                      children: [
                        AnimatedBuilder(
                          animation: slideAnimation!,
                          builder: (context, child) {
                            return Positioned(
                                child: child!,
                                left: slideAnimation!.value *
                                    SizeConfig.screenWidth! *
                                    0.43);
                          },
                          child: Container(
                            height: SizeConfig.screenHeight! * 0.07,
                            width: SizeConfig.screenWidth! * 0.45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.blockSizeVertical! * 9))),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFirst = true;
                                    slideAnimation!.reverse();
                                  });
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  height: SizeConfig.screenHeight! * 0.08,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Search GST Number",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical! * 3,
                                        decoration: TextDecoration.none,
                                        color: isFirst
                                            ? Color(0xff1A884B)
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFirst = false;
                                    slideAnimation!.forward();
                                  });
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  height: SizeConfig.screenHeight! * 0.08,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "GST Return Status",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical! * 3,
                                        decoration: TextDecoration.none,
                                        color: isFirst
                                            ? Colors.white
                                            : Color(0xff1A884B)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
