import 'dart:io';

abstract class DonateProductEvent {}

class TextChangeEvent extends DonateProductEvent {
  final String value;
  final int flag;
  TextChangeEvent(this.value, this.flag);
}

class ImageAddingEvent extends DonateProductEvent {
  final List<File> imageFiles;
  ImageAddingEvent({required this.imageFiles});
}

class DonateProductSubmitted extends DonateProductEvent {}
