--Aula 1 - Group BY
select count(*), setor_id from funcionarios group by setor_id;
/*
SQL> select count(*), setor_id from funcionarios group by setor_id;

  COUNT(*)   SETOR_ID
---------- ----------
         5          1
         5          2
         4          3

SQL> 
*/

select count(*) as Qtd_Funcionarios, setor_id as setor from funcionarios group by setor_id; --Não pode colocar nome de apelido como parametros ao Group BY, diferentemente do Order By


select salario, count(*), setor_id from funcionarios group by setor_id, salario;
/*
SQL> select salario, count(*), setor_id from funcionarios group by setor_id, salario;

   SALARIO   COUNT(*)   SETOR_ID
---------- ---------- ----------
      2000          1          2
      1800          1          2
      4200          1          1
      2600          1          1
      5300          1          2
      2100          1          3
      2400          1          3
      3000          1          1
      2200          2          2
      2200          1          3
      6200          1          1

   SALARIO   COUNT(*)   SETOR_ID
---------- ---------- ----------
      1500          1          1
      3450          1          3

13 rows selected.

SQL> 
*/

select salario, count(*), setor_id from funcionarios group by setor_id, salario order by 1;
/*
SQL> select salario, count(*), setor_id from funcionarios group by setor_id, salario order by 1;

   SALARIO   COUNT(*)   SETOR_ID
---------- ---------- ----------
      1500          1          1
      1800          1          2
      2000          1          2
      2100          1          3
      2200          2          2
      2200          1          3
      2400          1          3
      2600          1          1
      3000          1          1
      3450          1          3
      4200          1          1

   SALARIO   COUNT(*)   SETOR_ID
---------- ---------- ----------
      5300          1          2
      6200          1          1

13 rows selected.
*/
