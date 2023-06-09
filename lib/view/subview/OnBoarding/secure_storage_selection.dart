import 'package:flutter/material.dart';
import 'package:polydet/interfaces/view/i_onboarding_subview.dart';
import 'package:polydet/types/secure_storage_type.dart';
import 'package:polydet/view/elements/rich_card_selector.dart';
import 'package:polydet/view/elements/simple_description_card.dart';
import 'package:polydet/view/pages/on_boarding.dart';
import 'package:polydet/view/subview/OnBoarding/onboarding_subview.dart';
import 'package:provider/provider.dart';

class SecureStorageSelection extends OnBoardingSubview {
  const SecureStorageSelection({super.key, required super.changeSubview});

  @override
  State<SecureStorageSelection> createState() => _SecureStorageSelectionState();

  @override
  SimpleDescriptionCard getDescription() {
    return const SimpleDescriptionCard(description: [
      "In order to get the full potential of the app, we need to save your login credentials on your device.",
      "Please select the storage methode : "
    ],);
  }
}

class _SecureStorageSelectionState extends OnBoardingSubviewState<SecureStorageSelection> with OnBoardingSubviewRender {

  Widget getBody(FirstSetupState state) {
    return RichCardSelector(
        elements: const [
          (
          title: "SecureStorage",
          elements: [
            Text(
                "The most secure way of storing your login credentials inside of our app."),
            Text(
                "However, an access to our servers is needed in order to perform the decryption, "
                    "because the cipher key isn't stored on your device."),
          ]
          ),
          (
          title: "LessSecureStorage",
          elements: [
            Text(
                "Less secure way of storing your login credentials inside of our app."),
            Text(
                "You do not depend on our servers, but the encryption key is also stored on your device alongside to your login credentials")
          ]
          )
        ],
        onSelectionChange: (index) => {
          if (index < 0 || index > 1)
            {throw RangeError("Invalid index for SS selection !")}
          else
            {state.setStorageType(SecureStorageType.values[index])}
        });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FirstSetupState>();

    return render(widget.getDescription(), getBody(appState), "Confirm", () {
      print("pongie");
      widget.changeSubview();
    }
    );
  }
}
