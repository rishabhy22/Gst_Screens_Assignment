import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_search_screens/Bloc/GstBloc.dart';
import 'package:gst_search_screens/Bloc/RoutesBloc.dart';
import 'package:gst_search_screens/Models/GstInfo.dart';
import 'package:gst_search_screens/Utils/SizeConfig.dart';

class GstScreen extends StatelessWidget {
  const GstScreen({Key? key}) : super(key: key);

  String dateFromTimetamp(int? timestamp) {
    if (timestamp == null) return "--";

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String day = dateTime.day > 9 ? "${dateTime.day}" : "0${dateTime.day}";
    String month =
        dateTime.month > 9 ? "${dateTime.month}" : "0${dateTime.month}";
    return "$day/$month/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: StreamBuilder<GstInfo>(
            stream: GstBloc().getGstInfo,
            initialData: GstInfo(
                gstIn: "Not Available",
                company: "Not Available",
                principalAddress: "Not Available",
                additionalAddress: "Not Available",
                stateJurisdiction: "Not Available",
                centreJurisdiction: "Not Available",
                taxpayerType: "Not Available",
                constitutionOfBusiness: "Not Available",
                dateOfReg: null,
                dateOfCanc: null,
                status: false),
            builder: (context, snapshot) {
              GstInfo? gstInfo = snapshot.data;
              return Stack(
                children: [
                  Container(
                    color: Color(0xffF5F5F5),
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal! * 10,
                        0,
                        SizeConfig.blockSizeHorizontal! * 10,
                        SizeConfig.blockSizeVertical!),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical! * 2)),
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeVertical! * 2.5),
                          height: SizeConfig.screenHeight! * 0.25,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffEAF5EF)),
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Color(0xff2DA05E),
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal! * 10,
                                    height: SizeConfig.screenHeight! * 0.12,
                                    child: VerticalDivider(
                                      color: Color(0xff2DA05E),
                                      thickness: 0,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffEAF5EF)),
                                    child: Icon(
                                      Icons.house_rounded,
                                      color: Color(0xff2DA05E),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Principal Place of Business",
                                      style: TextStyle(
                                          color: Color(0xffB5B5B5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical! * 2,
                                    ),
                                    SizedBox(
                                        height: SizeConfig.screenHeight! * 0.12,
                                        width: SizeConfig.screenWidth! * 0.7,
                                        child: Text(
                                          gstInfo!.principalAddress!,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              wordSpacing: 3.2,
                                              letterSpacing: 1,
                                              fontSize: SizeConfig
                                                      .blockSizeVertical! *
                                                  5),
                                        )),
                                    Text(
                                      "Additional Place of Business",
                                      style: TextStyle(
                                          color: Color(0xffB5B5B5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical! * 2,
                                    ),
                                    SizedBox(
                                        height: SizeConfig.screenHeight! * 0.04,
                                        width: SizeConfig.screenWidth! * 0.7,
                                        child: Text(
                                          gstInfo.additionalAddress!,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig
                                                      .blockSizeVertical! *
                                                  5),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                        Container(
                          height: SizeConfig.screenHeight! * 0.08,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal! * 2,
                                    right: SizeConfig.blockSizeHorizontal! * 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeVertical! * 2)),
                                width: SizeConfig.screenWidth! * 0.29,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "State Jurisdiction",
                                      style: TextStyle(
                                          color: Color(0xffB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.blockSizeVertical! * 1.5,
                                    ),
                                    Text(
                                      gstInfo.stateJurisdiction!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeVertical! *
                                                  4),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth! * 0.015,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal! * 2,
                                    right: SizeConfig.blockSizeHorizontal! * 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeVertical! * 2)),
                                width: SizeConfig.screenWidth! * 0.29,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Centre Jurisdiction",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xffB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.blockSizeVertical! * 1.5,
                                    ),
                                    Text(
                                      gstInfo.centreJurisdiction!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeVertical! *
                                                  4),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth! * 0.015,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal! * 2,
                                    right: SizeConfig.blockSizeHorizontal! * 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeVertical! * 2)),
                                width: SizeConfig.screenWidth! * 0.29,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Taxpayer Type",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xffB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.blockSizeVertical! * 1.5,
                                    ),
                                    Text(
                                      gstInfo.taxpayerType!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeVertical! *
                                                  4),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal! * 4,
                              right: SizeConfig.blockSizeHorizontal! * 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical! * 2)),
                          height: SizeConfig.screenHeight! * 0.08,
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Constitution of Business",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffB5B5B5),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 1.5,
                              ),
                              Text(
                                gstInfo.constitutionOfBusiness!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.blockSizeVertical! * 4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal! * 4,
                              right: SizeConfig.blockSizeHorizontal! * 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical! * 2)),
                          height: SizeConfig.screenHeight! * 0.08,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Date of Registeration",
                                    style: TextStyle(
                                        color: Color(0xffB5B5B5),
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    "Date of Cancellation",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color(0xffB5B5B5),
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 1.5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    dateFromTimetamp(gstInfo.dateOfReg),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.blockSizeVertical! * 4),
                                  )),
                                  Expanded(
                                      child: Text(
                                    dateFromTimetamp(gstInfo.dateOfCanc),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.blockSizeVertical! * 4),
                                    textAlign: TextAlign.right,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.0932,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.screenHeight! * 0.892,
                    child: Container(
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.center,
                      height: SizeConfig.screenHeight! * 0.08,
                      color: Color(0xff2DA05E),
                      child: Text(
                        "Get Return Filing Status",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical! * 4.5,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenHeight! * 0.3,
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal! * 10,
                        SizeConfig.blockSizeVertical! * 8,
                        SizeConfig.blockSizeHorizontal! * 10,
                        SizeConfig.blockSizeVertical!),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                8 * SizeConfig.blockSizeVertical!),
                            bottomRight: Radius.circular(
                                8 * SizeConfig.blockSizeVertical!)),
                        color: Color(0xff2DA05E)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    RoutesBloc().toRoute(Routes.HOME);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: SizeConfig.blockSizeVertical! * 6,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal! * 8,
                                ),
                                Text(
                                  "GST Profile",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeVertical! * 4.5,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 8,
                        ),
                        Text(
                          "GSTIN of Tax Payer",
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical! * 3,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          gstInfo.gstIn!,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical! * 4.8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Text(
                          gstInfo.company!,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical! * 4,
                              decoration: TextDecoration.none,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Container(
                          width: SizeConfig.screenWidth! * 0.225,
                          padding: EdgeInsets.all(5),
                          height: SizeConfig.screenHeight! * 0.04,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical! * 8)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: gstInfo.status!
                                    ? Color(0xff2DA05E)
                                    : Colors.redAccent,
                                size: 15,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal,
                              ),
                              Text(
                                gstInfo.status! ? "ACTIVE" : "INACTIVE",
                                style: TextStyle(
                                    color: gstInfo.status!
                                        ? Color(0xff2DA05E)
                                        : Colors.redAccent,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
