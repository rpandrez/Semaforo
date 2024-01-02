Projeto de Controlador de Semáforo

Descrição

Este projeto consiste em um controlador de semáforo que utiliza os pinos da placa de desenvolvimento ALTERA DE2-115, conectados a um 
barramento de LEDs em posições específicas do sistema. Além disso, a entidade exibe informações visuais no visor LCD da placa relacionadas
ao sistema de semáforos, como o tempo restante para a mudança de estado.

É importante ressaltar que a maquete utilizada para este projeto não é comercial. Portanto, ao implementar em outras maquetes, é crucial
ficar atento aos pinos específicos que estão sendo utilizados para acionar os LEDs, pois podem variar conforme o modelo da maquete.


Funcionalidades

Controle Visual: O sistema gerencia o funcionamento dos semáforos, indicando visualmente as transições de estado por meio dos LEDs
conectados aos pinos específicos.

Informações no LCD: O visor LCD na placa exibe informações detalhadas sobre o sistema de semáforos, oferecendo uma visão clara do tempo
restante para a próxima mudança de estado.

Controle Manual: É possível interferir manualmente no sistema, controlando os estados dos semáforos. É permitido abrir apenas as vias 
verticais ou horizontais, simulando uma situação de emergência.

Controle de Tempo: Os usuários podem definir o tempo de abertura de cada semáforo por meio de um teclado matricial conectado aos pinos
de I/O da placa.

Utilização

Para utilizar o projeto, siga estas etapas:
Clone o repositório para sua máquina local.

bash
Copy code
git clone https://github.com/rpandrez/semaforo.git
Compile e carregue o código na placa de desenvolvimento ALTERA DE2-115.

Observe o funcionamento dos semáforos por meio dos LEDs e as informações exibidas no visor LCD.

Ao implementar em outras maquetes, verifique e ajuste os pinos específicos utilizados para acionar os LEDs de acordo com o modelo da sua
maquete.

Utilize o teclado matricial para definir o tempo de abertura de cada semáforo.

Se desejar, experimente interferir manualmente no sistema para simular situações de emergência.

Contribuições
Este projeto foi desenvolvido como parte da disciplina de Circuitos Digitais no curso de Engenharia Eletrônica na Universidade Tecnológica 
Federal do Paraná. Contribuições e melhorias são bem-vindas.

Autores
Renan Andrez
Luis Felipe Mesquita
Igor Lourenço
