
import '../model/user.dart';

abstract class UserItemState {
  final User user;

  UserItemState({required this.user});
}
class UserNoSelectedState extends UserItemState {
  UserNoSelectedState({required super.user});
}
class UserSelectedState extends UserItemState {
  UserSelectedState({required super.user});
}