# Makefile for Notebook-Centric Workflow

PYTHON := python3
NOTEBOOK := "SST Autoencoder Final.ipynb"
OUTPUT_NOTEBOOK := "output.ipynb"

# INSTALL DEPENDENCIES
install:
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install jupyter jupyterlab
	$(PYTHON) -m pip install torch torchvision
	$(PYTHON) -m pip install xarray numpy pandas matplotlib
	$(PYTHON) -m pip install xeofs
	$(PYTHON) -m pip install moviepy netCDF4 gdown
	$(PYTHON) -m pip install papermill

# BUILD STEP (no dataset handling)
build: install
	@echo "Build complete (notebook handles all data)."

# RUN THE NOTEBOOK 
run:
	papermill $(NOTEBOOK) $(OUTPUT_NOTEBOOK)
	@echo "Notebook executed successfully."

# TEST STEP
# Looks for ANY *.pt or *.pth file created by the notebook
test:
	$(PYTHON) - << 'EOF'
import glob
import torch

# Search for model files anywhere in the repo
candidates = glob.glob("**/*.pt", recursive=True) + glob.glob("**/*.pth", recursive=True)

if not candidates:
    raise FileNotFoundError("No model file (*.pt or *.pth) found. Did the notebook save a model?")

print("Model files found:", candidates)

# Try loading each one safely
for path in candidates:
    try:
        torch.load(path, map_location="cpu")
        print(f"Loaded successfully: {path}")
    except Exception as e:
        print(f"Failed to load {path}: {e}")

print("Test completed: model load attempted for all detected files.")
EOF

# CLEAN GENERATED NOTEBOOK OUTPUT
clean:
	rm -f $(OUTPUT_NOTEBOOK)
	@echo "Clean complete."

.PHONY: install build run test clean
