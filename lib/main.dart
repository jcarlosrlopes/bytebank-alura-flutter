import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: const [
          Card(
            child: ListTile(
              title: Text("Produto 1"),
              subtitle: Text("1234"),
              leading: Icon(Icons.monetization_on),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Produto 2"),
              subtitle: Text("1234"),
              leading: Icon(Icons.monetization_on),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Adicionar",
        onPressed: () => print("Show"),
      ),
    )));
