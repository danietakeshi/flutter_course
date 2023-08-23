# Calculadora de IMC em Dart

Esta é uma aplicação simples em Dart que calcula o Índice de Massa Corporal (IMC) com base nos dados de peso e altura fornecidos pelo usuário. A aplicação utiliza a classe `Pessoa` do pacote `imc_calculator` para criar um objeto que armazena as informações do usuário e, em seguida, calcula o IMC e fornece uma descrição com base no resultado.

Considerando os inputs de:
- Nome: Alberto Roberto
- Peso: 70
- Altura: 1.75

teremos a resposta abaixo:
```sh
Boa tarde Alberto Roberto! Considerando o peso de 70.0 e a altura de 1.75
Você tem um IMC calculado de 22.857142857142858, ou seja, possui a classificação Saudável
```

## Como Usar

Certifique-se de ter o ambiente Dart configurado em sua máquina antes de executar o programa.

1. Clone este repositório para o seu ambiente local.

```sh
git clone https://github.com/seu-usuario/seu-repositorio.git
```

2. Navegue até o diretório do projeto.

```sh
cd nome-do-diretorio
```

3. Execute o programa usando o Dart.

```sh
dart main.dart
```

4. Siga as instruções fornecidas no console. Você será solicitado a digitar seu nome, peso e altura.

5. Após fornecer as informações, o programa calculará o IMC e fornecerá uma classificação correspondente.

## Funções da Calculadora de IMC em Dart

### Função `lerConsoleDouble`

- Solicita um número em formato double ao usuário.
- Garante que o valor inserido seja maior que zero.
- Realiza um loop até obter um valor válido.

### Função `lerConsole`

- Solicita uma linha de entrada ao usuário.
- Verifica e corrige se a linha está vazia.
- Retorna a linha inserida.

### Função `greaterThanZero`

- Verifica se um número é maior que zero.
- Lança uma exceção `FormatException` se o número for inválido.

### Função `calculateIMC`

- Calcula o Índice de Massa Corporal (IMC) com base em peso e altura.
- Utiliza a fórmula IMC = peso / altura^2.

### Função `descriptionIMC`

- Fornece uma descrição com base no valor do IMC.
- Retorna uma string que indica a classificação do IMC.

Claro, aqui estão as descrições dos testes em formato de tópicos:

## Testes para a Calculadora de IMC em Dart

### Bibliotecas de Teste

- Implementados usando a biblioteca de teste `test` do Dart.
- Funções de teste definidas dentro do bloco `main()`.

### Função de Teste `calculateIMC`

- Verifica se `calculateIMC` calcula corretamente o IMC.
- Compara resultado com valor esperado.

### Grupo de Teste `Testa as classificações de IMC`

- Testa se `descriptionIMC` retorna classificações corretas.
- Testes individuais para diferentes valores de IMC.


## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
```

Lembre-se de substituir `seu-usuario` e `seu-repositorio` com suas informações reais de usuário e repositório do GitHub. Certifique-se de também incluir o arquivo `LICENSE` na raiz do seu projeto se você estiver usando a Licença MIT.