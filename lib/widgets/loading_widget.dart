import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.path,
  }) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Lottie.asset(
          path ?? Assets.loadingAnimation,
          width: 240,
        ),
      ),
    );
  }
}
