import 'dart:async';

import 'package:covid_19_app/core/utils/size_config.dart';
import 'package:covid_19_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class RiskButton extends StatefulWidget {
  // final Function() onPressed;
  const RiskButton({
    Key? key,
    // required this.onPressed,
  }) : super(key: key);

  @override
  _RiskButtonState createState() => _RiskButtonState();
}

class _RiskButtonState extends State<RiskButton> {
  Timer? timer;
  late Color buttonColor = Theme.of(context).primaryColor;
  final List<Color> colorsList = [
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];
  int currentColorIndex = 0;
  // bool isClicked = false;

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final size = SizeConfig.blockSizeVertical * 24;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          timer = new Timer.periodic(
              new Duration(
                seconds: 1,
              ), (Timer timer) {
            setState(() {
              currentColorIndex = (currentColorIndex + 1) % colorsList.length;
              buttonColor = colorsList[currentColorIndex];
            });
          });
        } else if (state is HomeLoaded) {
          timer?.cancel();
          setState(() {
            buttonColor = Theme.of(context).primaryColor;
            // buttonColor = Colors.red;
          });
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                // if (isClicked) {

                //   // widget.onPressed();
                // } else {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                if (state is HomeLoading) {
                } else {
                  context.read<HomeBloc>().add(GetPredication(position));
                }

                // }
                // isClicked = !isClicked;
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(140),
              ),
              splashColor: (state is HomeLoaded)
                  ? colorsList[state.prediction]
                  : buttonColor,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: size,
                width: size,
                decoration: new BoxDecoration(
                  // color: Theme.of(context).primaryColor,
                  color: ((state is HomeLoaded)
                          ? colorsList[state.prediction]
                          : buttonColor)
                      .withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    Provider.of<CustomThemeProps>(context).boxShadow,
                  ],
                ),
                child: Center(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ((state is HomeLoading)) ? "" : 'Check Risk',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            (state is HomeLoaded)
                ? Container()
                : SizedBox(
                    height: 10,
                  ),
            Text(
              (state is HomeLoading) ? 'Checking...' : "",
              style: Theme.of(context).textTheme.headline5,
            ),
            // Text(
            //   (state is HomeLoading) ? 'Tap button again to cancel' : "",
            //   style: Theme.of(context)
            //       .textTheme
            //       .headline6!
            //       .copyWith(color: Theme.of(context).hintColor),
            // ),
          ],
        );
      },
    );
  }
}
