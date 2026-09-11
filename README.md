# ScriptSh

Colección de scripts y configuraciones para preparar un entorno Linux con herramientas, fuentes, SSH, Git y respaldo del sistema.

## Estructura

- `assets/`: recursos visuales y de sistema, como fuentes tipográficas.
- `config/`: archivos de configuración de aplicaciones, como Neovim y Ghostty.
- `docs/`: documentación del proyecto.
- `lib/`: librerías reutilizables y utilidades compartidas.
- `scripts/configuracion/`: scripts para configurar SSH, Git y Neovim.
- `scripts/instalacion/`: scripts para instalar programas del sistema.
- `scripts/respaldo/`: scripts y archivos para respaldar paquetes y estado del sistema.
- `scripts/utilidades/`: utilidades generales como instalación de fuentes.

## lib/comandos
Contiene funciones y utilidades compartidas entre los scripts, como la función `texColor` para mostrar texto con colores.

Para usar las funciones de `lib/comandos`, se debe incluir el archivo en cada script que lo necesite. Ejemplo:

```bash
source "$PROJECT_ROOT/lib/comandos/textoColor.sh"
```

## Uso global

Si quieres ejecutar cualquiera de estos scripts como comando del sistema, deben colocarse en `/usr/bin` o crear un enlace simbólico desde el proyecto hacia `/usr/bin`.

Ejemplo:

```bash
sudo ln -s /ruta/al/proyecto/scripts/instalacion/programas.sh /usr/bin/programas
```

## Uso rápido

1. Ejecuta los scripts desde su carpeta correspondiente.
2. Mantén los recursos compartidos en `lib/` y `assets/`.
3. Evita mezclar configuración, instalación y utilidades en la raíz del proyecto.

## Scripts principales

- `scripts/instalacion/programas.sh`: instala programas base y herramientas auxiliares.
- `scripts/configuracion/confiClaveSSH.sh`: genera y configura claves SSH.
- `scripts/configuracion/configuracionGit.sh`: configura nombre, email y editor de Git.
- `scripts/configuracion/neovim.sh`: prepara Neovim con plugins y configuración.
- `scripts/utilidades/fuente.sh`: copia fuentes al sistema y actualiza la caché.
- `scripts/respaldo/respaldo.sh`: respalda y restaura paquetes del sistema.

## Recomendación

Mantén cada script con una sola responsabilidad y usa rutas relativas al proyecto para que el repositorio siga siendo portable.
