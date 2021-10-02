import 'package:covid_19_app/presentation/common_widgets/custom_card.dart';
import 'package:covid_19_app/presentation/pages/covid_info/covid_info_page.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CovidInfoCard extends StatelessWidget {
  const CovidInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Some info about Covid',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        'How to protect yourself & others from COVID-19?',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(
                              'assets/svg/virus_blue.svg',
                              fit: BoxFit.contain,
                              height: 80,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset(
                              'assets/svg/virus.svg',
                              fit: BoxFit.contain,
                              height: 100,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -25,
                left: 40,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      Provider.of<CustomThemeProps>(context).boxShadow,
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, CovidInfoPage.route);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
