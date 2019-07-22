-- Aula 1
select nome, salario + salario * nvl(pct_comissao, 0) as SalarioFinal from funcionarios order by SalarioFinal; 
--Nvl trata valores NUlo, onde ele recebe o campo a ser tratado e troca o valor por 0 neste exemplo

select nome, salario + salario * nvl2(pct_comissao, pct_comissao * 1, 0) as SalarioFinal from funcionarios order by SalarioFinal;
--nvl2 funcionar como uma condição, se a expressão for null, ele troca por 0, se não, troca por pct_comissao * 1

------------------------------------------------------------------------------------------------------------------------------------
-- Aula 2
select nome, salario, (
    case 
    when salario is null then 800
    when salario is not null then salario + salario * pct_comissao 
    else salario + 100
    end
) as SalarioFinal from funcionarios;

select nome, salario, coalesce(salario + salario * pct_comissao, salario + 100, 800) from funcionarios
--Coalesce tem como objetivo retornar a primeira condição não nula entre seus argumentos 

--Aula 3 - Strings

select ascii('A') as Letra from dual;

select chr(65) as Letra from dual; --COnverte o numero para a letra na tabela ASCII

--Aula 4 - Instr e lenght
Select instr('Tosquinos', 'o') from dual; --Procura um caracter ou string, dentro de uma cadeia de string e retorna a possição onde está
select instr('porra', 'orr') from dual;

Select instr('Tosquinos', 'o', 3) from dual; --Vai procurar a partir da terceira casa a letra o
--Tambem diferencia letra maiuscula de minuscula

select instr('amanda', 'a', 2, 2) from dual; --Quarto parametro busca a segunda ocorrencia a partir do segundo caracter

select instr('amonda', 'a', -1,) from dual; --Busca de tràs pra frente

select instr('amonda', 'a', -1, 2) from dual;

select length('Tosquinos') from dual; --Conta o tamanho da cadeia de string

select length('Tosqui nos') from dual;

--Aula 5

select upper('renan') from dual; --Deixa as letras em maiusculo

select upper(null) from dual;

select lower('RENAN') from dual; --Deixa as letra em minusculo

select lpad(nome, 20, '*') from funcionarios; --Deixa com no maximo 20 caracteres, caso falte preencha com * à esquerda da String


select rpad(nome,20,'*') from funcionarios; --Deixa com no maximo 20 caracteres, caso falte preencha com * à direita da String
select lpad(nome, 2, '*') from funcionarios;

select ltrim('                  Felipe') from dual; --Remove os espaço em branco

select ltrim('                  Felipe', ' F') from dual;

--Aula 6 
select replace('Sr Welinton', 'Sr', 'Senhor') from dual; --Substitui uma string ou conjunto de string por outra string ou cadeia de strring

select replace('Sr Welinton', 'Sr', null) from dual;


select translate('W3l1nt0n', '1340', 'ieao') from dual; --Traduz uma string para outra string

select translate('W3l1nt0n', '1340', 'i') from dual; --Se não tem correspondencia, ele simplesmente corta
SQL> select translate('W3l1nt0n', '1340', 'i') from dual; 
/*
TRANSL
------
Wlintn

SQL>
*/

select translate('R3n4n', '34', null) from dual;
/*
SQL> select translate('R3n4n', '34', null) from dual;

T
-


SQL> 
*/

select substr('Sr Welinton', 3) from dual;
/*
SQL> select substr('Sr Welinton', 3) from dual;

SUBSTR('S
---------/
 Welinton

SQL> 
*/

select substr('PORRAWRJCARALHO', 6, 3) from dual;

--Aula 7
select sign(50) from dual; --retorna o sinal se é positivo ou negativo

select abs(-35) from dual; --retorna o numero absoluto independente do sinal

select round(22/7) from dual; --retorna o numero arredonda
/*
ROUND(22/7)
-----------
          3

SQL> 
*/

select round(22/7, 2) from dual; --Irá trazer duas casas decimais
/*
ROUND(22/7,2)
-------------
         3.14

SQL> 
*/

select round(1235.55, -2) from dual; --Vai arredondar as duas casas antes da virgula
/*

ROUND(1235.55,-2)
-----------------
             1200

SQL> 
*/


select trunc(3.9415) from dual; --Ignora as casas decimais
select trunc(3.9415, 3) from dual; --Ignora as casas decimais


--Aula 8
select ceil(22/7) from dual; --Sempre arredonda pra cima

select floor(22/7) from dual; --Sempre arredonda pra baixo

select sqrt(81) from dual; --Calcula raiz quadrada
/*
  SQRT(81)
----------
         9

SQL> 
*/

select power(2,3) from dual; --2 ao cubo Calculo de potência


select log(2,1024) from dual; --LOgaritmo

select mod(13,5) from dual; --Pega o resto da divisão o floor

select remainder(13,5) from dual; --Pega o resto da divisão e usa o round