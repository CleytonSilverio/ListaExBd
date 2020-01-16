/*EXERCICIO 3*/
SELECT NOME_CLIENTE, SEXO FROM CLIENTE
WHERE SEXO = 'F' OR SEXO = 'M';
/*EXERCICIO 4*/
SELECT NUM_PEDIDO, COD_PRODUTO, QUANTIDADE FROM ITEM_PEDIDO
WHERE QUANTIDADE = 35;
/*EXERCICIO 5*/
SELECT NOME_CLIENTE,UF FROM CLIENTE
WHERE CIDADE='NITEROI';
/*EXERCICIO 6*/
SELECT DESCRICAO, VALOR_UNITARIO, UNIDADE FROM PRODUTO
WHERE UNIDADE='M' AND VALOR_UNITARIO <1.05;
/*EXERCICIO 7*/
SELECT * FROM CLIENTE
WHERE CIDADE = 'SAO PAULO' OR CEP BETWEEN '30077000' AND '30079000';
/*EXERCICIO 8*/
SELECT * FROM PEDIDO
WHERE PRAZO_ENTREGA <>15;
/*EXERCICIO 9*/
SELECT * FROM PRODUTO
WHERE VALOR_UNITARIO BETWEEN '0.32' AND '2.00';
/*EXERCICIO 10*/
SELECT * FROM PRODUTO
WHERE DESCRICAO LIKE 'Q%';
/*EXERCICIO 11*/
SELECT * FROM VENDEDOR
WHERE NOME_VENDEDOR NOT LIKE 'JO%';
/*EXERCICIO 12*/
SELECT * FROM VENDEDOR
WHERE FAIXA_COMISSAO IN ('A' ,'B');
/*EXERCICIO 12A*/
SELECT * FROM VENDEDOR
WHERE FAIXA_COMISSAO IN('A','B') AND SEXO = 'F'
/*EXERCICIO 13*/
SELECT * FROM CLIENTE
WHERE INSCR_ESTADUAL IS NULL;
/*EXERCICIO 14*/
SELECT NOME_VENDEDOR, SALARIO_FIXO FROM VENDEDOR
ORDER BY NOME_VENDEDOR ASC;
/*exercicio 15*/
SELECT NOME_CLIENTE, CIDADE, UF FROM CLIENTE
ORDER BY UF DESC, CIDADE DESC;
/*EXERCICIO 15 A*/
SELECT NOME_VENDEDOR, SALARIO_FIXO, FAIXA_COMISSAO, SEXO FROM VENDEDOR
WHERE SEXO = 'M' ORDER BY FAIXA_COMISSAO, FAIXA_COMISSAO ASC;
/*EXERCICIO 16*/
SELECT UNIDADE, DESCRICAO, VALOR_UNITARIO FROM PRODUTO
WHERE UNIDADE = 'M' ORDER BY VALOR_UNITARIO ASC;
/*EXERCICIO 17*/
SELECT *, (SALARIO_FIXO + (SALARIO_FIXO * 0.75) + 120.00) AS SALARIO_REAJUSTADO FROM VENDEDOR
WHERE FAIXA_COMISSAO = 'C';
/*EXERCICIO 18*/


/*EXERCICIO 19*/
SELECT SUM(QUANTIDADE) AS TOTAL FROM item_pedido
WHERE cod_produto = 78;

SELECT PRODUTO.cod_produto, produto.descricao, SUM(ITEM_PEDIDO.QUANTIDADE) AS TOTAL
FROM item_pedido
INNER JOIN PRODUTO
ON produto.cod_produto= item_pedido.cod_produto
GROUP BY produto.cod_produto, produto.descricao
ORDER BY 2;

/*exercicio 20*/

SELECT AVG(SALARIO_FIXO) FROM vendedor;

/*EXERCICIO 21*/
SELECT COUNT(*) FROM vendedor WHERE salario_fixo > 2500;

/*EXERCICIO 22*/
SELECT DISTINCT UNIDADE FROM produto ORDER BY 1;

/*EXERCICIO 23*/
SELECT NUM_PEDIDO, SUM(QUANTIDADE) QUANTIDADE_PRODUTOS FROM item_pedido GROUP BY num_pedido ORDER BY num_pedido;

/*EXERCICIO 24*/
SELECT NUM_PEDIDO, SUM(QUANTIDADE) QUANTIDADE_PRODUTOS FROM item_pedido GROUP BY num_pedido HAVING SUM (QUANTIDADE);

/*EXERCICIO 25*/
SELECT CLIENTE.cod_cliente, cliente.nome_cliente, PEDIDO.num_pedido FROM cliente INNER JOIN pedido ON cliente.cod_cliente = pedido.cod_cliente
ORDER BY 1, 3;

/*EXERCICIO 26*/
SELECT DISTINCT cliente.nome_cliente,pedido.cod_cliente FROM CLIENTE INNER JOIN PEDIDO ON cliente.cod_cliente = pedido.cod_cliente
WHERE CLIENTE.uf = 'SP' OR CLIENTE.uf = 'RJ' AND pedido.prazo_entrega>15 ORDER BY 2 ;

/*EXERCICIO 27*/
SELECT cliente.nome_cliente, pedido.prazo_entrega FROM CLIENTE INNER JOIN PEDIDO ON cliente.cod_cliente = pedido.cod_cliente
ORDER BY 2 DESC;

