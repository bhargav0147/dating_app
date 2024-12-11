import 'package:flutter/material.dart';
import 'package:pro_image_editor/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/modules/main_editor/main_editor.dart';

class EditImageView extends StatelessWidget {
  const EditImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProImageEditor.network(
          'https://ideipodarkov.net/blog/wp-content/uploads/2016/03/10.jpg',
          callbacks: const ProImageEditorCallbacks()),
    );
  }
}
