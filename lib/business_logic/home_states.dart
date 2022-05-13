abstract class HomeStates{}
class InitialHomeState extends HomeStates{}
class NavBarChangerState extends HomeStates{}
class TransferMoneySuccess extends HomeStates{}
class TransferMoneyError extends HomeStates{
  final String error;

  TransferMoneyError(this.error);
}