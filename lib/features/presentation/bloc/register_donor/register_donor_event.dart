abstract class RegisterDonorEvent {}

class TextChangeEvent extends RegisterDonorEvent {
  final String value;
  final int flag;
  TextChangeEvent(this.value, this.flag);
}

class RegisterDonorSubmittedEvent extends RegisterDonorEvent {}
