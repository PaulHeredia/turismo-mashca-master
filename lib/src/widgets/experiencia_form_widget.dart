import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:mashcas_turismo/src/models/foto_model.dart';
import 'package:mashcas_turismo/src/pages/home_page.dart';
import 'package:mashcas_turismo/src/services/experiencia_service.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:mashcas_turismo/src/models/foto_model.dart';
//import 'package:mashcas_turismo/src/services/foto_service.dart';

class ExperienciaFormWidget extends StatefulWidget {
  const ExperienciaFormWidget(
      // ignore: non_constant_identifier_names
      {Key? key,
      required this.isInicio,
      // ignore: non_constant_identifier_names
      required this.nombre_lugar})
      : super(key: key);
  @override
  _ExperienciaFormWidget createState() => _ExperienciaFormWidget();
  // ignore: non_constant_identifier_names
  final String nombre_lugar;
  final bool isInicio;
}

class _ExperienciaFormWidget extends State<ExperienciaFormWidget> {
  late Foto _foto;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  bool _onSaving = false;
  final ExperienciaService _experienciaService = ExperienciaService();

  @override
  void initState() {
    super.initState();
    _foto = Foto.created(widget.nombre_lugar);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
            child: Column(children: [
              TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: _foto.nombreLugar,
                  onSaved: (value) {
                    //Este evento se ejecuta cuando el Form ha sido guardado localmente
                    _foto.nombreLugar =
                        value; //Asigna el valor del TextFormField al atributo del modelo
                  },
                  validator: (value) {
                    return _validateObservacion(value!);
                  },
                  decoration: const InputDecoration(labelText: "Nombre Lugar "),
                  maxLength: 25,
                  maxLines: 3),
              TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: _foto.descripcionLugar,
                  onSaved: (value) {
                    //Este evento se ejecuta cuando el Form ha sido guardado localmente
                    _foto.descripcionLugar =
                        value; //Asigna el valor del TextFormField al atributo del modelo
                  },
                  validator: (value) {
                    return _validateObservacion(value!);
                  },
                  decoration:
                      const InputDecoration(labelText: "Impresión del lugar"),
                  maxLength: 255,
                  maxLines: 3),
              TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: _foto.impresiones,
                  onSaved: (value) {
                    //Este evento se ejecuta cuando el Form ha sido guardado localmente
                    _foto.impresiones =
                        value; //Asigna el valor del TextFormField al atributo del modelo
                  },
                  validator: (value) {
                    return _validateObservacion(value!);
                  },
                  decoration:
                      const InputDecoration(labelText: "Recomendaciones"),
                  maxLength: 255,
                  maxLines: 3),
              Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Text("Ingresar la fecha de visita",
                      style: Theme.of(context).textTheme.subtitle1)),
              DatePickerWidget(
                  lastDate: DateTime.now(),
                  looping: false, // default is not looping
                  dateFormat: "dd-MMMM-yyyy",
                  locale: DatePicker.localeFromString('es'),
                  onChange: (DateTime newDate, _) {
                    _foto.fecha = newDate;
                  }),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("Ingresar la imagen",
                      style: Theme.of(context).textTheme.subtitle1)),
              SizedBox(
                  height: 100.h,
                  width: 150.h,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: _imagen == null
                        ? Image.asset('assets/images/Latacunga.jpg')
                        : Image.file(_imagen!),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                      onPressed: () => _selectImage(ImageSource.camera),
                      icon: const Icon(Icons.camera),
                      label: const Text("Cámara")),
                  ElevatedButton.icon(
                      onPressed: () => _selectImage(ImageSource.gallery),
                      icon: const Icon(Icons.image),
                      label: const Text("Galería")),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: _onSaving
                      ? const CircularProgressIndicator()
                      : Tooltip(
                          message: "Registrar",
                          child: ElevatedButton.icon(
                              onPressed: () {
                                _sendForm();
                              },
                              label: const Text("Guardar"),
                              icon: const Icon(Icons.save)),
                        ))
            ]),
          )),
    ));
  }

  _selectImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
      //print('No image selected.');

    }
    setState(() {});
  }

  _validateObservacion(String value) {
    if (value.length < 2) {
      return "Debe ingresar al menos 10 caracteres";
    }
    return null; //Cuando se retorna nulo el campo te texto está validado
  }

  _sendForm() async {
    if (!_formKey.currentState!.validate()) return;

    _onSaving = true;
    setState(() {});
    _formKey.currentState!.save(); //Guarda el form localmente

    if (_imagen != null) {
      _foto.url = await _experienciaService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Foto
    int? estado = await _experienciaService.postExperiencia(_foto);
    _formKey.currentState!.reset();
    _onSaving = false;
    // ignore: avoid_print
    print(estado);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Gracias por su registro',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  child: const Text(
                    'Continuar',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  })
            ],
          );
        });
  }
}
