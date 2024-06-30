part of 'hospital_cubit.dart';

@immutable
abstract class HospitalState {}

class HospitalInitial extends HospitalState {}

class HospitalData extends HospitalState {
  final HospitalModel data;
  HospitalData(this.data);
}
