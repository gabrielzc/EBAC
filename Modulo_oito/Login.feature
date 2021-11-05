#language: pt

Funcionalidade: Login
    Como cliente da EBAC-SHOP
    Quero fazer o login (autenticação) na plataforma  
    Para visualizar meus pedidos

Contexto:
    Dado que estou na tela de login

Esquema do Cenário: Login válido
    Quando preencho o campo de usuário/e-mail com <usuario_email>
    E preencho o campo de senha com <senha>
    E clico para logar
    Então login é realizado
    E é exibida a tela de checkout

    Exemplos:
        | usuario_email               | senha       |
        | "gabrielzcecchin"           | "Teste@123" |
        | "gabrielzcecchin@gmail.com" | "Teste@123" |

Esquema do Cenário: Login inválido
    Quando preencho o campo de usuário/e-mail com <usuario_email>
    E preencho o campo de senha com <senha>
    E clico para logar
    Então login não é realizado
    E é exibida a mensagem "Usuário ou senha inválidos"

    Exemplos:
        | usuario_email                | senha            |
        | "usuario_invalido"           | "Teste@123"      |
        | "usuario_invalido@gmail.com" | "Teste@123"      |
        | "gabrielzcecchin@gmail.com"  | "senha_invalida" |