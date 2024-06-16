import 'package:equatable/equatable.dart';

class PictureEntity extends Equatable {
  String? url;
  String? filename;

  PictureEntity({
    this.url,
    this.filename,
  });

  @override
  List<Object?> get props => [url, filename];
}
