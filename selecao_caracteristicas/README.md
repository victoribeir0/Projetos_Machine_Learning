## Uma breve introdução sobre Seleção de Características

### Introdução
Talvez você já tenha ouvido falar em seleção de características, seleção de variáveis ou ainda seleção de features, todos esses termos referem-se à técnicas bastante utilizadas em aprendizado de máquina, sendo responsáveis por determinar quais características são mais importantes para um modelo de classificação. 

Essas técnicas são muito úteis quando existem muitas características sendo consideradas, podendo existir redundância entre elas ou características pouco relevantes. Em imagens ou textos, o número de variáveis costumam ser muito altos, pois cada pixel na imagem ou cada palavra no texto é considerado como uma variável. Dessa forma, alguma técnica de seleção de característica costuma ser aplicada.

Antes de mergulharmos na seleção de características, alguns aspectos precisam ser brevemente esclarecidos, especialmente os termos “características” e “modelos de classificação”.

### O que são características?
Podemos entender as características como variáveis que estamos levando em consideração para classificar algo. Vamos usar um exemplo do cotidiano, como você consegue reconhecer um carro? Como você consegue diferenciar um carro de uma motocicleta? Todas essas tarefas podem parecer simples para nós, e a explicação mais natural para isso é que somos capazes de observar as características dos objetos e classificá-los baseado nessas características, ou seja, são essas características que permitem que os objetos sejam de fato classificados.

Pode parecer muito fácil para nós classificar objetos entre carro ou moto, certo? Mas não é tão fácil assim para o computador fazer isso, por isso você precisa dar uma mãozinha fornecendo as características mais relevantes. Imagine agora que você precisa elaborar um sistema que identifique automaticamente se existe um carro ou uma moto, a partir de uma imagem recebida, o que você faz? Quais características utilizar? Como sabemos que as características escolhidas são realmente úteis? Podem surgir muitas perguntas desse simples experimento.

Para resolver esse pequeno problema, devemos levar em consideração as principais características presentes em cada uma das classes, que no nosso exemplo é carro e moto, podemos utilizar, por exemplo, o número de rodas e faróis ou o tamanho relativo do objeto na imagem. Não entraremos nos detalhes de como essas características são extraídas da imagem (isso é assunto para um outro artigo!)

### O que são modelos de classificação?
Imagine que você já conseguiu definir as características que serão extraídas das imagens, o que pode ser feito com essas informações? É nesse momento que utilizamos os modelos de classificação. Como o nome já diz, esses modelos são responsáveis pela classificação de algo. No nosso pequeno exemplo, o modelo irá classificar entre carro e moto, utilizando as características que foram definidas como entrada. Em outras palavras, enviamos todas as características que conseguimos extrair da imagem e pedimos que o modelo nos diga se existe um carro ou uma moto na imagem. 

Existem diversas técnicas capazes de fazer isso, entre as mais conhecidas estão as Redes Neurais Artificiais, k-NN (k-Vizinhos mais próximos) e Árvores de Decisão, cada uma delas com suas particularidades. Esses modelos só são capazes de classificar algo após um treinamento adequado, é nesse treino que os parâmetros do modelo são otimizados. Podemos entender otimização como a determinação de um conjunto de parâmetros do modelo que levam ao menor erro de classificação, em outras palavras é como se o modelo estivesse aprendendo algo novo. 

### Seleção de características
Agora que já sabemos algumas coisas importantes, podemos finalmente falar sobre seleção de características. O objetivo dessa seleção é determinar o melhor conjunto de características a serem utilizadas. Voltando para nosso pequeno exemplo do carro e moto, será que a cor do objeto é importante? Podemos dizer que não, pois carros e motos podem ter a mesma cor, então a característica cor não iria ajudar na etapa de classificação, na verdade ela iria atrapalhar e faz mais sentido removê-la. 

Isso vale para qualquer outro tipo de problema, existem características que não ajudam no processo de classificação e precisamos identificá-las e removê-las. Infelizmente, nem sempre é simples identificar as características irrelevantes, na maioria dos problemas reais precisamos observar com cuidado o efeito de cada característica para tomar alguma decisão. Imagine que você extraiu 30 características das imagens do exemplo de carro e moto, como faremos para saber quais dessas características realmente estão ajudando na classificação?

Para fazer isso, podemos usar as técnicas de seleção de características, essas metodologias irão nos ajudar determinando o nível de importância para cada característica. A seguir veremos algumas das técnicas mais usadas para isso:
Seleção baseada em correlação;
Seleção baseada em variância;
Seleção sequencial.

### Seleção baseada em correlação
Esse método funciona medindo o nível de correlação entre variáveis. A correlação é uma medida estatística que varia entre -1 e 1, em que 1 indica uma forte correlação positiva, -1 indica forte correlação negativa e 0 representa a falta de correlação entre as variáveis. Caso a correlação entre duas variáveis seja muito forte, elas estão explicando a mesma coisa, e somente uma delas é necessária para o modelo. Dessa forma, podemos remover características que possuem alta correlação com outras.

### Seleção baseada em variância
Esta técnica também tem seu funcionamento baseado em uma medida estatística, nesse caso, a variância. A variância é uma medida de dispersão dos dados, indica o quão distante as amostras estão da média. Caso uma variável apresente variância muito baixa, significa que ela possui valores que variam pouco entre as diferentes classes, um exemplo disso é utilizar a variável cor da roda para classificar entre carro e moto, pois a cor da roda vai ser sempre igual, e portanto vai apresentar uma variância muito baixa entre as amostras. 

Variáveis com baixa variância podem ser removidas seguindo algum critério definido pelo usuário, como um limite. Sendo assim, características com variâncias menores que o limite podem ser removidas.

### Seleção sequencial
Diferente dos outros métodos, na seleção sequencial o resultado obtido no modelo de classificação é usado para definir quais variáveis serão usadas. Nessa técnica, em cada iteração, um conjunto de variáveis é selecionado e utilizado para a classificação, o conjunto que obtiver o menor erro é mantido. Essa técnica pode ficar computacionalmente muito complexa de acordo com o número de variáveis a serem analisadas, quanto maior o número de variáveis, maior é o tempo para chegar em uma solução.

### Outras técnicas
Existem diversas outras metodologias que ajudam a selecionar as melhores variáveis a serem usadas, a biblioteca scikit-learn possui um conjunto de funções capazes de lidar com esse problema, além de uma documentação bastante rica Essas funções podem ser encontradas em: Feature selection — scikit-learn.

### Aplicação usando o Python
Uma simples aplicação usando o Python foi elaborada, usando diferentes conjuntos de dados e diferentes técnicas de seleção de características, incluindo a seleção baseada em variância e a seleção sequencial. Link para o arquivo no Google Colab.
