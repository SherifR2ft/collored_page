import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sherif_raafat/constants/app_colors.dart';
import 'package:sherif_raafat/constants/constant_values.dart';

/// Splash
class Splash extends StatelessWidget {
  ///
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryBackGroundColor,
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: spinSize + (paddingSize * 2),
              ),
              const Spacer(),
              Flexible(
                flex: orientation == Orientation.portrait ? 1 : 7,
                child: Image.asset(
                  'assets/images/splash.png',
                ),
              ),
              const Spacer(),
              const Padding(
                padding: verticalPaddingEdgeInsets,
                child: SpinKitPulse(
                  color: AppColors.indicatorColor,
                  size: spinSize,
                  // controller: AnimationController(vsync: this, duration:
                  // const Duration(milliseconds: 1200)),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
