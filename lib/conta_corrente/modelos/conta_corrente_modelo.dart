import 'package:trabalho_final/conta_corrente/modelos/transacao_modelo.dart';
import 'package:collection/collection.dart'; 
import '../../globals.dart' as globals;

class ContaCorrenteModelo{
  String titularDaConta;
  String usuario;
  String senha;
  int id;
  int agencia;
  double saldo;
  String chavepix;
  List<TransacaoModelo> historico;

  ContaCorrenteModelo(this.titularDaConta, this.usuario, this.senha, this.id, this.agencia, this.saldo, this.chavepix, this.historico);

  bool login(String usuario, String senha){
    ContaCorrenteModelo conta = globals.contas.firstWhere((conta) => conta.usuario == usuario);
    if(conta.senha == senha){
      print("deu certo");
      return true;
    } else {
      print("deu errado");
      return false;
    }
  }

  double deposito(double valor){
    if(valor > 0){
      this.saldo = this.saldo + valor;
      return this.saldo;
    }else{
      return -1;
    }
  }
  
  double pix(String chave,double valor){
    ContaCorrenteModelo? val = globals.contas.firstWhereOrNull((element) => element.chavepix == chave);
    if(valor < 0){
      return -1;
    }
    if(val == null){
      return -2;
    }
    return this.saldo = this.saldo - valor;
  }
}