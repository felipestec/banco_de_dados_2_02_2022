1) Suponha que tenha sido identificado que uma tabela, cujo nome é disciplinas, 
não apresentava nenhum índice criado que estivesse associado ao campo id_disciplinas. 
Nessa situação, o comando abaixo permite a criação desse índice com o nome idx_id_curso.

CREATE INDEX IN disciplinas ON idx_id_curso
(id_disciplina).


a) ( ) certo
b) (x) errado


2) O que são índices clusterizados?

Os índices clusterizados armazenam as linhas de dados
da tabela ou exibição com base em seus valores de chave.
Pode haver apenas um índice clusterizado por tabela,
pois as linhas de dados podem ser classificadas somente 
em uma única ordem.
Os índices clusterizados ordenam fisicamente tanto as linhas
da tabela quanto os próprios índices e mantêm os mesmos
próximos uns aos outros;

3) O que são índices não-clusterizados?

Os índices não clusterizados têm uma estrutura distinta das 
linhas de dados. O índice contém os valores de chave de índice 
não clusterizado e cada entrada de valor de chave tem um ponteiro
para a linha de dados que contém o valor de chave.
Os não-clusterizados ordenam somente o índice em si, e não as linhas 
(que são salvas sempre de forma aleatória no disco).