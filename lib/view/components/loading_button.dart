import 'package:flutter/material.dart';

class MyLoadingButton extends StatefulWidget {
  final Widget? child;
  final void Function()? onComplete;
  final Future<bool> loadingAction;

  const MyLoadingButton(
      {super.key,
      required this.child,
      required this.onComplete,
      required this.loadingAction});

  @override
  State<MyLoadingButton> createState() => _MyLoadingButtonState();
}

class _MyLoadingButtonState extends State<MyLoadingButton> {
  // to check is button child is loaded to display progressbar and disable button

  bool _isLoading = false;

   _handlePress() async {
    setState(() {
      _isLoading = true;
    });
    await widget.loadingAction;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // have a value and executed when button is pressed, null disable
      onPressed: _isLoading
          ? null
          : () {
              _handlePress();
              widget.onComplete;
            },
      child: _isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : widget.child,
    );
  }
}
