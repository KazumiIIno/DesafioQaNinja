import psycopg2
from logging import info

class DeloreanLibray():

    #um novo método que vai fazer a conexão com o banco de dados
    def connect(self):
         #abrir uma conexão com o banco de dados
            return psycopg2.connect(
            #passando as propriedades do banco de dados
            #comecando pelo servidor
            host ='ec2-18-210-191-5.compute-1.amazonaws.com',
            #nome do banco de dados
            database='da850uvaccpkih',
            #usuario que tem acesso ao banco de dados
            user='ooihvpvrpquovm',
            #senha através da propriedade password
            password='124c066ebb0c55914333d95ea547d8e95452ed4c6d16c80099727173d6afe20e'
        )

    #No Robot no Robot ele vira uma keyword automagicamente. 
    # Essa keyword vai ter o seguinte nome: Remove Student          email@desejado.com.br 

    def remove_student(self, email):

        #criar uma variável chamada query
        query = "delete from students where email = '{}'".format(email)
        #o que o Python vai fazer? ele vai trocar o valor das chaves pelo email que vou receber como argumento desse método.
        #montando uma querry para deletar exatamente o aluno do email desejado. Pegar essa variável query e colocar dentro 
        # do execute que está na linha 36
        info(query)

        #abrir uma conexão com o banco de dados
        conn = self.connect()

        #chamar a variável conn
        #para eu poder executar uma query
        cur = conn.cursor()
        #chamar o cur
        #execute para executar uma query
        cur.execute(query)
        #uma vez executada a query tenho que fazer um commit para efetivar essa alteração.
        #entao pegar a conexao com o banco 
        conn.commit()
        #e por fim fechar a conexão com o banco de dados
        conn.close()


    def remove_student_by_name(self, name):
        #criar uma variável chamada query
        query = "delete from students where name LIKE '%{}%'".format(name)
        #o que o Python vai fazer? ele vai trocar o valor das chaves pelo email que vou receber como argumento desse método.
        #montando uma querry para deletar exatamente o aluno do email desejado. Pegar essa variável query e colocar dentro 
        # do execute que está na linha 36
        info(query)

        #abrir uma conexão com o banco de dados
        conn = self.connect()

        #chamar a variável conn
        #para eu poder executar uma query
        cur = conn.cursor()
        #chamar o cur
        #execute para executar uma query
        cur.execute(query)
        #uma vez executada a query tenho que fazer um commit para efetivar essa alteração.
        #entao pegar a conexao com o banco 
        conn.commit()
        #e por fim fechar a conexão com o banco de dados
        conn.close()
    
    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}','{}',{},{},{}, NOW(), NOW());"
                .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall']))
        
        info(query)

        #abrir uma conexão com o banco de dados
        conn = self.connect()

        #chamar a variável conn
        #para eu poder executar uma query
        cur = conn.cursor()
        #chamar o cur
        #execute para executar uma query
        cur.execute(query)
        #uma vez executada a query tenho que fazer um commit para efetivar essa alteração.
        #entao pegar a conexao com o banco 
        conn.commit()
        #e por fim fechar a conexão com o banco de dados
        conn.close()

    def insert_plan(self, plan):

        self.remove_plan(plan['title'])

        query = ("insert into plans (title, price, duration, created_at, updated_at)"
                "values('{}','{}',{}, NOW(), NOW());"
                .format(plan['title'], plan['price'], plan['duration']))
        
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_plan_by_title(self, title):
        query = "delete from plans where title LIKE '%{}%'".format(title)

        info(query)
        conn = self.connect()
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_plan(self, title):
        query = "delete from plans where title = '{}'".format(title)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()