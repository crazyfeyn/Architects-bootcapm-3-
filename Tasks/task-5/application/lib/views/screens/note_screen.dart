import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
    _controller.text = AppConstatnt.contents;
  }

  void _saveDocument() {
    final newContents = _controller.text;
    SettingsNotifier.of(context).updateContents(newContents);
  }

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Taking'),
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _saveDocument();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Start writing your note...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
