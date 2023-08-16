import 'package:flutter/material.dart';
import 'package:spread/spread.dart';

import '../../pages/home/states.dart';
import '../../users/states/user_item_states.dart';
import '../model/post.dart';
import '../use_cases/posts_uses_case.dart';

class CreatePostPage extends StatelessWidget with StateEmitter {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Spread<UserItemState>(builder: (BuildContext context, UserItemState? state) {
      if (state is UserSelectedState) {
        final user = state.user;
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear Post para ${user.name}'),
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
                            CreatePostUseCase(
                                post: Post(
                                  id: 0,
                                  userId: user.id,
                                  title: _titleController.text,
                                  body: _bodyController.text
                                )
                            ).execute();
                          }
                        },
                        child: Text('Guardar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
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
      } else {
        return const Center(
          child: Text('No hay usuario seleccionado'),
        );
      }
    });
  }
}
