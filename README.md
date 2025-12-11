# The E.N.S.O Reconstruction Project:
### Using variatiational auto-encoders to reconstruct Sea Surface Temperature and isolate El Niño Southern Oscillation

# How to Build and Use the Code
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

### Project Explanation:

Youtube Explanation: https://youtu.be/AiFCUWa-z7s

Dataset: https://drive.google.com/drive/folders/18DcgugC5LcuNE1-OO0xp7ciMe6q937VP?usp=drive_link

NASA data access: https://psl.noaa.gov/data/gridded/data.noaa.oisst.v2.html 

#### Dataset Description:

We are using 40 years of monthly sea surface temperature data. Our data is at 1 degree spatial resolution and has global coverage. The SSTs have been detrended and centered. They are available in the state we use them at the google drive link above.

#### Methods:

We use a variational autoencoder (VAE) to reconstruct SST data. The encoder of the VAE takes a single image of SST data as a vector, and compresses it down to 2 latent dimensions. The decoder then reconstructs the full image from this 2 dimensional latent vector. After training our VAE we can create latent dimension time series by passing our SST images sequentially through just the encoder. Each time step will be a 2 dimensionsl vector, and we can separate this out into 2 latent time series.

#### Latent Time Series and ENSO Time Series
<p align="center">
  <img width="50%" height="50%" alt="Latent TS 2d final" src="https://github.com/user-attachments/assets/cd529089-6dfb-47b1-b4b1-53fcdf7f4527" />
</p>

#### 2 Dimensional Latent Space Visualization

We can also directly visualize the latent vectors. In the plot below we have plotted the latent vectors for each time point, and colored each point based on the value of the ENSO 3.4 index at that time point. The latent space is able to separate extreme phases of ENSO from one another in the latent space. 

<p align="center">
  <img width="561" height="455" alt="Latent Space 2d Final" src="https://github.com/user-attachments/assets/c3b167dc-c0bd-4212-8f6b-4a4363f0a366" />
</p>



#### Correlations of Latent Time Series to Each Pixel's Time Series

Next we can calculate the pixel-wise correlation between the time series at each pixel and each of our latent time series from above. This will show us which pixels have time series that are most similar to the ones from our latent space. This allows us to see which regions of the ocean are being most captured by our latent time series. 

<p align="center">
  <img width="50%" height="50%" alt="Latent Corrs 2d Final" src="https://github.com/user-attachments/assets/345c7543-11d2-4cac-9678-eea181d12faf" />
</p>

#### Gradients of Decoder Layer to Latent Layer: Represents shifting Spatial Loadings

Here, we calculate the gradient of the final decoder layer with respect to the latent layer at each pixel, for each time step. This shows us how SSTs are changing over time. We are able to see an oscillation of gradients along the ENSO corridor in the tropical pacific. This mimics the actual shift of colder and warmer water back and forth during ENSO events. On the left is the map of shifting gradients, and the right is the first latent time series from before (with a moving indicator of which part of the time series we are on). 

<p align="center">
  
  https://github.com/user-attachments/assets/33811ffa-b3fc-43c6-a656-9611a52b2064
  
</p>

### Comparisons to Linear PCA

Our latent time series can also be thought of as a dimensionality reduction of our overall SST data. Our hypothesis when starting this project is that a VAE would be able to better model SST data than pure linear Principal Component Analysis. To test this we must compare the two versions of dimensionality reduction. Here are the first 2 Principal Components of our SST data:

<p align="center">
  <img width="80%" height="80%" alt="Linear PCA Comparison" src="https://github.com/user-attachments/assets/f3bb9591-8f4e-4d37-9feb-c7e4ac9a3b67" />
</p>

Linear PCA has the advantage that all PCs are orthgonal to one another, which forces PCA to capture different modes of variability in SST data. Our latent space in the VAE doesn't have any such constraint, as a result the two latent time series seem to be capturing very similar patterns of variability. This is in contrast to the two principal components above, which clearly capture 2 different modes of variability in SSTs.



# Next Steps:

Our current model doesn't give the VAE any spatial or temporal dependence. Pixels have no influence on their neighbors, and one time point has no impact on the next. Both of these problems could be solved to create a potentially massive reduction in reconstruction error. To implement spatial dependence, one could implement a better reconstruction loss, such that the loss could be calculated as a mahalanobis distance, where the inverse covariance matrix captures the spatial structure of the SSTs. To implement a temporal dependence, one could use an RNN or LSTM structure to have information from the previous state impact the next state.

This model is currently very simple in that it doesn't build in either of the dependencies that can make geospatial data so powerful (temporal and spatial). It is impressive that the current model is able to capture the ENSO time series and spatial pattern so well even without either of these dependencies. Improving this model could lead to a much more powerful dimensionality reduction technique for SSTs. The Variational aspect of our VAE even implies that one could use a model like this with an LSTM or RNN element to do some forecasting of ENSO oscillation. This would be hugely powerful if accurate, as it could predict interannual climate shifts ahead of time.


