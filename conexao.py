import pymysql
conexao = pymysql.connect(db ='aula0911v1', user ='aluno', passwd='aluno')
cursor = conexao.cursor()

cod = input('Digite o cod do produto\n')
nome = input('Digite o nome do produto\n')

cursor.execute("insert into Produto (cod_prod, nome) values(%s,%s)", (cod,nome))
conexao.commit()
conexao.close()
