import 'package:imc_calculator_dart/constants/imc_classificacoes_constants.dart';
import 'package:imc_calculator_dart/exceptions/altura_invalida_exception.dart';
import 'package:imc_calculator_dart/exceptions/peso_invalido_exception.dart';
import 'package:imc_calculator_dart/utils/imc_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Testes de Valores de IMC', () {
    test('Teste 1 de IMC', () {
      expect(() => ImcUtils.calcularIMC(64, 0),
          throwsA(TypeMatcher<AlturaInvalidaException>()));
    });

    test('Teste 2 de IMC', () {
      expect(ImcUtils.calcularIMC(78, 1.75), 25.46938775510204);
    });

    test('Teste 3 de IMC', () {
      expect(() => ImcUtils.calcularIMC(-1, 1.80),
          throwsA(TypeMatcher<PesoInvalidoException>()));
    });

    test('Teste 4 de IMC', () {
      expect(ImcUtils.calcularIMC(80, 1.80), greaterThan(20));
    });

    test('Teste 5 de IMC', () {
      expect(ImcUtils.calcularIMC(80, 1.80), lessThan(25));
    });

    test('Teste 6 de IMC', () {
      expect(ImcUtils.calcularIMC(0, 1), greaterThanOrEqualTo(0));
    });
  });

  group('Teste de Classificacoes de IMC', () {
    test('Teste 1 de Classificacao de IMC', () {
      expect(ImcUtils.resultadoIMC(20), ImcClassificacoesConstants.saudavel);
    });
    test('Teste 2 de Classificacao de IMC', () {
      expect(
          ImcUtils.resultadoIMC(39), ImcClassificacoesConstants.obesidadeGrau2);
    });
    test('Teste 3 de Classificacao de IMC', () {
      expect(
          ImcUtils.resultadoIMC(40), ImcClassificacoesConstants.obesidadeGrau3);
    });
    test('Teste 4 de Classificacao de IMC', () {
      expect(ImcUtils.resultadoIMC(double.nan), "Desconhecido");
    });
  });
}
