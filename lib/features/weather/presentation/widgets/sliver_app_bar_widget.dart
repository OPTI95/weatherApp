import 'package:book/helpers/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/country_code/country_code_convertor.dart';
import '../cubit/weather_cubit.dart';

class SliverAppBarWidget extends StatefulWidget {
  SliverAppBarWidget({
    super.key,
  });
  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(backgroundColor: Colors.transparent, actions: [
      SizedBox(
        width: 24,
      ),
      ImageIcon(
        AssetImage("images/icon-pin.png"),
        color: Colors.white,
      ),
      const TextInAppBarWidget(),
      Spacer()
    ]);
  }
}

class TextInAppBarWidget extends StatelessWidget {
  const TextInAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  state.weatherEntity!.name,
                  style: CustomTextStyle.B2(context).copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                FutureBuilder<String?>(
                  future: _getCountryNameInRussian(
                      state.weatherEntity!.sys.country),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Ошибка: ${snapshot.error}');
                    } else {
                      return Text(', ${snapshot.data}',
                          style: CustomTextStyle.B2(context)
                              .copyWith(color: Colors.white));
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Future<String?> _getCountryNameInRussian(String countryCode) async {
    final countryInfo =
        await Future.value(CountryCode.convertCountryCodeToName(countryCode));
    if (countryInfo != "") {
      return countryInfo;
    } else {
      return 'Не удалось найти страну';
    }
  }
}
