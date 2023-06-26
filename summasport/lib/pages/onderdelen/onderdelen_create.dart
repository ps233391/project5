import 'package:summasport/models/onderdelen.dart';
import 'package:summasport/services/onderdelen_service.dart';
import 'package:flutter/material.dart';

class OnderdelenCreate extends StatefulWidget {
  const OnderdelenCreate({Key? key}) : super(key: key);

  @override
  State<OnderdelenCreate> createState() => _OnderdelenCreateState();
}

class _OnderdelenCreateState extends State<OnderdelenCreate> {
  final _formKey = GlobalKey<FormState>();
  final _naamController = TextEditingController();

  @override
  void dispose() {
    _naamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('onderdelen - Create')),
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

                // Save / Cancel
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Verbeter de fouten')),
                          );
                        };
                        var onderdelen = Onderdelen(id: 0,
                            name: _naamController.text);
                        onderdelen = await OnderdelenService().post(onderdelen);
                        Navigator.pop(context);
                      },
                      child: const Text('Maken'),),
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