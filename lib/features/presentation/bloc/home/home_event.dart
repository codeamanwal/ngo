abstract class HomeEvent {
  const HomeEvent();
}

class GetProductsEvent extends HomeEvent {
  const GetProductsEvent();
}

class LogOutEvent extends HomeEvent {
  const LogOutEvent();
}

class ToggleProductInformationEvent extends HomeEvent {
  final int index;
  ToggleProductInformationEvent(this.index);
}

class ToggleMenuDialogEvent extends HomeEvent {
  const ToggleMenuDialogEvent();
}
