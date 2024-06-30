import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rumahsakit/models/hospital_model.dart';

class HospitalService {
  final Dio _dio = Dio();

  Future<Either<String, HospitalModel>> GETHospital({
    required String province,
    required String city,
    required String type,
  }) async {
    try {
      var response = await _dio.get(
        "https://rs-bed-covid-api.vercel.app/api/get-hospitals",
        queryParameters: {
          "provinceid": province,
          "cityid": city,
          "type": type,
        },
      );
      var result = HospitalModel.fromJson(json.decode(response.data));
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
