// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/address/city.dart';

class StudentAddressInfo {
  final City city;
  final Area area;
  final Address address;
  StudentAddressInfo({
    required this.city,
    required this.area,
    required this.address,
  });
}
