import 'dart:async';
import 'package:bankapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supercharged/supercharged.dart';

import 'package:sa4_migration_kit/sa4_migration_kit.dart';

import '../Animation/fade.dart';

class Loadpage extends StatefulWidget {
  @override
  State<Loadpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Loadpage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator
          .pushReplacement(context,PageTransition(type: PageTransitionType.fade,child: const Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, 0.0.tweenTo(1.0), 5.seconds)
      ..add(AniProps.translateY, (-30.0).tweenTo(0.0), 5.seconds,
          Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: const Duration(seconds: 1),
      duration: tween.duration,
      tween: tween,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)), child: child),
      ),
    );
  }
}