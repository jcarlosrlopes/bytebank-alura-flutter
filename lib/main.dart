import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioTransferencia());
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _numeroContaControl = TextEditingController();
  final TextEditingController _valorControl = TextEditingController();

  _onButtonPressed(BuildContext context) {
    int? numeroConta = int.tryParse(_numeroContaControl.text);
    double? valor = double.tryParse(_valorControl.text);

    if (numeroConta != null && valor != null) {
      Transferencia t1 = Transferencia(valor, numeroConta);
      debugPrint('${t1}');
      ScaffoldMessenger.of(context).  showSnackBar(SnackBar(content: Text(t1.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CampoTexto(controller: _numeroContaControl, label: "Número da conta", hint: "0000"),
          CampoTexto(controller: _valorControl, label: "Valor", hint: "0.00", icone: Icons.monetization_on,),
          ElevatedButton(
              onPressed: () => _onButtonPressed(context), child: const Text("Confirmar"))
        ],
      ),
      appBar: AppBar(title: const Text("Criando transferência")),
    );
  }
}

class CampoTexto extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icone;

  const CampoTexto({Key? key, this.controller, this.label, this.hint, this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemTransferencia(Transferencia(123.0, 1000)),
          ItemTransferencia(Transferencia(321.0, 2000)),
          ItemTransferencia(Transferencia(456.0, 3000)),
        ],
      ),
      appBar: AppBar(
        title: const Text("Transferências"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "Adicionar",
        onPressed: () => print("Show"),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta.toString()),
        leading: const Icon(Icons.monetization_on),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
