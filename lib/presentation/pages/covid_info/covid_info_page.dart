import 'package:covid_19_app/presentation/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CovidInfoPage extends StatelessWidget {
  const CovidInfoPage({Key? key}) : super(key: key);

  static const String route = '/covid-info-page';

  @override
  Widget build(BuildContext context) {
    final List<String> measures = [
      'Get Vaccinated',
      'Wear a mask',
      'Stay 6 feet away from others',
      'Avoid crowds and poorly ventilated spaces',
      'Wash your hands often',
      'Cover coughs and sneezes',
    ];
    return Scaffold(
      appBar: CustomAppBar().customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Preventive measures for COVID-19',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      // color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: measures
                  .map(
                    (e) => Column(
                      children: [
                        Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  e,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        // color: Theme.of(context).colorScheme.primary,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
