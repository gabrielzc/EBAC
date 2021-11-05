#language: pt

Funcionalidade: Configuração de produto
    Como cliente da EBAC-SHOP
    Quero configurar meu produto de acordo com meu tamanho e gosto
    E escolher a quantidade
    Para depois inserir no carrinho

Contexto:
    Dado que estou na tela de detalhe do produto

Cenário: Prosseguir compra após selecionar tamanho, cor e quantidade do produto
    Quando seleciono a cor do produto
    E seleciono o tamanho do produto
    E seleciono a quantidade do produto
    Então o botão [COMPRAR] é habilitado

Esquema do Cenário: Quantidade máxima de produtos por venda
    Quando seleciono a quantidade de <quantidade_produtos> produtos
    Então produtos são adicionados no carrinho

    Exemplos: 
    | quantidade_produtos |
    | 9                   |
    | 10                  |

Cenário: Não permitir compra ao ultrapassar o limite de produtos por venda
    Quando seleciono a quantidade de 11 produtos
    Então produtos não são adicionados no carrinho

Cenário: Limpar informações selecionados do produto
    Quando seleciono as informações do produto:
        | informacoes_produto |
        | cor                 |
        | tamanho             |
        | cor e tamanho       |
    E clico na opção 'Limpar'
    Então as informações selecionadas voltam ao estado inicial