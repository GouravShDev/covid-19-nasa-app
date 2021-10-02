import 'dart:async';

import 'package:covid_19_app/core/utils/size_config.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RiskButton extends StatefulWidget {
  final Function() onPressed;
  const RiskButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  _RiskButtonState createState() => _RiskButtonState();
}

class _RiskButtonState extends State<RiskButton> {
  late Timer timer;
  late Color buttonColor = Theme.of(context).primaryColor;
  final List<Color> colorsList = [Colors.red, Colors.yellow, Colors.green];
  int currentColorIndex = 0;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final size = SizeConfig.blockSizeVertical * 24;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (isClicked) {
              timer.cancel();
              setState(() {
                buttonColor = Theme.of(context).primaryColor;
              });
              widget.onPressed();
            } else {
              timer = new Timer.periodic(
                  new Duration(
                    seconds: 1,
                  ), (Timer timer) {
                setState(() {
                  currentColorIndex =
                      (currentColorIndex + 1) % colorsList.length;
                  buttonColor = colorsList[currentColorIndex];
                });
              });
            }
            isClicked = !isClicked;
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          splashColor: buttonColor,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: size,
            width: size,
            decoration: new BoxDecoration(
              // color: Theme.of(context).primaryColor,
              color: buttonColor.withOpacity(0.9),
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
                    (!isClicked) ? 'Check Risk' : "",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          (isClicked) ? 'Checking...' : "",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          (isClicked) ? 'Tap button again to cancel' : "",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Theme.of(context).hintColor),
        ),
      ],
    );
  }
}
