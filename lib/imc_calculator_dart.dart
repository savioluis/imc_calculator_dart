import 'package:imc_calculator_dart/classes/pessoa.dart';
import 'package:imc_calculator_dart/exceptions/altura_invalida_exception.dart';
import 'package:imc_calculator_dart/exceptions/nome_invalido_exception.dart';
import 'package:imc_calculator_dart/exceptions/peso_invalido_exception.dart';
import 'package:imc_calculator_dart/utils/console_utils.dart';
import 'package:imc_calculator_dart/utils/imc_utils.dart';

void execute() {
  print("Calculadora de IMC (Dart Console)");
  String nome;
  double? peso;
  double? altura;

  do {
    nome = ConsoleUtils.lerStringComTexto("Digite o nome da pessoa: ").trim();
    print(nome);
    try {
      if (nome == "") {
        throw NomeInvalidoException();
      }
    } catch (e) {
      print(NomeInvalidoException().message);
      print("Digite um nome valido");
    }
  } while (nome == "");

  do {
    peso = ConsoleUtils.lerDoubleComTexto("Digite o peso de $nome: ");
    try {
      if (peso == null || peso < 0.0) {
        throw PesoInvalidoException();
      }
    } catch (e) {
      print(PesoInvalidoException().message);
      print("Digite um peso valido");
    }
  } while (peso == null || peso < 0.0);

  do {
    altura = ConsoleUtils.lerDoubleComTexto("Digite a altura de $nome: ");
    try {
      if (altura == null || altura <= 0.0) {
        throw AlturaInvalidaException();
      }
    } catch (e) {
      print(AlturaInvalidaException().message);
      print("Digite uma altura valida");
    }
  } while (altura == null || altura <= 0.0);

  Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
  double imc = ImcUtils.calcularIMC(peso, altura);
  String classificacaoImc = ImcUtils.resultadoIMC(imc);

  print("Resultado do IMC para ${pessoa.nome}: ${imc.toStringAsFixed(2)} / $classificacaoImc");
}
