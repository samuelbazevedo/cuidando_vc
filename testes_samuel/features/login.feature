
# language: pt
Funcionalidade: Login de Usuário


Contexto:
    Dado I am on the homepage
    Quando I click on the "Entrar" link in the menu
    E a login form appears


  # Cenário 1: Usuário tenta fazer login com credenciais válidas
  Cenário: Login com conta válida
    E I enter a username "Anamara" and password "123456@@"
    E I click the "Entrar" link
    Então I should see my user profile

 # Cenário 2: Usuário tenta fazer login com conta inexistente
  Cenário: Login com conta inexistente
    E I enter a username "Perereria" and password "senha_teste"
    E I click the "Entrar" link
    Então I should see an invalid username message "O nome de usuário parece não registrado..."

 # Cenário 3: Usuário tenta fazer login com senha inválida
  Cenário: Login com senha inválida
    E I enter a username "Anamara" and password "senha_incorreta"
    E I click the "Entrar" link
    Então I should see an invalid password message "Senha incorreta. Tente novamente."

# Cenário 4: Usuário recorrer a recuperar senha com email correto 
 Cenário: Recuperação com email certo 
    Quando I click on the "esqueceu a senha?" link
    Então I should see a field to enter my email
    Quando I enter my username "papabem" and email "pauloalves@usp.br"
    #Then I click on close up icon

    
     



# Cenário 5: Usuário recorrer a recuperar senha com email incorreto



#casos ainda a serem implementados
#caso de uso que a pessoa acessa o login por engano e decide sair e aperta no 
#caso de usuario preecnhe apenas nome de usauroo certo tanto no login como recuperação de senha 
#caso de usuario preecnhe apenas senha certo tanto no login como recuperação de senha
