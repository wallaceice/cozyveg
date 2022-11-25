class CompleteModel {
  bool checkboxValue = false;
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;

  bool switchValue = false;
  double sliderValue = .5;
  int radioValue = 1;
  int radioValue2 = 1;
  int bottomSheetChoice = 0;

  doSomething() {
    print("CheckBox: $checkboxValue");
    print("Switch: $switchValue");
    print("Slider: $sliderValue");
    print("Radio: $radioValue");
  }
}
