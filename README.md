# pdv_mvc

requisitos para a criação do projeto:
1. O operador deve informar o cliente, e os produtos.
2. A classe que representa a tabela de cliente deve ter(código, nome, cidade, uf).
3. A classe que representa a tabela de produtos deve ter(código, descrição, preço de venda).
4. Para informar o produto na tela do pedido de venda, o operador deve informar: código do
produto, quantidade e valor unitário.
5. Conforme o operador insere os produtos e confirma, eles devem ir em uma grade para
visualização.
6. A grade deve apresentar: código do produto, descrição do produto, quantidade, valor unitário e
valor total.
7. Ter a possibilidade de selecionar um item dessa grade e poder editar a quantidade e o valor
unitário.
8. Ter a possibilidade de selecionar um item dessa grade e poder excluir. Deve ser perguntado se o
operador deseja realmente excluir esse registro
9. Exiba um totalizador no rodapé da tela.
10. Ter um botão de salvar o pedido, persistindo os dados nas tabelas pedidos e pedidos itens.
11. A classe que representa a tabela de pedidos deve possuir (Número do Pedido, Data de Emissão,
Código do Cliente, Valor Total).
12. A classe que representa a tabela de itens do pedido deve possuir (incremento automático,
número do pedido, código do produto, quantidade, valor unitário, valor total).
13. Use a transação e trate de possíveis erros.
14. O pedido deve ter um número sequencial crescente.
15. A chave primária da tabela de pedidos deve ser (Número do pedido), não podendo haver
duplicação entre os registros registrados.
16. A chave primária da tabela de itens do pedido deve ser (auto-incremento), pois pode haver
repetição de produtos.
17. Crie os FKs necessários para vincular a tabela de produtos do pedido e a tabela de dados gerais
do pedido.
18. Crie os índices necessários nos dados gerais do pedido e nas tabelas de produtos do pedido.
19. Ter a possibilidade de visualizar pedidos já realizados, por clientes ou geral.
20. Crie um botão na tela do pedido, que deve ficar visível quando o código do cliente estiver em
branco, para cancelar um pedido.
