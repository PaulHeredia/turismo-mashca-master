import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/bloc/signup_bloc.dart';
import 'package:mashcas_turismo/src/models/usuario_model.dart';
import 'package:mashcas_turismo/src/services/usuario_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final SignUpBloc _signUpBloc = SignUpBloc();

  final UsuarioService _usrServ = UsuarioService();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 27, 40, 57),
            height: size * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 35.0, right: 35.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Registro de usuario",
                      style: Theme.of(context).textTheme.headline4!.apply(
                          color: const Color.fromARGB(255, 253, 182, 4))),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).hintColor, width: 2.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<String>(
                            stream: _signUpBloc.userStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeName,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(
                                          Icons.person_add_alt_1_rounded),
                                      labelText: "Nombre de usuario",
                                      hintText: "Kimise"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.usernameStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeUsername,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.person),
                                      labelText: "Nombre",
                                      hintText: "Nombre y apellido"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.emailStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeEmail,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.email),
                                      labelText: "Correo electrónico",
                                      hintText: "admin@mashcas.com"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.passwordStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  onChanged: _signUpBloc.changePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            _obscureText = !_obscureText;
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          )),
                                      icon: const Icon(Icons.verified_user),
                                      labelText: "Contraseña"));
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: StreamBuilder<bool>(
                              stream: _signUpBloc.formSignUpStream,
                              builder: (context, snapshot) {
                                return ElevatedButton.icon(
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            Usuario usr = Usuario(
                                                displayName:
                                                    _signUpBloc.username,
                                                email: _signUpBloc.email,
                                                password: _signUpBloc.password,
                                                userName: _signUpBloc.name);
                                            int result =
                                                await _usrServ.postUsuario(usr);
                                            if (result == 201) {
                                              Navigator.pop(context);
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'El correo ya se encuentra registrado',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            child: const Text(
                                                              'Continuar',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            })
                                                      ],
                                                    );
                                                  });
                                            }
                                          }
                                        : null,
                                    icon: const Icon(Icons.login),
                                    label: const Text("Registrarse "));
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("¿Ya tienes una cuenta?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: const Text("Iniciar sesión"))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