/*EXERCICIO 28*/
SELECT DISTINCT VENDEDOR.NOME_VENDEDOR, pedido.prazo_entrega, vendedor.salario_fixo, VENDEDOR.cod_vendedor FROM VENDEDOR INNER JOIN PEDIDO ON VENDEDOR.COD_VENDEDOR = PEDIDO.COD_VENDEDOR
WHERE VENDEDOR.SALARIO_FIXO>=1000 AND PEDIDO.PRAZO_ENTREGA>15 ORDER BY 1;

/*EXERCICIO 29*/
SELECT produto.descricao, cliente.cidade, pedido.prazo_entrega FROM cliente 
INNER JOIN pedido ON cliente.cod_cliente = pedido.cod_cliente
INNER JOIN item_pedido ON item_pedido.num_pedido = pedido.num_pedido
INNER JOIN produto ON produto.cod_produto = item_pedido.cod_produto
WHERE produto.descricao = 'QUEIJO' AND cliente.cidade = 'RIO DE JANEIRO' AND pedido.prazo_entrega>15;

/*EXERCICIO 30*/
SELECT vendedor.nome_vendedor, produto.descricao, item_pedido.quantidade
FROM vendedor INNER JOIN pedido ON vendedor.cod_vendedor = pedido.cod_vendedor
INNER JOIN item_pedido ON item_pedido.num_pedido = pedido.num_pedido
INNER JOIN produto ON PRODUTO.cod_produto = item_pedido.cod_produto
WHERE produto.descricao = 'CHOCOLATE' AND item_pedido.quantidade>10;

/*EXERCICIO 31*/
SELECT DISTINCT vendedor.nome_vendedor,vendedor.cod_vendedor , cliente.nome_cliente, cliente.cod_cliente FROM vendedor INNER JOIN pedido ON vendedor.cod_vendedor = pedido.cod_vendedor 
INNER JOIN cliente ON cliente.cod_cliente = pedido.cod_cliente WHERE vendedor.nome_vendedor = 'JOAO';

/*EXERCICIO 32*/
SELECT DISTINCT vendedor.nome_vendedor,vendedor.cod_vendedor , cliente.nome_cliente, cliente.cod_cliente FROM vendedor INNER JOIN pedido ON vendedor.cod_vendedor = pedido.cod_vendedor 
INNER JOIN cliente ON cliente.cod_cliente = pedido.cod_cliente WHERE vendedor.nome_vendedor = 'JOAO' AND vendedor.cod_vendedor LIKE 101;

/*EXERCICIO 33*/
SELECT COUNT(DISTINCT pedido.cod_cliente) FROM cliente INNER JOIN pedido ON cliente.cod_cliente = pedido.cod_cliente
INNER JOIN vendedor ON VENDEDOR.cod_vendedor = pedido.cod_vendedor
WHERE vendedor.cod_vendedor LIKE 11 AND (cliente.cidade = 'RIO DE JANEIRO' OR cliente.cidade = 'NITERI');
/*EXERCICIO 34*/
SELECT DISTINCT PRODUTO.descricao, PRODUTO.valor_unitario,(produto.valor_unitario * 0.85) AS VALOR_DESCONTO FROM item_pedido LEFT JOIN PRODUTO ON PRODUTO.cod_produto = item_pedido.cod_produto
LEFT JOIN PEDIDO ON item_pedido.num_pedido = pedido.num_pedido;
/*EXERCICIO 35*/
SELECT VENDEDOR.nome_vendedor, vendedor.salario_fixo FROM vendedor WHERE VENDEDOR.salario_fixo < (SELECT AVG(SALARIO_FIXO) FROM VENDEDOR);
/*EXERCICIO 36*/
SELECT CLIENTE.nome_cliente, cliente.sexo FROM CLIENTE WHERE CLIENTE.cod_cliente IN(SELECT cod_cliente FROM PEDDO WHERE YEAR(PEDIDO.DATAPEDIDO) = 2015 AND CLIENTE.sexo = 'F';
/*EXERCICIO 37*/

/*EXERCICIO 38*/
SELECT PEDIDO.num_pedido, PEDIDO.datapedido FROM PEDIDO INNER JOIN CLIENTE ON PEDIDO.cod_cliente = CLIENTE.cod_cliente INNER JOIN VENDEDOR ON PEDIDO.cod_vendedor = VENDEDOR.cod_vendedor INNER JOIN item_pedido ON PEDIDO.num_pedido= item_pedido.num_pedido;

/*EXERCDICIO 39*/
SELECT COUNT(pedido.num_pedido), pedido.cod_cliente, cliente.nome_cliente FROM pedido INNER JOIN cliente ON CLIENTE.cod_cliente = pedido.cod_cliente
GROUP BY PEDIDO.cod_cliente, cliente.nome_cliente HAVING COUNT(PEDIDO.NUM_PEDIDO)>3;
/*EXERCICIO 40*/
SELECT PEDIDO.num_pedido, SUM(produto.valor_unitario * item_pedido.quantidade) AS VALOR 
FROM pedido INNER JOIN item_pedido ON item_pedido.num_pedido = pedido.num_pedido INNER JOIN produto ON produto.cod_produto = item_pedido.cod_produto
GROUP BY pedido.num_pedido
HAVING SUM(produto.valor_unitario * item_pedido.quantidade)>100;
