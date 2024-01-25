part of 'internetcheck_bloc.dart';

@immutable
abstract class InternetcheckEvent {}

class Internetyes extends InternetcheckEvent {}
class Internetno extends InternetcheckEvent {}
