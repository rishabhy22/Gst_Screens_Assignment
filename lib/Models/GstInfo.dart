import 'package:cloud_firestore/cloud_firestore.dart';

class GstInfo {
  String? gstIn,
      company,
      principalAddress,
      additionalAddress,
      stateJurisdiction,
      centreJurisdiction,
      taxpayerType,
      constitutionOfBusiness;
  int? dateOfReg, dateOfCanc;
  bool? status;

  GstInfo.fromDocumentSnapshot(DocumentSnapshot docSnap) {
    this.gstIn = docSnap.get("gstIn");
    this.company = docSnap.get("company");
    this.principalAddress = docSnap.get("principalAddress");
    this.additionalAddress = docSnap.get("additionalAddress");
    this.stateJurisdiction = docSnap.get("stateJurisdiction");
    this.centreJurisdiction = docSnap.get("centreJurisdiction");
    this.taxpayerType = docSnap.get("taxpayerType");
    this.constitutionOfBusiness = docSnap.get("constitutionOfBusiness");
    this.dateOfReg = docSnap.get("dateOfReg") ?? null;
    this.dateOfCanc = docSnap.get("dateOfCanc") ?? null;
    this.status = docSnap.get("status") ?? false;
  }
  GstInfo({
    required this.gstIn,
    required this.company,
    required this.principalAddress,
    required this.additionalAddress,
    required this.stateJurisdiction,
    required this.centreJurisdiction,
    required this.taxpayerType,
    required this.constitutionOfBusiness,
    required this.dateOfReg,
    required this.dateOfCanc,
    required this.status,
  });
}
