import 'package:summasport/models/onderdelen.dart';
import 'package:summasport/pages/onderdelen/onderdelen_create.dart';
import 'package:summasport/pages/onderdelen/onderdelen_details.dart';
import 'package:summasport/pages/onderdelen/onderdelen_edit.dart';
import 'package:summasport/services/onderdelen_service.dart';
import 'package:flutter/material.dart';

class OnderdelenIndex extends StatefulWidget {
  const OnderdelenIndex({Key? key}) : super(key: key);

  @override
  State<OnderdelenIndex> createState() => _OnderdelenIndexState();
}

class _OnderdelenIndexState extends State<OnderdelenIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _onderdelenCreate(context),
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text('onderdelen Index'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Onderdelen>>(
        future: OnderdelenService().getAllWithOefeningen(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return _OnderdelenIndex(snapshot.data!);
        },
      ),
    );
  }

  Widget _onderdelenCreate(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OnderdelenCreate(),
        ));
        setState(() {});
      },
      child: Icon(Icons.add),
    );
    ;
  }

  Widget _OnderdelenIndex(List<Onderdelen> onderdelen) {
    return ListView.builder(
      itemCount: onderdelen.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(5),
          color: Colors.brown.shade100,
          margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _onderdelenDetails(context, onderdelen[index]),
                  SizedBox(width: 10),
                  Expanded(child: Text(onderdelen[index].name)),
                  _onderdelenEdit(context, onderdelen[index]),
                  _onderdelenDelete(context, onderdelen[index].id),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _onderdelenDetails(BuildContext context, Onderdelen onderdelen) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OnderdelenDetails(onderdelen: onderdelen),
        ));
      },
      child: Icon(Icons.access_time),
    );
  }

  Widget _onderdelenEdit(BuildContext context, Onderdelen onderdelen) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OnderdelenEdit(onderdelen: onderdelen),
        ));
        setState(() {});
      },
      child: Icon(Icons.edit, color: Colors.green),
    );
  }

  Widget _onderdelenDelete(BuildContext context, int id) {
    return GestureDetector(
      onTap: () async {
        bool gelukt = await OnderdelenService().delete(id);
        if (gelukt) {
          // refresh scherm
          setState(() {});
        } else {
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('onderdelen - Delete'),
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
      child: const Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
    );
  }
}
