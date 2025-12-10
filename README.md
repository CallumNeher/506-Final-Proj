# The E.N.S.O Reconstruction Project:
### Using variatiational auto-encoders to reconstruct the El Niño Southern Oscillation
*insert project intro here*

Dataset: https://drive.google.com/drive/folders/18DcgugC5LcuNE1-OO0xp7ciMe6q937VP?usp=drive_link


## How to Build and Use the Code
This project uses a Makefile to automate installation, building, and execution.

#### Clone the repository
```bash
git clone <your-repo-url>
cd <your-repo-name>
```

#### Build the project
Installs all required dependencies:
```bash
make build
```

#### Run the project
Executes the main Jupyter notebook using papermill:
```bash
make run
```

This produces:
```
output.ipynb
```
which contains all executed notebook results, plots, and model outputs.

---

#### How to Test the Code

Run the automated model load test:
```bash
make test
```

This will:
- Search for any `.pt` or `.pth` model files in the repository  
- Attempt to load each model with PyTorch  
- Confirm whether the model was successfully saved and is valid  

---

### Supported Environment

#### Operating Systems
- Linux (Ubuntu recommended)
- macOS
- Windows 10/11 via WSL2

#### Python Version
- Python 3.10+

#### Dependencies Installed Automatically
The `make build` step installs the following:
torch, torchvision, array, numpy, pandas, matplotlib, moviepy, xeofs, netCDF4, down, papermill,
jupyter, jupyterlab  

#### Hardware
- CPU-only systems fully supported  
- GPU optional
- Collab, Local, Jupyter Notebooks Supported

---

#### Summary

```bash
make build
make run
make test
```

The notebook handles all data downloading, training, and model saving internally.




