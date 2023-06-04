abstract interface class IOnBoardingSubView {

  /// Called by the OnBoarding button.
  /// True => Can move on;
  /// False => Stay on current subview
  Future<bool> onConfirm();
}