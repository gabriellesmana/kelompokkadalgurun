part of 'province_cubit.dart';

@immutable
abstract class ProvinceState {}

class ProvinceInitial extends ProvinceState {}

class ProvinceData extends ProvinceState {
  final ProvinceModel data;
  ProvinceData(this.data);
}

class CityData extends ProvinceState {
  final CityModel data;
  CityData(this.data);
}
