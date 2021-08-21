import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gst_search_screens/Models/GstInfo.dart';
import 'package:rxdart/rxdart.dart';

class GstBloc {
  static final GstBloc _gstBloc = GstBloc._internal();

  GstBloc._internal();

  factory GstBloc() => _gstBloc;

  CollectionReference gstINs = FirebaseFirestore.instance.collection("gstINs");

  static final StreamController<GstInfo> gstInfoStream =
      BehaviorSubject<GstInfo>();

  Function(GstInfo) get setGstInfo => gstInfoStream.sink.add;

  Stream<GstInfo> get getGstInfo => gstInfoStream.stream;

  Future<int> gstInExists(String gstIn) async {
    try {
      DocumentSnapshot docSnap = await gstINs.doc(gstIn).get();

      if (docSnap.exists) {
        setGstInfo(GstInfo.fromDocumentSnapshot(docSnap));
        return 0;
      }

      return 1;
    } catch (e) {
      return -1;
    }
  }

  void dispose() {
    if (!gstInfoStream.isClosed) gstInfoStream.close();
  }
}
