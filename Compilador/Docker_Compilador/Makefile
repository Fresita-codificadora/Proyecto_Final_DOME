all:
	@read -p "🧠 Nombre del módulo top (sin .vhdl): " TOP_MODULE; \
	read -p "📎 Archivo de restricciones PCF (sin .pcf): " PCF_FILE; \
	if [ ! -f src/$$TOP_MODULE.vhdl ]; then \
		echo "❌ Error: src/$$TOP_MODULE.vhdl no existe."; exit 1; \
	fi; \
	if [ ! -f constraints/$$PCF_FILE.pcf ]; then \
		echo "❌ Error: constraints/$$PCF_FILE.pcf no existe."; exit 1; \
	fi; \
	echo "🔧 Sintetizando $$TOP_MODULE..."; \
	yosys -m ghdl -p "ghdl src/$$TOP_MODULE.vhdl -e $$TOP_MODULE; synth_ice40 -top $$TOP_MODULE -json $$TOP_MODULE.json"; \
	echo "📦 Place & Route..."; \
	nextpnr-ice40 --hx4k --package tq144 --json $$TOP_MODULE.json --pcf constraints/$$PCF_FILE.pcf --asc $$TOP_MODULE.asc; \
	echo "🔨 Generando bin..."; \
	icepack $$TOP_MODULE.asc output/$$TOP_MODULE.bin; \
	echo "✅ Listo: output/$$TOP_MODULE.bin"
