# 506-Final-Proj
***Project Proposal***
Project Goal:
This project will aim to use Sea Surface Temperature (SST) data to predict global precipitation regimes and patterns.

Data:
This project will use SST data (likely NOAA Optimum Interpolation Sea Surface Temperature) and ERA5 recalculated total precipitation data. This data is available online through Google Earth Engine and the UN Climate Data Store. 

Modeling:
We plan to use auto-encoders or some other machine learning method as a dimensionality reduction technique on SSTs, and then fit the output of the auto-encoder to an objective function that maximizes correlation of output SST data to precipitation patterns. We plan to do this on a global scale, but we may need to reduce our scope to specific ocean basin / continent teleconnections

Visualization:
We will be able to plot time series' of the outputs of the auto-encoders against existing oscillation indices (ENSO, PDO, etc.). We can plot the spatial loadings of the SST data (each pixels' hidden state values in the auto encoder, for example) to see what regions of the oceans are most contributing to certain precipitation patterns. 

Testing:
We can benchmark our model against already existing predictors for precipitation such as El Nino / Pacific Decadal Oscillation indices. Our model should theoretically be a better predictor of global rainfall patterns than these already documented climate drivers.

Data:
Website: 'https://psl.noaa.gov/data/gridded/data.noaa.oisst.v2.html'
File Name: '/Datasets/noaa.oisst.v2/sst.mnmean.nc'
