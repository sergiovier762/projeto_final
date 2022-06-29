import 'package:flutter/material.dart';
import 'package:trabalho_final/conta_corrente/CONTROLADOR/conta_corrente_controlador.dart';
import 'package:trabalho_final/conta_corrente/VIEW/conta_corrente_visao.dart';

class LoginVisao extends StatefulWidget {
  const LoginVisao({ Key? key }) : super(key: key);

  @override
  State<LoginVisao> createState() => _LoginVisaoState();
}

class _LoginVisaoState extends State<LoginVisao> {
  ContaCorrenteContraldor contaCorrenteContraldor = ContaCorrenteContraldor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: contaCorrenteContraldor.textEditingControllerLogin,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Login",
            ),
          ),
          TextField(
            controller: contaCorrenteContraldor.textEditingControllerSenha,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Senha",
            ),
            obscureText: true,
          ),
          GestureDetector(
            onTap: (){
              var login = contaCorrenteContraldor.login(contaCorrenteContraldor.textEditingControllerLogin.text, contaCorrenteContraldor.textEditingControllerSenha.text);
              if(login){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContaCorrenteVisao()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Container(color: Colors.red,)),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 100,
              color: Colors.pink,
              child: Text("Login", textAlign: TextAlign.center,),
            ),
          )
      ],),
    );
  }
}