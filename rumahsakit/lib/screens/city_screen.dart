import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumahsakit/cubits/province/province_cubit.dart';
import 'package:rumahsakit/screens/hospital_screen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen(
      {super.key, required this.province, required this.proviceName});
  final String province;
  final String proviceName;

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  ProvinceCubit _provinceCubit = ProvinceCubit();

  @override
  void initState() {
    _provinceCubit.LoadDataCity(province: widget.province);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota/Kab di ${widget.proviceName}'),
      ),
      body: BlocBuilder<ProvinceCubit, ProvinceState>(
        bloc: _provinceCubit,
        builder: (context, state) {
          if (state is CityData) {
            return ListView.builder(
              itemCount: state.data.cities?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HospitalScreen(
                          province: widget.province,
                          city: state.data.cities?[index].id ?? "",
                          cityName: state.data.cities?[index].name ?? "",
                        ),
                      ),
                    );
                  },
                  title: Text(state.data.cities?[index].name ?? ""),
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
