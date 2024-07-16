import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitChasingDots(
      size: 30,
      color: Theme.of(context).colorScheme.primary,
    ));
  }
}
