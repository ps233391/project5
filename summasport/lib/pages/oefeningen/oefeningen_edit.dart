import 'package:summasport/models/oefeningen.dart';
import 'package:summasport/services/oefeningen_service.dart';
import 'package:flutter/material.dart';

class oefeningenEdit extends StatefulWidget {
  const oefeningenEdit({Key? key, required this.oefeningen}) : super(key: key);
  final Oefeningen oefeningen;

  @override
  State<oefeningenEdit> createState() => oefeningenEditState();
}

class oefeningenEditState extends State<oefeningenEdit> {
  final _formKey = GlobalKey<FormState>();
  final _naamController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    _naamController.text = widget.oefeningen.name;
    _descriptionController.text = widget.oefeningen.description;
    super.initState();
  }

  @override
  void dispose() {
    _naamController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('oefeningen - Edit')),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                // Naam
                TextFormField(
                  controller: _naamController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Naam',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vul naam in';
                    }
                    return null;
                  },
                ),

                // Klass
                TextFormField(
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Klas',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vul klas in';
                    }
                    return null;
                  },
                ),

                // Save / Cancel
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Verbeter de fouten')),
                          );
                        }
                        var oefeningen = Oefeningen(
                            id: widget.oefeningen.id,
                            name: _naamController.text,
                            description: _descriptionController.text);
                        oefeningen = await OefeningenService()
                            .put(widget.oefeningen.id, oefeningen);
                        if (context.mounted){
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Bewaren'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Annuleren'),
                    ),
                  ],
                )
              ],
            )));
  }
}
