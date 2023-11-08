import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/modules/login/controllers/login_controller.dart';
import 'package:rskgcare/app/modules/login/views/widgets/custom_clippers/blue_top_clipper.dart';
import 'package:rskgcare/app/modules/login/views/widgets/custom_clippers/grey_top_clipper.dart';
import 'package:rskgcare/app/modules/login/views/widgets/custom_clippers/white_top_clipper.dart';
import 'package:rskgcare/app/modules/login/views/widgets/header.dart';
import 'package:rskgcare/app/modules/login/views/widgets/login_form.dart';
import '../../../widgets/color/custom_color.dart';
import 'constants.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView1();
  }
}

class LoginView1 extends StatefulWidget {
  const LoginView1({super.key});

  @override
  _LoginView1State createState() => _LoginView1State();
}

class _LoginView1State extends State<LoginView1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _headerTextAnimation;
  late final Animation<double> _formElementAnimation;
  late final Animation<double> _whiteTopClipperAnimation;
  late final Animation<double> _blueTopClipperAnimation;
  late final Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    final clipperOffsetTween = Tween<double>(
      begin: CupertinoTextSelectionToolbar.kToolbarScreenPadding,
      end: 0.0,
    );
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _whiteTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: kGrey),
          ),
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: GreyTopClipper(
                  yOffset: _greyTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: kBlue),
          ),
          AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: BlueTopClipper(
                  yOffset: _blueTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color:CustomColors.warnaputih),
          ),
          ListView(
            children: [
              Headerlogin(
                animation: _headerTextAnimation,
              ),
              const SizedBox(
                height: 100,
              ),
              LoginForm(animation: _formElementAnimation),
            ],
          ),
        ],
      ),
    );
  }
}
