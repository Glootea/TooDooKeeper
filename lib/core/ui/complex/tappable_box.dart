import 'package:flutter/material.dart';

class SimpleTappableBox extends StatelessWidget {
  /// Creates box that can be tapped anywhere inside of it to call onTap callback
  const SimpleTappableBox(
      {required this.builder, required this.onTap, super.key,});

  final Widget Function(BuildContext context) builder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: builder(context),
    );
  }
}

class ComplexTappableBox extends StatefulWidget {
  /// Creates box that can be tapped anywhere inside of it and call onTap callback
  ///
  /// Default onTap(): Searches for GestureDetector of widget that actionKey was passed to and tap on it.
  ///
  /// **Note**: there can be no GestureDetector or onTap() callback can be null so nothing happens. In this case pass onTap method
  const ComplexTappableBox({required this.builder, this.onTap, super.key});

  final Widget Function(BuildContext context, GlobalKey actionKey) builder;
  final VoidCallback? onTap;

  @override
  State<ComplexTappableBox> createState() => _ComplexTappableBoxState();
}

class _ComplexTappableBoxState extends State<ComplexTappableBox> {
  /// Pass this key to widget that you want to tap when user taps anywhere inside tile
  GlobalKey actionKey = GlobalKey();
  GestureDetector? detector;

  void searchForGestureDetector(BuildContext element) {
    // search for Widget's GestureDetector
    element.visitChildElements((innerElement) {
      if (innerElement.widget is GestureDetector) {
        detector = innerElement.widget as GestureDetector;
      } else {
        searchForGestureDetector(innerElement);
      }
    });
  }

  void onTap() {
    final context = actionKey.currentContext;
    if (context != null) searchForGestureDetector(context);
    if (detector != null) {
      detector!.onTap?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    // visitChildElements is unavailable during build
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => searchForGestureDetector(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap ?? onTap,
      child: widget.builder(context, actionKey),
    );
  }
}
