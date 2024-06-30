import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rumahsakit/models/city_model.dart';
import 'package:rumahsakit/models/province_model.dart';
import 'package:rumahsakit/services/province_service.dart';

part 'province_state.dart';

class ProvinceCubit extends Cubit<ProvinceState> {
  ProvinceCubit() : super(ProvinceInitial());

  ProvinceService _provinceService = ProvinceService();

  LoadDataProvince() async {
    var res = await _provinceService.GETProvince();
    res.fold(
      (l) => print(l),
      (r) => emit(
        ProvinceData(r),
      ),
    );
  }

  LoadDataCity({
    required String province,
  }) async {
    var res = await _provinceService.GETCity(province: province);
    res.fold(
      (l) => print(l),
      (r) => emit(
        CityData(r),
      ),
    );
  }
}
