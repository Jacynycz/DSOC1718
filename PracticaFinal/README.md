# Verificación del Chip SHA-3(keccak512) mediante SystemVerilog

Esta práctica consiste en verificar el chip [SHA3(keccak512)](https://opencores.org/project,sha3) utilizando el entorno de verificación que ofrece *UVM*

## Descripción de los archivos del proyecto

A continuación se decriben los diferentes archivos de este directorio:

### Dispositivo Bajo Test *(Device Under Test)* 

En la carpeta ```dut``` se pueden encontrar los archivos del código fuente originales del chip que queremos probar.

El entorno de verificación no toca esos archivos, por lo que sólo es necesario conocer el funcionamiento de las entradas y las salidas para probar el dispositivo.

### Interfaz de conexión (BFM)

El archivo ```bfm.sv``` contiene la interfaz que utilza el entorno para comunicarse con el chip.

Consta de las siguientes partes:

- Señales de conexión con el *dut*: todas las conexiones con el chip que quieremos verificar han de hacerse a través de la interfaz. Además también dispone de variables auxiliares como ```expected_output``` que se utizan para transferir datos entre las diferentes clases de *UVM*.
- Metodo de envío de cadenas de texto: Leyendo la implementación del dispositivo bajo test, se ha implementado una función que envía al chip una cadena de texto de cualquier tamaño y espera a que este la procese.

### Sequence Items, Sequences & Secuence

En la carpeta ```sequencer``` podemos encontrar todas las clases relacionadas con las secuencias que enviamos al *dut* mediante la interfaz *bfm*.

En este caso hay sólo un ```general_sequence_item``` que es el que usamos para cargar unos datos que tenemos precalculados en otro archivo.

Las diferentes secuencias en la carpeta ```sequencer/sequences``` son las que utilizamos para cargar los diferentes *datasets* con los datos precalculados. Para probar el funcionamiento del test hay cuatro secuencias diferentes:

1. Cadenas pequeñas: ```small_string_sequence``` contiene cadenas de menos de 8 bytes para probar el funcionamiento de la entrada del chip cuando es menor de ese tamaño.
2. Cadenas medianas: ```medium_string_sequence``` contiene cadenas de texto de 100 caracteres para probar el comportamiento del chip al enviarle una cadena de texto mayor que la entrada de este.
3. Cadenas grandes: ```large_string_sequence``` contiene cadenas de 2000 caracteres para probar el comportamiento del chip cuando se llena el buffer de entrada y hay que esperar.
4. Cadenas Aleatorias: ```random_string_sequence``` contiene cadenas aleatorias que se pueden generar con un script.

### Driver

La carpeta ```driver``` contiene la clase de *UVM* que utiliza el entorno de verificación para mandar las cadenas generadas por las secuencias a la interfaz *BFM*.

En la fase de *construcción* comprueba que tiene una interfaz asociada.

En la fase de *simulación* primero pide los datos al ```sequencer``` y luego los manda por la interfaz a través del método *send*, comentado en el apartado sobre la interfaz.

### Monitor

La carpeta ```monitor``` contiene la clase para extraer los datos de salida de la interfaz y los manda a las clases *Scoreboard* y *Coverage* a través de un ```analysis port```. Para ello, en la fase de *simulación* observa la salida de la interfaz y crea un objeto para mandarlo a las dos clases que tiene suscritas.

### Scoreboard y Coverage

En la capeta ```scoreboard``` se encuentran las clases:

- **Scoreboard**: Esta clase se encarga de comprobar que la salida del chip es correcta, para ello comprueba el dato que ha obtenido a través del *Monitor* con el dato pre-calculado que se encuentra en la variable ```expected_output```. Si el dato no es correcto, lanza un error a través de *UVM*.
- **Coverage**: Esta clase implementa un covergroup de los datos de salida del chip. Para ello utiliza un tipo de datos auxiliar que fragmenta la salida de 512 bits en 16 grupos.

### Agent

En la carpeta ```agent``` se encuentra clase que se encarga de conectar, el *Driver*, el *Sequencer* y el *Monitor*.

### Environment

La carpeta ```env``` contiene la clase *Env* que conecta la salida del monitor (dentro de la clase *Agent*) a las clases *Scoreboard* y *Coverage*.

### Data sets

Este entorno de verificación contiene 4 data-sets (que se encuentran en la carpeta ```tests```) que utilizan las secuencuas descritas en el apartado *Sequence Items, Sequences & Secuence*. Además ofrece un script de *python*, que se encuentra en ```tests/scripts/dataset_generator.py```,para generar más secuencias aleatorias con parametros de longitud, y número de secuencias generadas.

### Tests

Para cada uno de los data-sets hay un test asociado en la carpeta ```tests``` a los que se pueden llamar con el comando ```+UVM_TESTNAME```

## Lanzamiento de la simulación

Para lanzar la simulación en *QuestaSim* sólo hay que ejecutar los comandos con la extesión ```.do``` ( por ejemplo usando el comando ```do large_test.do```). Si se desean recibir más mensajes duante la simulación, sólo hay que cambiar el nivel de "verbosidad" de UVM modificando el archivo ".do". Cambiando el valor ```ÙVM_MEDIUM``` por ```UVM_HIGH```.