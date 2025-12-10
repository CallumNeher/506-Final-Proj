# The E.N.S.O Reconstruction Project:
### Using variatiational auto-encoders to reconstruct the El Niño Southern Oscillation
*insert project intro here*
Dataset: https://drive.google.com/drive/folders/18DcgugC5LcuNE1-OO0xp7ciMe6q937VP?usp=drive_link

### 2 Dimensional Latent Space Visualization

<img width="561" height="455" alt="Latent Space 2d Final" src="https://github.com/user-attachments/assets/c3b167dc-c0bd-4212-8f6b-4a4363f0a366" />

### Latent Time Series and ENSO Time Series

<img width="2011" height="1511" alt="Latent TS 2d final" src="https://github.com/user-attachments/assets/cd529089-6dfb-47b1-b4b1-53fcdf7f4527" />

### Correlations of Latent Time Series to Each Pixel's Time Series

<img style="height:25%; width:auto;" alt="Latent Corrs 2d Final" src="https://github.com/user-attachments/assets/345c7543-11d2-4cac-9678-eea181d12faf" />

### Gradients of Decoder Layer to Latent Layer: Represents shifting Spatial Loadings

https://github.com/user-attachments/assets/33811ffa-b3fc-43c6-a656-9611a52b2064








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
torch, torchvision, array, numpy, pandas, matplotlib, moviepy, xeofs, 
netCDF4, down, papermill, jupyter, jupyterlab  

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




