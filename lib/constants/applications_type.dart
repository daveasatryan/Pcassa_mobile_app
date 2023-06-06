enum ApplicationsType {
  forTaxi,
  forShopping,
  forSalary,
}

extension OrderPageTranslation on ApplicationsType {
  String get title {
    switch (this) {
      case ApplicationsType.forTaxi:
        return 'applicationsType.forTaxi';
      case ApplicationsType.forShopping:
        return 'applicationsType.forShopping';
      case ApplicationsType.forSalary:
        return 'applicationsType.forSalary';
    }
  }
}
