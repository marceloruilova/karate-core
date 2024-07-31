Prerequisitos:

Aquí describiremos las versiones de las dependencias, packages u otro tecnología que se debe tener configurado en su maquina.

Sistema Operativo: Windows 11 Home Single Language RAM: 16.0 GB PROCESSOR: 11th Gen Intel(R) Core(TM) i7-1165G7

IDE: IntelliJ IDEA 2024.1.4, se puede usar jetbrains toolbox para instalación.

Maven: 4.0.0

JDK: versión 17

Karate: versión 1.4.1

Comandos de instalación

INTELLIJ:
1. Dirigirse a la barra derecha y hacer click en la m (maven).
2. Clikear lifecycle y luego en install.

COMANDOS:
1. mvn clean
2. mvn compile

Instrucciones para ejecutar los test

INTELLIJ:
Dirigirse a la barra derecha y hacer click en la m (maven).
Clikear lifecycle y luego en test.
Una mejor forma de probar y como yo la hice es dirigirse al archivo CartRunner y al lado de public aparece un icono para correr el test o debugear

COMANDOS:
1. mvn compile
2. mvn test
3. mvn test -Dtest=PetRunner (corre el test CartRunner específico con interfaz gráfica)

REPORTES:
1. mvn compile
2. mvn test -Dtest=PetRunner (corre el test CartRunner específico con interfaz gráfica)
3. visualizar el reporte en /target/karate-reports/karate-summary.html

Información adicional

No olvidar correr el comando mvn test -Dtest=PetRunner para visualizar los reportes
La mejor manera de testearlo es dirigiendose al archivo CartRunner. Se puede utilizar headless para que los tests se ejecuten mas rapido.