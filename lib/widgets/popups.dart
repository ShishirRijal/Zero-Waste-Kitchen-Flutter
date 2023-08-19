import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

class SuccessPopup extends StatelessWidget {
  const SuccessPopup({required this.message, this.onPressed, super.key});
  final String message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomAlertPopup(
      assetAddress: 'assets/json/success.json',
      text: message,
      buttonText: 'Okay',
      showButton: true,
      onPressed: onPressed,
    );
  }
}

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAlertPopup(
        assetAddress: 'assets/json/loading.json', text: 'Loading...');
  }
}

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({this.errorText, super.key});
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return CustomAlertPopup(
      assetAddress: 'assets/json/error.json',
      text: errorText ?? 'An unknown error occurred!',
      showButton: true,
      onPressed: () => Navigator.pop(context),
    );
  }
}

class CustomAlertPopup extends StatelessWidget {
  const CustomAlertPopup({
    required this.assetAddress,
    required this.text,
    this.isJson = true,
    this.showButton = false,
    this.onPressed,
    this.buttonText = 'Okay',
    super.key,
  });
  final String assetAddress;
  final String text;
  final bool isJson;
  final bool showButton;
  final Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return CustomPopupDialog(children: [
      isJson
          ? SizedBox(height: 100, width: 100, child: Lottie.asset(assetAddress))
          : Image.asset(assetAddress, height: 100, width: 100),
      const SizedBox(height: 20),
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Constants.kBlackColor, fontSize: 16),
      ),
      if (showButton) ...[
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Constants.kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ))),
      ]
    ]);
  }
}

class CustomPopupDialog extends StatelessWidget {
  const CustomPopupDialog({required this.children, super.key});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1.5,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 15, offset: Offset(0, 15))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
