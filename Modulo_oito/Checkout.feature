#language: pt

Funcionalidade: Checkout
    Como cliente da EBAC-SHOP
    Quero fazer concluir meu cadastro   
    Para finalizar minha compra

Contexto:
    Dado que estou na tela de detalhes de faturamento

Cenário: Cadastro com campos obrigatórios
    Quando preencho os campos obrigatórios:
        | nome      | sobrenome      | pais_obrigatorio | endereco_rua_e_numero | cidade        | cep        | telefone      | endereco_emaol              |
        | "Gabriel" | "Zago Cecchin" | "Brasil"         | "Avenida Brasil 89"   | "Passo Fundo" | "99910035" | "11999118877" | "gabrielzcecchin@gmail.com" |
    Então cadastro é concluído com sucesso

Cenário: Cadastro com campos obrigatórios e opcionais
    Quando preencho os campos obrigatórios:
        | nome      | sobrenome      | nome_empresa | pais_obrigatorio | endereco_rua_e_numero | endereco_opcional | cidade        | pais_opcional | cep        | telefone      | endereco_emaol              |
        | "Gabriel" | "Zago Cecchin" | "EBAC"       |"Brasil"          | "Avenida Brasil 89"   | "Apartamento 85"  | "Passo Fundo" | "Brasil"      | "99910035" | "11999118877" | "gabrielzcecchin@gmail.com" |
    Então cadastro é concluído com sucesso

Esquema do Cenário: Não permitir cadastro com e-mail no formato inválido
    Quando preencho com o e-mail <email_invalido>
    E preencho demais campos com valores válidos
    E prossigo cadastro
    Então é e exibida mensagem "E-mail de faturamento inválido"
    E campo de e-mail é demarcado em vermelho

    Exemplos:
        | email_invalido |
        | gabriel@gmail  |
        | gabriel@com    |
        | @gmail.com     |
        | gabriel        |

Esquema do Cenário: Não permitir cadastro com campos obrigatórios vazios
    Quando preencho os campos obrigatórios:
        | nome      | sobrenome      | pais_obrigatorio | endereco_rua_e_numero | cidade        | cep        | telefone      | endereco_emaol              |
        | ""        | "Zago Cecchin" | "Brasil"         | "Avenida Brasil 89"   | "Passo Fundo" | "99910035" | "11999118877" | "gabrielzcecchin@gmail.com" |
        | "Gabriel" | ""             | "Brasil"         | "Avenida Brasil 89"   | "Passo Fundo" | "99910035" | "11999118877" | "gabrielzcecchin@gmail.com" |
        | "Gabriel" | "Zago Cecchin" | "Brasil"         | ""                    | "Passo Fundo" | "99910035" | "11999118877" | "gabrielzcecchin@gmail.com" |
        | "Gabriel" | "Zago Cecchin" | "Brasil"         | "Avenida Brasil 89"   | ""            | "99910035" | "11999118877" | "gabrielzcecchin@gmail.com" |
        | "Gabriel" | "Zago Cecchin" | "Brasil"         | "Avenida Brasil 89"   | "Passo Fundo" | ""         | "11999118877" | "gabrielzcecchin@gmail.com" |
        | "Gabriel" | "Zago Cecchin" | "Brasil"         | "Avenida Brasil 89"   | "Passo Fundo" | "99910035" | ""            | "gabrielzcecchin@gmail.com" |
        | "Gabriel" | "Zago Cecchin" | "Brasil"         | "Avenida Brasil 89"   | "Passo Fundo" | "99910035" | "11999118877" | ""                          |
    Então cadastro não é concluído
    E é exibida a mensagem <mensagem_campo_obrigatorio>
    E o campo <campo_vermelho> é demarcado em vermelho

    Exemplos: 
        | mensagem_campo_obrigatorio                                                        | campo_vermelho        |
        | "O campo "Nome" do endereço de faturamento é um campo obrigatório."               | "Nome*"               |
        | "O campo "Sobrenome" do endereço de faturamento é um campo obrigatório."          | "Sobrenome*"          |
        | "O campo "Endereço" do endereço de faturamento é um campo obrigatório."           | "Endereço*"           |
        | "O campo "Cidade" do endereço de faturamento é um campo obrigatório."             | "Cidade*"             |
        | "O campo "CEP" do endereço de faturamento é um campo obrigatório."                | "CEP*"                |
        | "O campo "Telefone" do endereço de faturamento é um campo obrigatório."           | "Telefone*"           |
        | "O campo "Endereço de e-mail" do endereço de faturamento é um campo obrigatório." | "Endereço de e-mail*" |