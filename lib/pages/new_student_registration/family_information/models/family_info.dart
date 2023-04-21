// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';

class FamilyInfo {
  final Family family;
  final Father father;
  final Mother mother;
  final ResponsiblePerson? responsiblePerson;
  FamilyInfo({
    required this.family,
    required this.father,
    required this.mother,
    this.responsiblePerson,
  });
}
