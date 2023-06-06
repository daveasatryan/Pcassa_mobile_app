enum PayedOrderActionsType {
  deleteCheck,
  cancel,
}

extension OrderPageTranslation on PayedOrderActionsType {
  String get title {
    switch (this) {
      case PayedOrderActionsType.deleteCheck:
        return 'payedOrderTypes.deleteCheck';
      case PayedOrderActionsType.cancel:
        return 'payedOrderTypes.cancel';
    }
  }
}
