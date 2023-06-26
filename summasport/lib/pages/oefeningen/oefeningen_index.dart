import 'package:summasport/models/oefeningen.dart';
import 'package:summasport/pages/oefeningen/oefeningen_create.dart';
import 'package:summasport/pages/oefeningen/oefeningen_edit.dart';
import 'package:summasport/pages/oefeningen/oefeningen_onderdelen.dart';
import 'package:summasport/services/oefeningen_service.dart';
import 'package:flutter/material.dart';

class oefeningenindex extends StatefulWidget {
  const oefeningenindex({Key? key}) : super(key: key);

  @override
  State<oefeningenindex> createState() => _oefeningenIndexState();
}

class _oefeningenIndexState extends State<oefeningenindex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text('Oefeningen Index'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Oefeningen>>(
        future: OefeningenService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return _oefeningenIndex(snapshot.data!, context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _createOefening(context),
      ),
    );
  }

  Widget _oefeningenIndex(List<Oefeningen> list, BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: _oefeningenOnderdelen(list[index], context),
          title: Row(
            children: [
              Expanded(child: Text(list[index].name)),
              _editOefeningen(list[index], context),
              _deleteOefeningen(list[index].id, context)
            ],
          ),
          subtitle: Text('Aantal onderdelen: ${list[index].onderdelen?.length ?? 0}'),
        );
      },
    );
  }

  Future<void> _createOefening(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const oefeningencreate(),
    ));
    setState(() {});
  }

  Widget _editOefeningen(Oefeningen oefeningen, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => oefeningenEdit(oefeningen: oefeningen),
        ));
        setState(() {});
      },
      child: const Icon(Icons.edit),
    );
  }

  Widget _deleteOefeningen(int id, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool gelukt = await OefeningenService().delete(id);
        if (gelukt) {
          // refresh scherm
          setState(() {});
        } else {
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('oefeningen - Delete'),
                  content: const Text('Verwijderen is mislukt'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Ok'))
                  ],
                );
              },
            );
          }
        }
      },
      child: const Icon(Icons.delete_outline),
    );
  }

  Widget _oefeningenOnderdelen(Oefeningen oefeningen, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => oefeningenonderdelenpage(oefeningen: oefeningen),
        ));
        setState(() {});
      },
      child: const Icon(Icons.account_box_outlined),
    );
  }
}
