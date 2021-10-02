import 'package:covid_19_app/core/utils/size_config.dart';
import 'package:covid_19_app/presentation/common_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaskAdvisorCard extends StatelessWidget {
  const MaskAdvisorCard({Key? key, required this.maskInt}) : super(key: key);
  final int maskInt;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final List<String> masktypes = [
      "Surgical masks",
      "Surgical masks",
      "N95 masks"
    ];
    final List<String> maskImage = [
      "assets/svg/mask_surgical.svg",
      "assets/svg/mask_surgical.svg",
      "assets/svg/mask_n95.svg"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recommended Mask',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        CustomCard(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        FittedBox(
                          child: Text(
                            masktypes[maskInt],
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        // Text(
                        //   maskDescriptions[maskInt],
                        //   // style: Theme.of(context).textTheme.headline5!.copyWith(
                        //   //       fontWeight: FontWeight.bold,
                        //   //     ),
                        // ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          maskImage[maskInt],
                          width: SizeConfig.blockSizeHorizontal * 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
