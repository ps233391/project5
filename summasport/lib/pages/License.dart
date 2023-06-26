import 'package:flutter/material.dart';

class licensepage extends StatelessWidget {
  const licensepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("About"),
          onPressed: () => showAboutDialog(
            context: context,
            applicationName: "Project5",
            applicationVersion: "1.0.0",
            applicationLegalese: "© 2023 Rik en Feie",
            children: [
              Text("This is our Project."),
              // Add additional information or widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}