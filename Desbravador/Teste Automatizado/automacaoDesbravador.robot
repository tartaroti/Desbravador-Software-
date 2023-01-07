*** Settings ***
Test Setup              Abrir o navegador
Test Teardown           Fechar o navegador
Library                 SeleniumLibrary

*** Variable ***
${BROWSER}          chrome
${URL}              https://reservas.desbravador.com.br/1111

${DATA_1}           13/02/2023
${DATA_2}           16/02/2023 

${adultos}          2            
${crianca}          1

${email}            marcostomas@teste.com   
${primeiroNome}     Marcos
${ultimoNome}       Tomas
${tipoDocumento}    CPF    
${documento}        01346492492
${telefone}         27993958319
${pais}             Brasil
${cep}              29168034
${estado}           Espirito Santo
${cidade}           Serra 
${bairro}           Civit I
${endereco}         Avenida Talma Rodrigues Ribeiro

${numeroCartao}     4000 0000 0000 0044
${nomeCartao}       DESBRAVADOR SOFTWARE
${dataExpira}       12/23
${cvc}              123



*** Test Case ***
Caso de Teste 01: Reserva de quarto para 3 dias 
    Acessar a pagina home do site Reserva Desbravador
    Verificar a disponibilidade de reserva para 3 dias
    Adicionar na reserva 2 adultos e 1 criança de 5 anos
    Selecionar o quarto STANDARD ST1
    Preencher dados para pagamento
    
*** Keywords ***
### Setup
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

### Teardown
Fechar o navegador
    Close Browser

Acessar a página home do site Reserva Desbravador   
    Wait Until Elements Is Visible
    Title Should Be                     Desbravador - Reservas Online

Verificar a disponibilidade de reserva para 3 dias

Adicionar na reserva 2 adultos e 1 criança de 5 anos
    Input Text          name="calendar_adults"                                  ${adultos}       
    Click element       class="btn-children btn btn-secondary"      
    Input Text          name="faixa1"                                           ${crianca}    

Selecionar o quarto STANDARD ST1
    Click element       class="btn-add btn btn-secondary btn-md d-block w-100"                                                          
    Click element       class="sc-hLBbgP exKfKq animate__animated animate__tada animate__delay-2s btn btn-secondary d-block w-100"
    Click element       class="sc-hLBbgP exKfKq animate__animated animate__tada animate__delay-2s btn btn-secondary d-block w-100"      

Preencher dados para pagamento
    Input Text          name="email"                                            ${email}
    Input Text          name="firstName"                                        ${primeiroNome}
    Input Text          name="lastName"                                         ${ultimoNome}
    Click element       name="documentType"             
    Input Text          name="documentType"                                     ${tipoDocumento}
    Input Text          name="document"                                         ${documento}
    Input Text          name="telephone"                                        ${telefone}
    Input Text          class="select__placeholder css-14el2xx-placeholder"     ${pais}
    Input Text          name="zipCode"                                          ${cep}
    Input Text          name="state"                                            ${estado}
    Click element       class="select__input"
    Input Text          name="city"                                             ${cidade}
    Input Text          name="neighborhood"                                     ${bairro}
    Input Text          name="adress"                                           ${endereco}

    Click element       name="paymentMethod"                                    
    Input Text          name="number"                                           ${numeroCartao}
    Input Text          name="name"                                             ${nomeCartao}
    Input Text          name="expiry"                                           ${dataExpira}
    Input Text          name="cvc"                                              ${cvc}  

    Click element       class="recaptcha-checkbox-checkmark"
    Click element       class="form-check-input"
    Click element       class="sc-hLBbgP exKfKq btn-finish btn btn-primary"

    Wait Until Elements Is Visible