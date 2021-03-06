import 'dart:async';

class Validator {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(data)) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Correo no válido');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 6) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Contraseña al menos 6 caracteres');
      }
    },
  );

  final usernameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 8) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Usuario al menos 8 caracteres');
      }
    },
  );
  final nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 3) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Usuario al menos 8 caracteres');
      }
    },
  );
}
