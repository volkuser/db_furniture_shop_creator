abstract class Failure{
  String errormessage = '';
  int code=0;
}

class FailureDB extends Failure{
  final int getResultCode;
  FailureDB(this.getResultCode);
  Failure get error{
    switch(getResultCode){
      case 1555:{
        return InsertFailure();
      }
      case 2067:{
        return InsertFailure();
      }
      default: return DefaultFailure();
    }
  }
}

@override
class DefaultFailure implements Failure{
  int code=0;
  String errormessage='Неизвестная ошибка';
}

@override
class InsertFailure implements Failure{
  int code=1555;
  String errormessage='Такие данные уже существуют';
}

class AuthPasswordFailure implements Failure{
  @override
  int code=1054;
  @override
  String errormessage= "Неверный пароль";
}