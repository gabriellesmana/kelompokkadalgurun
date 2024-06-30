import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rumahsakit/models/hospital_model.dart';
import 'package:rumahsakit/services/hospital_service.dart';

part 'hospital_state.dart';

class HospitalCubit extends Cubit<HospitalState> {
  HospitalCubit() : super(HospitalInitial());

  HospitalService _hospitalService = HospitalService();

  LoadDataHospital({
    required String province,
    required String city,
    required String type,
  }) async {
    var res = await _hospitalService.GETHospital(
      province: province,
      city: city,
      type: type,
    );
    res.fold(
      (l) => print(l),
      (r) => emit(
        HospitalData(r),
      ),
    );
  }
}
