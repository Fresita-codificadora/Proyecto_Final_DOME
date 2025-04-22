# 💡 Proyecto OSS CAD con Docker + VS Code

Este entorno te permite compilar automáticamente código VHDL o Verilog para una FPGA iCE40HX4K usando herramientas libres como Yosys, GHDL y NextPNR, sin tener que instalar nada en tu sistema.

---

## ⚙️ Requisitos

Antes de empezar, necesitás tener instalado:

- 🐳 [**Docker Desktop**](https://www.docker.com/products/docker-desktop/)
- 💻 [**Visual Studio Code**](https://code.visualstudio.com/)
- 📦 Extensión de VS Code: **Dev Containers**  
  (Buscar en el marketplace como: `ms-vscode-remote.remote-containers`)

---

## 🚀 Cómo usar el entorno

1. **Cloná este repositorio**

   ```bash
   git clone https://github.com/tu-usuario/tu-repo.git
   cd tu-repo
   ```

2. **Abrí la carpeta desde VS Code**

3. Cuando VS Code detecte el contenedor, hacé clic en:  
   `Reopen in Container` (Reabrir en contenedor)

4. ¡Listo! Ya estás dentro del entorno con todas las herramientas listas.

---

## 📁 Estructura del proyecto

| Carpeta       | Contenido                                        |
|---------------|--------------------------------------------------|
| `src/`        | Tu código fuente VHDL o Verilog                 |
| `constraints/`| Archivos `.pcf` con las restricciones del pinout |
| `output/`     | Aquí se genera el archivo `.bin` final           |

---

## 🛠️ Cómo compilar

### 🔘 Paso 1: Ejecutar la tarea de compilación

En VS Code, presioná `Ctrl+Shift+P` y elegí:

- `Run Task > Compilar VHDL` — para proyectos en VHDL
- `Run Task > Compilar Verilog` — para proyectos en Verilog

🧠 Te va a preguntar:

- El **nombre del módulo top** (sin extensión)
- El **archivo `.pcf`** correspondiente (sin `.pcf`)

### 📦 Resultado

El binario resultante se guarda como:

```
output/mi_modulo.bin
```

---

## ⬆️ Subir el binario a la FPGA

Una vez compilado, podés usar tu programador preferido.

👉 Para el programador oficial IceStorm, descargalo desde:

📥 [https://github.com/cliffordwolf/icestorm](https://github.com/cliffordwolf/icestorm)

> Si usás otra herramienta como `iceprog`, `openFPGALoader` o similar, podés adaptarlo a tu flujo.

---

## ✨ Extras

Este entorno también soporta:
- Proyectos mixtos **VHDL + Verilog**
- Simulación básica con GHDL (en desarrollo)
- Extensión con nuevos `make` targets personalizados

---

## 📌 Licencia

MIT License – libre de usar y modificar.
