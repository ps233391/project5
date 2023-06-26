import 'package:summasport/models/onderdelen.dart';
import 'package:summasport/services/onderdelen_service.dart';
import 'package:flutter/material.dart';

class OnderdelenEdit extends StatefulWidget {
  const OnderdelenEdit({Key? key, required this.onderdelen}) : super(key: key);
  final Onderdelen onderdelen;

  @override
  State<OnderdelenEdit> createState() => _OnderdelenEditState();
}

class _OnderdelenEditState extends State<OnderdelenEdit> {
  final _formKey = GlobalKey<FormState>();
  final _naamController = TextEditingController();

  @override
  void initState() {
    _naamController.text = widget.onderdelen.name;
    super.initState();
  }

  @override
  void dispose() {
    _naamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Oefeningen - Edit')),
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
                        }
                        ;
                        var onderdelen = Onderdelen(
                            id: widget.onderdelen.id,
                            name: _naamController.text);
                        onderdelen = await OnderdelenService()
                            .put(widget.onderdelen.id, onderdelen);
                        if (context.mounted){
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Updaten'),
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
