# Prerequisitos

Aquí describiremos las versiones de las dependencias, paquetes u otras tecnologías que se deben tener configuradas en su máquina.

### Sistema Operativo
- **Windows 11 Home Single Language**

### RAM
- **16.0 GB**

### Procesador
- **11th Gen Intel(R) Core(TM) i7-1165G7**

### IDE
- **IntelliJ IDEA 2024.1.4**
    - Se puede usar [JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/) para la instalación.

### Maven
- **4.0.0**

### JDK
- **Versión 17**

### Karate
- **Versión 1.4.1**

---

# Comandos de instalación

### IntelliJ:
1. Dirígete a la barra derecha y haz clic en la `m` (Maven).
2. Haz clic en `Lifecycle` y luego en `install`.

### Comandos:
1. `mvn clean`
2. `mvn compile`

---

# Instrucciones para ejecutar los tests

### IntelliJ:
1. Dirígete a la barra derecha y haz clic en la `m` (Maven).
2. Haz clic en `Lifecycle` y luego en `test`.
3. Una forma más eficiente de probar es dirigirse al archivo `PetRunner`, donde al lado de `public` aparece un icono para ejecutar el test o depurarlo.

### Comandos:
1. `mvn compile`
2. `mvn test`
3. `mvn test -Dtest=PetRunner` (Ejecuta el test `PetRunner` específico con interfaz gráfica)

---

# Reportes

1. `mvn compile`
2. `mvn test -Dtest=PetRunner` (Ejecuta el test `PetRunner` específico con interfaz gráfica)
3. Visualiza el reporte en: `/target/karate-reports/karate-summary.html`

---

# Información adicional

- No olvides ejecutar el comando `mvn test -Dtest=PetRunner` para visualizar los reportes.
- La mejor manera de testear es dirigiéndose al archivo `PetRunner`.
- Se puede utilizar **headless** para que los tests se ejecuten más rápido.
