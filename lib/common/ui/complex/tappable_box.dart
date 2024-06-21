import 'package:flutter/material.dart';

class TappableBox extends StatefulWidget {
  /// Creates box that can be tapped anywhere inside of it and call onTap callback
  ///
  /// Default onTap(): Searches for GestureDetector of widget that actionKey was passed to and tap on it.
  ///
  /// Note: there can be no GestureDetector or onTap() callback can be null so nothing happens. In this case pass onTap method
  const TappableBox({required this.builder, this.onTap, super.key});

  final Widget Function(BuildContext context, GlobalKey actionKey) builder;
  final void Function()? onTap;

  @override
  State<TappableBox> createState() => _TappableBoxState();
}

class _TappableBoxState extends State<TappableBox> {
  /// Pass this key to widget that you want to tap when user tap anywhere inside tile
  GlobalKey actionKey = GlobalKey();
  GestureDetector? detector;

  void searchForGestureDetector(BuildContext element) {
    // search for DropdownButton's GestureDetector to tap on it if user taps anywhere inside tile
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
      onTap: widget.onTap ?? onTap,
      child: ColoredBox(
        // to let user tap on blank space
        color: Colors.transparent,
        child: widget.builder(context, actionKey),
      ),
    );
  }
}
