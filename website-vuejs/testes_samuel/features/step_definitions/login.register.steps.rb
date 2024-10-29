Dado('I am on the homepage') do
  visit('/')  # Navega para a homepage
end

Quando('I click on the "Entrar" link in the menu') do
  within('nav.c-navbar.w-full.h-16.flex.items-center.bg-primary-base.fixed') do
    # Aguarda até que o link "Entrar" esteja visível antes de clicar
    expect(page).to have_css('.px-4.mx-1.cursor-pointer.py-2.border.border-white', visible: true, wait: 10)
    find('.px-4.mx-1.cursor-pointer.py-2.border.border-white').click
  end
end

Então('a login form appears') do
  # Verifica se o formulário de login apareceu corretamente
  expect(page).to have_css('form.form.px-6.pb-4.lg\\:px-8.sm\\:pb-6.xl\\:pb-8', wait: 10)
end

Quando('I enter a username {string} and password {string}') do |username, password|
  fill_in 'Nome de usuário', with: username  # Substitua pelo nome correto do campo de usuário
  fill_in 'Senha', with: password  # Substitua pelo nome correto do campo de senha
end

Quando('I click the "Entrar" link') do
  click_button 'Entrar'  # Caso o botão no formulário seja do tipo botão, não link
end

# Cenário 1: Usuário tenta fazer login com conta e senha valida

Then('I should see my user profile') do
 # Verifica se o elemento com a combinação de classes é visível
 expect(page).to have_css('.text-white.bg-transparent.border.border-white.font-medium.rounded.text-sm.w-full.px-2.py-2.text-center.inline-flex.items-center.justify-between')

  # Verifique se o perfil do usuário é exibido corretamente
  click_button('Anamara')
  
 
end


# Cenário 2: Usuário tenta fazer login com conta inexistente

Então('I should see an invalid username message {string}') do |error_message|
  # Verifica se a mensagem de erro é exibida corretamente
  
  expect(page).to have_css('.px-6.pb-4.lg\\:px-8.sm\\:pb-6.xl\\:pb-8.text-sm.text-red-600')
  expect(page).to have_content('nome de usuário parece não registrado...')
end


# Cenário 3: Usuário tenta fazer login com conta inexistente

Então('I should see an invalid password message {string}') do |error_message|
  # Verifica se a mensagem de erro é exibida corretamente
  
  #expect(page).to have_css('.px-6.pb-4.lg\\:px-8.sm\\:pb-6.xl\\:pb-8.text-sm.text-red-600')
  expect(page).to have_content('Senha incorreta. Tente novamente.')
end

# Cenário 4: Usuário recorrer a recuperar senha com email correto 
Quando('I click on the "esqueceu a senha?" link') do 
page.find(:xpath, "//a[contains(@class, 'text-primary-base') and contains(text(), 'Esqueceu a senha?')]").click
end 

Então('I should see a field to enter my email') do
expect(page).to have_xpath("//input[@id='login-form-email' and @type='email']", visible: true)
end

Quando('I enter my username {string} and email {string}') do |username, email|
expect(page).to have_xpath("//input[@id='login-form-email' and @type='email']", visible: true)
fill_in 'Nome de usuário', with: username 
fill_in 'login-form-email', with: email
end

E('I click on the "Solicitar código" button') do
  #click_button('Solicitar código') #deveria funcionar mesmo que o texto esteja dentro de tag spam dentro de button, e como apareec somente nesse caso especifico 
  expect(page).to have_xpath("//button[contains(@class, 'btn') and contains(text(), 'Solicitar código')]")
  page.find(:xpath, "//button[contains(@class, 'btn') and contains(text(), 'Solicitar código')]").click
end

#cenario de register 01
Quando('I click on link "Crie uma conta"')do
page.find(:xpath, "//a[contains(@class, 'text-primary-base') and contains(text(), 'Crie uma conta')]").click
end

Então('I enter a register username {string} and password {string} and email {string} and confirmed_password {string}') do |username, password, email, confirmed_password|
  expect(page).to have_xpath("//input[@id='login-form-email' and @type='email']", visible: true)
  fill_in 'Nome de usuário', with: username 
  fill_in 'Senha', with: password  
  fill_in 'login-form-email', with: email
  fill_in 'Confirmar Senha', with: confirmed_password  
end

E('I click the "Crie uma conta" button') do 
 #verificar se o botao esta visivel 
 expect(page).to have_xpath("//button[contains(@class, 'btn') and not(@disabled)]//span[contains(text(), 'Crie uma conta')]", visible: true)
 page.find(:xpath, "//button[contains(@class, 'btn') and not(@disabled)]//span[contains(text(), 'Crie uma conta')]").click  #analisaar bem esse modelo de busca xpath
end

  
#criado a partir do cenario 2 de register 
Então('I see a message {string}') do |error_message|
  expect(page).to have_xpath("//p[contains(@class, 'px-6') and contains(text(), '#{error_message}')]")
end
