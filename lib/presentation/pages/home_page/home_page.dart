import 'package:covid_19_app/core/utils/size_config.dart';
import 'package:covid_19_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:covid_19_app/presentation/common_widgets/custom_card.dart';
import 'package:covid_19_app/presentation/pages/home_page/widgets/covid_info_card.dart';
import 'package:covid_19_app/presentation/pages/home_page/widgets/mask_advisor_card.dart';
import 'package:covid_19_app/presentation/pages/home_page/widgets/risk_widget.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _riskLevels = [
    'low',
    'medium',
    'high',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RiskButton(
                  //   onPressed: () {
                  //   setState(() {
                  //     temp = !temp;
                  //   });
                  // },
                  ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        if (state is HomeLoaded) ...[
                          Text(
                            "Your Location have ${_riskLevels[state.prediction]} risk level",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          MaskAdvisorCard(
                            maskInt: state.prediction,
                          ),
                          SizedBox(height: 10),
                        ],
                        CovidInfoCard(),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
