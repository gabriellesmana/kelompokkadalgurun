import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumahsakit/cubits/hospital/hospital_cubit.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({
    super.key,
    required this.province,
    required this.city,
    required this.cityName,
  });
  final String province;
  final String city;
  final String cityName;

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  HospitalCubit _hospitalCubit = HospitalCubit();

  @override
  void initState() {
    _hospitalCubit.LoadDataHospital(
        province: widget.province, city: widget.city, type: '1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RS di ${widget.cityName}'),
      ),
      body: BlocBuilder<HospitalCubit, HospitalState>(
        bloc: _hospitalCubit,
        builder: (context, state) {
          if (state is HospitalData) {
            return ListView.builder(
              itemCount: state.data.hospitals?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data.hospitals?[index].name ?? ""),
                  subtitle: Text(state.data.hospitals?[index].address ?? ""),
                );
              },
            );
          }
          return const Center(
            child: Text('Loading Data'),
          );
        },
      ),
    );
  }
}
