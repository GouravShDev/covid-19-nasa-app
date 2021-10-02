import 'package:covid_19_app/core/utils/size_config.dart';
import 'package:covid_19_app/presentation/pages/home_page/widgets/risk_widget.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool temp = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RiskButton(onPressed: () {
              setState(() {
                temp = !temp;
              });
            }),
          ),
          if (!temp)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    color: Colors.teal.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            'How to protect yourself & others from COVID-19',
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
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
