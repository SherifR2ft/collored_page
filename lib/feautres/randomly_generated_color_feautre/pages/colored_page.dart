import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sherif_raafat/common_widgets/animated_text_widget.dart';
import 'package:sherif_raafat/constants/app_size.dart';
import 'package:sherif_raafat/constants/themes_styles.dart';
import 'package:sherif_raafat/feautres/randomly_generated_color_feautre/random_color_generator_provider.dart';
import 'package:sherif_raafat/utils/app_localization.dart';

/// This widget represents the home page of the application.
///
/// It displays a centered text with a gradient of two colors generated randomly
/// by the [RandomColorGeneratorProvider]. The colors are updated whenever the
/// user taps on the screen or when the device orientation changes.
///
/// The [ColoredPage] also handles resetting SystemChrome style when the user
/// navigates back to the home page. It does this by using the [WillPopScope]
/// widget and setting the [SystemUiOverlayStyle] to the default style.
///
/// This widget uses the [AppSize.setDefaultSize] method to set the default
/// screen size for the application.
///
/// To use this widget, you can simply include it in your `MaterialApp` widget.
class ColoredPage extends StatelessWidget {
  ///
  const ColoredPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.setDefaultSize(context);

    return WillPopScope(
      onWillPop: () {
        // to reset SystemChrome style
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

        return Future.value(true);
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          Future.delayed(Duration.zero, () {
            context
                .read<RandomColorGeneratorProvider>()
                .setOrientation(orientation);
          });

          return GestureDetector(
            onTap: () => context
                .read<RandomColorGeneratorProvider>()
                .generateRandomlyColor(),
            child: Consumer<RandomColorGeneratorProvider>(
              builder: (context, provider, child) => Material(
                color: provider.backGroundColor,
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        provider.secondTextColor,
                        provider.textColor,
                        provider.secondTextColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: AnimatedTextWidget(
                      text: AppLocalization.myLocal.helloThere,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: provider.textColor,
                            fontSize: AppSize.primarySize,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
