vhdl:
	@make LANG=vhdl run

verilog:
	@make LANG=verilog run

simulate:
	@echo "🧪 (Simulación por implementar)"

run:
	@read -p "🧠 Nombre del módulo top (sin extensión): " TOP_MODULE; \
	read -p "📎 Archivo de restricciones PCF (sin .pcf): " PCF_FILE; \
	if [ "$$LANG" = "vhdl" ]; then \
		SRC="src/$$TOP_MODULE.vhdl"; \
	elif [ "$$LANG" = "verilog" ]; then \
		SRC="src/$$TOP_MODULE.v"; \
	else \
		echo "❌ LANG no válido."; exit 1; \
	fi; \
	if [ ! -f $$SRC ]; then \
		echo "❌ No existe $$SRC."; exit 1; \
	fi; \
	if [ ! -f constraints/$$PCF_FILE.pcf ]; then \
		echo "❌ No existe constraints/$$PCF_FILE.pcf."; exit 1; \
	fi; \
	echo "🔧 Sintetizando $$TOP_MODULE ($$LANG)..."; \
	if [ "$$LANG" = "vhdl" ]; then \
		yosys -m ghdl -p "ghdl $$SRC -e $$TOP_MODULE; synth_ice40 -top $$TOP_MODULE -json $$TOP_MODULE.json"; \
	else \
		yosys -p "read_verilog $$SRC; synth_ice40 -top $$TOP_MODULE -json $$TOP_MODULE.json"; \
	fi; \
	nextpnr-ice40 --hx4k --package tq144 --json $$TOP_MODULE.json --pcf constraints/$$PCF_FILE.pcf --asc $$TOP_MODULE.asc; \
	icepack $$TOP_MODULE.asc output/$$TOP_MODULE.bin; \
	echo "✅ Listo: output/$$TOP_MODULE.bin"
