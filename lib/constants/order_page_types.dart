enum OrderPageType {
  quickOrder,
  editOrder,
}

extension OrderPageTranslation on OrderPageType {
  String get title {
    switch (this) {
      case OrderPageType.quickOrder:
        return 'orderPageTypes.quickCheck';

      case OrderPageType.editOrder:
        return 'orderPageTypes.editOrder';
    }
  }
}
