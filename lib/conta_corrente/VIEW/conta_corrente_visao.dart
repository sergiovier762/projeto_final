import 'package:flutter/material.dart';
import 'package:trabalho_final/conta_corrente/CONTROLADOR/conta_corrente_controlador.dart';
import '../../globals.dart' as globals;

class ContaCorrenteVisao extends StatefulWidget {
  const ContaCorrenteVisao({ Key? key }) : super(key: key);

  @override
  State<ContaCorrenteVisao> createState() => _ContaCorrenteVisaoState();
}

class _ContaCorrenteVisaoState extends State<ContaCorrenteVisao> {
  ContaCorrenteContraldor contralador = ContaCorrenteContraldor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Caixa Eletronico ${globals.contaCorrenteLogada!.titularDaConta}")),
      body: Column(
        children: [
          Text("Saldo: ${globals.contaCorrenteLogada!.saldo}"),
          Container(
            margin: EdgeInsets.all(20.0),
            child: TextField(
              controller: contralador.textEditingControllerDeposito,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor do deposito',
              ),
            )
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () async{
                var valor = globals.contaCorrenteLogada!.deposito(double.parse(contralador.textEditingControllerDeposito.text));
                if(valor == -1){
                    await showDialog(
                        context: context,
                        builder: (_) {
                          return const AlertDialog(
                            title: Text("Valor inválido para deposito"),
                          );
                        });
                }
                setState(() {
                  
                });
              },
              child: Text("Depositar"),
            )
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: TextField(
              controller: contralador.textEditingControllerValorPIX,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor do PIX',
              ),
            )
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: TextField(
              controller: contralador.textEditingControllerChavePIX,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Chave PIX do favorecido',
              ),
            )
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () async{
                var valor = globals.contaCorrenteLogada!.pix(contralador.textEditingControllerChavePIX.text, double.parse(contralador.textEditingControllerValorPIX.text));
                if(valor == -1){
                    await showDialog(
                        context: context,
                        builder: (_) {
                          return const AlertDialog(
                            title: Text("Valor inválido para PIX"),
                          );
                        });
                }
                if(valor == -2){
                    await showDialog(
                        context: context,
                        builder: (_) {
                          return const AlertDialog(
                            title: Text("Chave pix invalida"),
                          );
                        });
                }
                setState(() {
                  
                });
              },
              child: Text("Fazer PIX"),
            )
          ),
        ],
      ),
    );
  }
}