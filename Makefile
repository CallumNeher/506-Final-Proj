PYTHON := python3

NOTEBOOK := "SST Autoencoder Final.ipynb"
OUTPUT_NOTEBOOK := "output.ipynb"

install:
	conda install -y -c conda-forge netcdf4 hdf5
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install jupyter jupyterlab
	$(PYTHON) -m pip install torch torchvision
	$(PYTHON) -m pip install xarray numpy pandas matplotlib
	$(PYTHON) -m pip install xeofs
	$(PYTHON) -m pip install moviepy netCDF4 gdown
	$(PYTHON) -m pip install papermill
	$(PYTHON) download_model.py

build: install
	@echo "Build complete (notebook handles all data)."

run:
	papermill $(NOTEBOOK) $(OUTPUT_NOTEBOOK)
	@echo "Notebook executed successfully."

clean:
	rm -f $(OUTPUT_NOTEBOOK)
	@echo "Clean complete."

.PHONY: install build run clean

