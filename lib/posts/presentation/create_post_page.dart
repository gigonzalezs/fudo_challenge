import 'package:flutter/material.dart';
import 'package:spread/spread.dart';

import '../../pages/home/states.dart';

class CreatePostPage extends StatelessWidget with StateEmitter {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un título';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'Cuerpo'),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el cuerpo del post';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Aquí puedes manejar la lógica para guardar el post
                        print('Título: ${_titleController.text}');
                        print('Cuerpo: ${_bodyController.text}');
                        emit<AppState>(AppState.posts);
                      }
                    },
                    child: Text('Guardar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes manejar la lógica para cancelar
                      _titleController.clear();
                      _bodyController.clear();
                      emit<AppState>(AppState.posts);
                    },
                    child: Text('Cancelar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
