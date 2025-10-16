abstract class ActionSelectable {
  String get selectableName;

  String? get selectableImage;

  String? get selectableCountryCode;
}

class BaseSelectableModel extends ActionSelectable {
  String name;
  int index;

  BaseSelectableModel(this.index, this.name);

  @override
  String? get selectableImage => null;

  @override
  String get selectableName => name;

  @override
  String? get selectableCountryCode => null;
}
