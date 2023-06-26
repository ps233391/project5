import 'package:summasport/models/oefeningen.dart';
import 'package:summasport/models/onderdelen.dart';
import 'package:summasport/services/oefeningen_service.dart';
import 'package:summasport/services/onderdelen_service.dart';
import 'package:flutter/material.dart';

class oefeningenonderdelenpage extends StatefulWidget {
  const oefeningenonderdelenpage({Key? key, required this.oefeningen}) : super(key: key);

  final Oefeningen oefeningen;

  @override
  State<oefeningenonderdelenpage> createState() => _oefeningenonderdelenpageState();
}

class _oefeningenonderdelenpageState extends State<oefeningenonderdelenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oefeningen onderdelen')),
      body: Column(
        children: [
          // Oefeningen Data
          Text('${widget.oefeningen.name} (${widget.oefeningen.description})'),

          // onderdelen
          Expanded(
            child: FutureBuilder<List<Onderdelen>>(
              future: OnderdelenService().getAll(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // print(widget.oefeningen.onderdelen!.contains(snapshot.data![index]));
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data![index].name),
                        Checkbox(
                          value: widget.oefeningen.onderdelen!
                              .contains(snapshot.data![index]),
                          onChanged: (value) {
                            if (value == true) {
                              // 'Toevoegen van onderdeel;
                              OefeningenService().addOnderdelenToOefeningen(
                                  widget.oefeningen.id, snapshot.data![index].id);
                              widget.oefeningen.onderdelen!
                                  .add(snapshot.data![index]);
                            } else {
                              OefeningenService().deleteOnderdelenFromOefeningen(
                                  widget.oefeningen.id, snapshot.data![index].id);
                              Onderdelen onderdeel = widget.oefeningen.onderdelen!.firstWhere(
                                      (element) =>
                                  element.id == snapshot.data![index].id);
                              if (onderdeel != null) {
                                widget.oefeningen.onderdelen!.remove(onderdeel);
                              }
                            }
                            setState(() {});
                          },
                        )
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
