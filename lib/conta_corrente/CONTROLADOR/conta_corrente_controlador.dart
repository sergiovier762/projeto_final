import 'package:flutter/cupertino.dart';

import '../modelos/conta_corrente_modelo.dart';
import '../../globals.dart' as globals;

class ContaCorrenteContraldor{
  TextEditingController textEditingControllerLogin = TextEditingController();
  TextEditingController textEditingControllerSenha = TextEditingController();
  TextEditingController textEditingControllerValorPIX = TextEditingController();
  TextEditingController textEditingControllerChavePIX = TextEditingController();

  TextEditingController textEditingControllerDeposito = TextEditingController();

  bool login(String usuario, String senha){
    try{
      var conta = globals.contas.firstWhere((conta) => conta.usuario == usuario);
      if(conta.senha == senha){
        print("senha correta");
        globals.contaCorrenteLogada = conta;
        return true;
      }
       print("senha incorreta");
      return false;
    }catch(e){
      print("nao achou ngm");
      return false;
    }
  }
}