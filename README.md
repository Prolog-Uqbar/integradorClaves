# Clave secreta

**Un sistema de seguridad requiere el uso de claves para sus usuarios.**

*Las claves están formadas por tres elementos, el primero es una letra vocal y los dos restantes son dígitos. Solo se permiten letras minúsculas, los dígitos no pueden repetirse ni constituir una secuencia ascendente o descendente.*

1. Encontrar todas las posibles claves. 

2. Se tiene información de las consideraciones adicionales que tienen algunos usuarios para definir sus claves:
  - Tita elige los dígitos bajos, nunca mayores a 2. 
  - Toto elige la letra o y usa el 0 en alguna posición.
  - Tato elige letras de su nombre y entre los dígitos le gusta sólamente el 0,1 y 2.
  - Agregate vos, inventando tu propia lógica para la clave

En base a esto, encontrar las claves que podría tener cada uno de los usuarios.

3. Implementar los predicads y mostrar las consultas que permitan averiguar lo siguiente:
- ¿Son suficientes las pistas para encontrar con exactitud cuál es la clave de alguno de ellos? 
- ¿Hay algun usuario para el que sea imposible armar su clave? Por ejemplo, si tu lógica inventada fuera que los dos números sumen 18, sería imposible armar una clave.
- Un hacker llegó a descubrir cuál es el último elemento de una clave ingresada, pero no sabe a qué usuario corresponde. ¿Qué números puede haber encontrado que le permitan acotar la búsqueda de usuarios y cuáles no? Por ejemplo, si descubre que termina en 9, sabe que el usuario no puede ser ni Tita ni Tato. En cambio, si descubre que el último elemento 0, está igual que antes porque no puede descartar a nadie (salvo que tu clave no pueda terminar en 0)

Ayuda: Ya se cuenta con una parte de la base de conocimiento

```
digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).
```
