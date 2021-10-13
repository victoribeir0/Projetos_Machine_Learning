# Introdução as Redes Neurais

Neste artigo, descobriremos alguns aspectos básicos sobre as Redes Neurais Artificias (RNA), essas se tornaram bastante populares ao longo dos últimos anos, devido as suas diversas aplicações, principalmente na solução de problemas envolvendo classificação e regressão. 

De forma geral, as RNA têm como objetivo estimar uma saída, dada uma entrada. Por exemplo, caso você dê uma figura de um gato, a rede neural deve estimar que é um gato, caso você coloque um cachorro, a rede neural deve dizer que é um cachorro. A rede é capaz de fazer isso após ter aprendido os padrões de gato e cachorro, isso acontece pois a rede conseguiu otimizar seus parâmetros a fim de obter o menor erro de classificação. Na Figura a seguir é ilustrado o processo de previsão do animal, em gato ou cachorro. Note que $w1$ e $w2$ correspondem aos parâmetros que são otimizados pela rede.

Observem a estrutura da rede neural, existem três camadas: entrada, oculta e saída. Em outras redes pode haver mais de uma camada oculta. Cada círculo representa um elemento, esses elementos podem ou não ser conectados a todos os outros elementos da camada seguinte.

# Como a rede aprende?
A rede neural consegue estimar se tem um gato ou cachorro na figura após muito treinamento. Esse treinamento é feito através de exemplos, são dados diversas figuras de gato e cachorro. No começo do treinamento, a rede irá errar muito, é justamente esse erro que é usado para fazer com que a rede aprenda, em outras palavras, as RNA aprendem errando!

Existe um método chamado de retro propagação do erro, conhecido também como \textit{backpropagation}, essa técnica utiliza o erro para atualizar os pesos da rede neural. Isso é feito aos poucos, a atualização é feita de forma iterativa (repetida) e em passos pequenos. No final do treinamento, a RNA será capaz de estimar corretamente se é um cachorro ou um gato na imagem. Para que o treinamento seja bem feito e que a rede neural seja realmente capaz de apender, alguns fatores precisam ser levados em consideração, como as entradas e funções de ativação.

## Entradas

