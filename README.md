# Introdução as Redes Neurais

Neste artigo, descobriremos alguns aspectos básicos sobre as Redes Neurais Artificias (RNA), essas se tornaram bastante populares ao longo dos últimos anos, devido as suas diversas aplicações, principalmente na solução de problemas envolvendo classificação e regressão. 

De forma geral, as RNA têm como objetivo estimar uma saída, dada uma entrada. Por exemplo, caso você dê uma figura de um gato, a rede neural deve estimar que é um gato, caso você coloque um cachorro, a rede neural deve dizer que é um cachorro. A rede é capaz de fazer isso após ter aprendido os padrões de gato e cachorro, isso acontece pois a rede conseguiu otimizar seus parâmetros a fim de obter o menor erro de classificação. Na Figura a seguir é ilustrado o processo de previsão do animal, em gato ou cachorro. Note que w1 e w2 correspondem aos parâmetros que são otimizados pela rede.

![alt text](https://github.com/victoribeir0/redes_neurais_python/blob/main/rnn_victor_git.jpg?raw=true)

Observem a estrutura da rede neural, existem três camadas: entrada, oculta e saída. Em outras redes pode haver mais de uma camada oculta. Cada círculo representa um elemento, esses elementos podem ou não ser conectados a todos os outros elementos da camada seguinte.

# Como a rede aprende?
A rede neural consegue estimar se tem um gato ou cachorro na figura após muito treinamento. Esse treinamento é feito através de exemplos, são dados diversas figuras de gato e cachorro. No começo do treinamento, a rede irá errar muito, é justamente esse erro que é usado para fazer com que a rede aprenda, em outras palavras, as RNA aprendem errando!

Existe um método chamado de retro propagação do erro, conhecido também como backpropagation, essa técnica utiliza o erro para atualizar os pesos da rede neural. Isso é feito aos poucos, a atualização é feita de forma iterativa (repetida) e em passos pequenos. No final do treinamento, a RNA será capaz de estimar corretamente se é um cachorro ou um gato na imagem. Para que o treinamento seja bem feito e que a rede neural seja realmente capaz de apender, alguns fatores precisam ser levados em consideração, como as entradas e funções de ativação.

## Entradas
Os elementos que são colocados como entrada de uma rede neural correspondem a observações feitas sobre alguma coisa, podemos entender isso como características a respeito de algo. Voltando para o exemplo do gato e cachorro, podemos nos perguntar: Quais são as características de um cachorro? e Quais são as características de um gato? Com isso podemos chegar a algumas conclusões: cachorros têm patas maiores do que gatos e as orelhas dos gatos são menores do que as dos cães. São esses atributos a respeito de cada classe (gato e cachorro) que podem ser usados como características. 

Essa explicação pode ser expandida e usada para qualquer tipo de dado, por exemplo, se estivermos interessados em classificar tipos de flores, podemos definir as características de cada flor, como o tamanho da pétala e da sépala. São essas características que são utilizadas como entrada na rede neural e podem facilitar bastante o treinamento. 

## Funções de Ativação
As Funções de Ativação têm um papel importante para as redes neurais, são elas que permitem a não-linearidade da rede, esse termo pode parecer confuso no primeiro momento, mas podemos pensar nisso como uma forma de separar classes não linearmente separáveis. Isso é mostrado na Figura a seguir, em que há duas classes: azul e vermelho, além disso, X_1 e X_2 são as entradas.

![alt text](https://github.com/victoribeir0/redes_neurais_python/blob/main/rnn_victor_git2.jpg?raw=true)

A maioria dos problemas reais são não linearmente separáveis, por isso as funções de ativação não-lineares são tão importantes, elas permitem separar essas classes. Exstem diversas funções, as mais usadas são: Sigmoide, Tangente Hiperbólica e ReLu, cada uma com suas particularidades e aplicações.

Na Figura a seguir, é ilustrada uma RNA com funções de ativação na camada oculta e na saída. Na saída, essas funções de ativação são responsáveis por determinar a classe de alguma entrada. Por exemplo, qual é a saída que desejamos ao colocar a figura de um gato em nossa rede neural? Desejamos que ela diga que é um gato, mas como ela vai nos dizer isso?

![alt text](https://github.com/victoribeir0/redes_neurais_python/blob/main/rnn_victor_git3.jpg?raw=true)

No nosso simples exemplo, uma forma de resolver seria utilizar valores entre 0 e 1 na saída, isso pode ser feito com a Sigmoide ou ReLu. Sendo assim, utilizando uma única saída, quando a saída for 0, é um gato, já quando a saída for 1, é um cachorro. Simples né?

# Implementação em Python
Agora é a hora de colocar a mão na massa! A rede neural pode ser implementada em qualquer linguagem, algumas possuem bibliotecas que já oferecem a rede neural. Na nossa implementação, utilizaremos a linguagem Python e a biblioteca scikit-learn. Além disso, faremos também um exemplo utilizando o banco de dados de flores Iris. O algoritmo está no arquivo 'redes_neurais.ipynb'.
