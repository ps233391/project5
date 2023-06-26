import 'package:summasport/models/oefeningen.dart';
import 'package:summasport/services/oefeningen_service.dart';
import 'package:flutter/material.dart';

class oefeningencreate extends StatefulWidget {
  const oefeningencreate({Key? key}) : super(key: key);

  @override
  State<oefeningencreate> createState() => _oefeningenCreateState();
}

class _oefeningenCreateState extends State<oefeningencreate> {
  final _formKey = GlobalKey<FormState>();
  final _naamController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _naamController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('oefeningen - Create')),
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

                // description
                TextFormField(
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vul description in';
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

                            const SnackBar(content: Text('Verbeter de fouten'),
                            ),
                          );
                        }
                        var oefeningen = Oefeningen(id: 0,
                            name: _naamController.text,
                            description: _descriptionController.text);
                        oefeningen = await OefeningenService().post(oefeningen);
                        if (context.mounted){
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Bewaren'),),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Annuleren'),),
                  ],
                )
              ],

            )

        )
    );
  }
}
