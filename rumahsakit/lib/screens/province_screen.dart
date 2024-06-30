import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumahsakit/cubits/province/province_cubit.dart';
import 'package:rumahsakit/screens/city_screen.dart';

class ProvinceScreen extends StatefulWidget {
  const ProvinceScreen({super.key});

  @override
  State<ProvinceScreen> createState() => _ProvinceScreenState();
}

class _ProvinceScreenState extends State<ProvinceScreen> {
  ProvinceCubit _provinceCubit = ProvinceCubit();

  @override
  void initState() {
    _provinceCubit.LoadDataProvince();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Provinsi'),
      ),
      body: BlocBuilder<ProvinceCubit, ProvinceState>(
        bloc: _provinceCubit,
        builder: (context, state) {
          if (state is ProvinceData) {
            return ListView.builder(
              itemCount: state.data.provinces?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CityScreen(
                          province: state.data.provinces?[index].id ?? "",
                          proviceName: state.data.provinces?[index].name ?? "",
                        ),
                      ),
                    );
                  },
                  title: Text(state.data.provinces?[index].name ?? ""),
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
