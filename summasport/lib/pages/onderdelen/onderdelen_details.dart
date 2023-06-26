import 'package:summasport/models/onderdelen.dart';
import 'package:flutter/material.dart';

class OnderdelenDetails extends StatelessWidget {
  const OnderdelenDetails({Key? key, required this.onderdelen}) : super(key: key);
  final Onderdelen onderdelen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('oefeningen - Details')),
      body: Column(
        children: [
          Text('Onderdelen: ${onderdelen.name}'),
          const SizedBox(height: 10),
          const Divider(thickness: 3),
          onderdelen.oefeningen == null || onderdelen.oefeningen!.isEmpty
              ? const Text('Geen beoefenaars voor deze oefeningen')
              : Expanded(
            child: ListView.separated(
              itemCount: onderdelen.oefeningen!.length,
              itemBuilder: (context, index) {
                return Text(onderdelen.oefeningen![index].name);
              },
              separatorBuilder: (context, index) {
                if (index.isEven) {
                  return const Divider(color: Colors.green);
                } else {
                  return const Divider(color: Colors.red);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
