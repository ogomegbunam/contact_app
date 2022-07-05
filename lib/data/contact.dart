import 'package:meta/meta.dart';
class Contact {
  String email;
  String name;
  String phoneNumber;
  bool isFavorite;
  Contact({required this.email, required this.name, required this.phoneNumber,this.isFavorite =false});
}
