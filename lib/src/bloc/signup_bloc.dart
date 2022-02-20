import 'package:mashcas_turismo/src/bloc/validator_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc with Validator {
  SignUpBloc();
  //Controllers
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  //Streams, vinculados con la validación
  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);
  Stream<String> get usernameStream =>
      _usernameController.stream.transform(usernameValidator);
  Stream<String> get userStream =>
      _nameController.stream.transform(nameValidator);
  Stream<bool> get formSignUpStream => Rx.combineLatest4(usernameStream,
      emailStream, passwordStream, userStream, (a, b, c, d) => true);
  //Funciones para el onChange cada control
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  //Propiedades con el valor del texto ingreso
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get username => _usernameController.value;
  String get name => _nameController.value;
}
