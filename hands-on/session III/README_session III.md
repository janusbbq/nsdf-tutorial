# **NSDF Tutorial: Using NSDF for End-to-End Analysis of Scientific Data - Petascale Ocean Data**

<p align="center">
    <img src="images/logo_combined.png" width="450">
</p>

<p align="center">
<a href="https://www.python.org/downloads/release/python-310/"><img alt="Python 3.10" src="https://img.shields.io/badge/Python-3.10-3776AB.svg?style=flat&logo=python&logoColor=white"></a>
<a href="https://opensource.org/licenses/Apache-2.0"><img alt="License" src="https://img.shields.io/badge/License-Apache_2.0-green.svg"></a>
<a href="https://nsdf-workspace.slack.com/"><img alt="Slack" src="https://badges.aleen42.com/src/slack.svg"></a>
<a href="https://www.docker.com"><img alt="Docker" src="https://badges.aleen42.com/src/docker.svg"></a>
<a href="https://github.com/astral-sh/ruff"><img alt="Ruff" src="https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json"></a>
<a href="https://doi.org/10.5281/zenodo.10794642"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.5281/zenodo.10794642.svg"></a>
<a href="https://dl.acm.org/doi/10.1145/3588195.3595941"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.1145/3588195.3595941.svg"></a>
<a href="https://research.ibm.com/publications/enabling-scalability-in-the-cloud-for-scientific-workflows-an-earth-science-use-case"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.1109/CLOUD60044.2023.00052.svg"></a>
<a href="https://ieeexplore.ieee.org/document/9041768"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.1109/eScience.2019.00008.svg"></a>
<a href="http://doi.org/10.1145/582034.582036"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.1145/582034.582036.svg"></a>
<a href="https://www.taylorfrancis.com/chapters/edit/10.1201/b12985-32/visus-visualization-frame[…]a-gyulassy-cameron-christensen-sujin-philip-sidharth-kumar"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.1201/b12985.svg"></a>
<a href="https://doi.org/10.1145/1944846.1944847"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.1145/1944846.1944847.svg"></a>
</p>



## Overview

This section of the tutorial introduces access to a petascale climate dataset hosted on the <a href ="https://osg-htc.org/services/osdf"> Open Science Data Federation (OSDF)</a> and distributed across three storage origins. The dataset is accessible through the <a href="https://pelicanplatform.org/"> Pelican platform </a> via direct URLs. It walks users through retrieving the data, performing basic statistical analyses, querying downsampled data for faster exploration, and extracting specific subregions for detailed study using scalable, cloud-native tools.
 
By the end of the tutorial, you will learn how to:

- **Access publicly available petascale datasets** 

- Treat the petascale data as a NumPy array and **perform statistical analysis**

- Use the NSDF dashboard for **large-scale data access, visualization, and analysis**.

<p align="center">
    <img src="images/workflow.png" width="800">
    <br>
    <em>Figure 1. Workflow diagram illustrating the tutorial's process of data retrieval, visualization and downsampled analysis using the  NSDF services.</em>
</p>

---

## Directory Structure

This section provides a detailed overview of the session III directory organization and the purpose of each component.

```
session III/
├── 3.Tutorial_PetascaleAnalysis.ipynb    # Main tutorial notebook - START HERE
├── README_session III.md                 # This file
├── Dockerfile                            # Docker container specification for reproducible environment
├── environment.yml                       # Conda environment specification with all dependencies
├── setup.sh                              # Setup script for installing dependencies and launching dashboard
│
├── files/                                # Documentation support files
│   └── docs/
│       ├── Creating_container.png        # Guide image for container setup
│       └── codespaces.png                # Guide image for GitHub Codespaces
│
└── images/                               # Tutorial images and documentation
    ├── logo_combined.png                 # NSDF and related logos
    ├── Logos.png                         # Project logos
    ├── workflow.png                      # Workflow diagram
    ├── steps.jpg                         # Step-by-step instruction screenshot
    ├── runall.png                        # Run all button illustration
    ├── pythonenv.png                     # Python environment selection
    ├── openvisus-nasa.png                # OpenVisus NASA integration image
    ├── dashboard_homepage.png            # Dashboard landing page
    ├── installation.png                  # Installation terminal screenshot
    ├── codespace1.png                    # Codespace setup image 1
    ├── codespace2.png                    # Codespace setup image 2
    ├── bokeh_widgets.png                 # Bokeh widget visualization
    ├── detailed_window.png               # Detailed view window
    ├── link.png                          # Link reference image
    ├── attached_geos_faces.png           # GEOS satellite grid visualization
    ├── cubed-sphere-grid.jpg             # Cubed sphere grid reference
    └── faces6.jpg                        # Spherical grid faces visualization
```

### Key Components Overview

| Component | Purpose |
|-----------|---------|
| **3.Tutorial_PetascaleAnalysis.ipynb** | Main interactive tutorial for petascale data analysis using NSDF |
| **setup.sh** | Automated environment setup and dependency installation script |
| **environment.yml** | Conda environment with all required Python packages |
| **Dockerfile** | Docker container configuration for reproducible deployment |
| **images/** | Supporting visualization and reference images for the tutorial |

### Quick File Reference

- **Tutorial Entry Point**: Open `3.Tutorial_PetascaleAnalysis.ipynb` first
- **Setup**: Run `sh setup.sh` to configure your environment (local machine)
- **Configuration**: 
  - `environment.yml` - Python dependencies
  - `Dockerfile` - Container-based setup
- **Documentation Images**: Tutorial screenshots and diagrams in `images/` folder
- **Dashboard**: Access at `http://localhost:8989` after running `setup.sh`

### Environment Variables & Port Configuration

The `setup.sh` script uses port `8989` by default for the dashboard. If this port is already in use, edit the first line of `setup.sh` to specify a different port before running the script.

### Data Access

This tutorial works with petascale climate datasets hosted on:
- **[Open Science Data Federation (OSDF)](https://osg-htc.org/services/osdf)** - Distributed storage platform
- **[Pelican Platform](https://pelicanplatform.org/)** - Data distribution system
- **Direct URL Access** - Data retrieved via HTTP protocols for efficient streaming

---

## Learning Objectives & Key Concepts

### Notebook Breakdown

#### **3.Tutorial_PetascaleAnalysis.ipynb** - Petascale Data Analysis
**Topics Covered:**
- Accessing petascale climate datasets from OSDF/Pelican
- Remote data loading without local storage requirements
- Treating petascale arrays as NumPy arrays
- Statistical analysis at scale (mean, std, percentiles)
- Downsampled data querying for exploration
- Subregion extraction for detailed study
- OpenVisuspy dashboard visualization

**Key Functions:**
- `xarray.open_dataset()` - Load remote NetCDF data
- `numpy.nanmean()`, `numpy.nanstd()` - Statistical operations
- `zarr` operations for chunked data access
- Dashboard API for visualization

**Prerequisites:** Basic Python, NumPy familiarity
**Expected Runtime:** 45-60 minutes
**Output:** Statistical summaries, visualizations, extracted subregions

### Core Concepts
- **Petascale Data**: Datasets exceeding petabyte (10^15 bytes) scale
- **Lazy Loading**: Load data on-demand without downloading entire dataset
- **Zarr Format**: Cloud-optimized chunked array format for remote access
- **NetCDF**: Network Common Data Form for scientific multidimensional data
- **Downsampling**: Reduced resolution for fast exploration
- **Geospatial Grids**: Cubed-sphere grids, lat/lon grids, staggered grids

---

## Dependencies & Requirements

### Key Python Packages

| Package | Version | Purpose | Documentation |
|---------|---------|---------|----------------|
| **xarray** | ≥2022.0 | Multidimensional array operations | [Docs](http://xarray.pydata.org/) |
| **numpy** | ≥1.20.0 | Numerical computing and statistics | [Docs](https://numpy.org/doc/) |
| **zarr** | ≥2.10.0 | Chunked array storage | [Docs](https://zarr-python.readthedocs.io/) |
| **netCDF4** | ≥1.5.0 | NetCDF file format support | [Docs](https://unidata.github.io/netcdf4-python/) |
| **pandas** | ≥1.3.0 | Data manipulation | [Docs](https://pandas.pydata.org/) |
| **matplotlib** | ≥3.5.0 | Data visualization | [Docs](https://matplotlib.org/) |
| **Jupyter** | ≥1.0 | Interactive notebooks | [Docs](https://jupyter.org/) |
| **bokeh** | ≥2.4.0 | Interactive dashboard components | [Docs](https://docs.bokeh.org/) |
| **OpenVisus** | Latest | Data streaming and visualization | [GitHub](https://github.com/sci-visus/openvisus) |
| **requests** | ≥2.27.0 | HTTP requests for remote data | [Docs](https://docs.python-requests.org/) |

### System Requirements
- **RAM**: 4 GB minimum (8 GB recommended)
- **Internet**: Fast, stable connection for remote data access
- **Python**: 3.10 (as specified in environment.yml)

---

## Quick Start Code Snippets

### Loading Remote Petascale Data
```python
import xarray as xr
import numpy as np

# Open remote dataset without downloading
data_url = 'https://osdf.example.com/climate_data.zarr'
ds = xr.open_zarr(data_url, consolidated=True)
print(ds)  # View structure without loading data
```

### Statistical Analysis on Petascale Data
```python
# Calculate statistics while keeping data remote
mean_temp = ds['temperature'].mean(dim=('lat', 'lon')).compute()
std_temp = ds['temperature'].std(dim=('time', 'lat', 'lon')).compute()
percentile_95 = ds['temperature'].quantile(0.95).compute()

print(f"Mean: {mean_temp.values}")
print(f"Std: {std_temp.values}")
print(f"95th percentile: {percentile_95.values}")
```

### Downsampled Data Access
```python
# Load coarse resolution for fast exploration
downsampled = ds.coarsen(
    {'lat': 4, 'lon': 4},
    boundary='trim'
).mean()

# Quick statistics on reduced dataset
quick_stats = downsampled['temperature'].mean().compute()
```

### Subregion Extraction
```python
# Select specific geographic and temporal regions
region = ds.sel(
    lon=slice(-120, -100),
    lat=slice(30, 45),
    time=slice('2020-01-01', '2020-12-31')
)

# Extract to local array
region_data = region['temperature'].values
```

### Working with Time-Series Data
```python
# Access specific timestep
t_data = ds['temperature'].isel(time=0)

# Rolling statistics
rolling_mean = ds['temperature'].rolling(time=30).mean()

# Time aggregation (e.g., monthly means)
monthly = ds.resample(time='1MS').mean()
```

---

## Data Format Guide

### NetCDF Scientific Data Format
- **Structure**: Hierarchical with dimensions, variables, and attributes
- **Dimensions**: time, depth, lat, lon (or equivalent grid)
- **Data Types**: Float32, Float64, Int32 typically
- **Attributes**: Metadata (units, long_name, standard_name, etc.)
- **Compression**: Often gzip-compressed for efficient storage

**Example Structure**:
```
Dataset with 4 dimensions and 15 variables
Dimensions: time=10000 × depth=90 × lat=181 × lon=360
Variables: temperature, salinity, velocity_u, velocity_v, ...
```

### Zarr Cloud-Optimized Format
- **Chunking**: Data divided into manageable chunks for remote access
- **Consolidated Metadata**: Single metadata file for efficient access
- **Compression**: Selectable compression algorithms (blosc, zstd)
- **Lazy Loading**: Pull only needed chunks from cloud storage

### Cubed-Sphere Grid Structure
- **Grid**: 6 cube faces, each discretized into a lat/lon grid
- **Advantage**: Uniform resolution across sphere (no pole problem)
- **Interpolation**: More complex than regular lat/lon
- **Shape**: `(6, nface_lat, nface_lon)` or flattened to 2D

---

## API & Integration References

### xarray Remote Data Access
```python
# Open NetCDF from OSDF
ds = xr.open_dataset('https://osdf.example.com/data.nc')

# Open Zarr with optimization
ds = xr.open_zarr(
    'https://osdf.example.com/data.zarr',
    consolidated=True,
    decode_times=True
)

# Select variables and dimensions
temp = ds['temperature']
subset = temp.isel(time=slice(0, 100), lat=slice(0, 90))
result = subset.mean(dim='time')
```

### NumPy Operations on Remote Data
```python
# These operations keep data remote until .compute() or .values
mean = ds['temperature'].mean()
std = ds['temperature'].std()
corr = ds['temperature'].corr(ds['salinity'])

# Force computation and download
computed_result = mean.compute()
```

### Dashboard Integration
```python
# Create interactive visualization
from openvisus.dashboards import create_dashboard

dashboard = create_dashboard(
    data=ds,
    variable='temperature',
    port=8989,
    cache_size='512MB'
)
```

---

## Configuration & Customization

### Environment Variable
**File**: `environment.yml`
- Specifies Python version (3.10)
- Lists all required packages and versions
- Reproducible environment across platforms

### Port Configuration
**File**: `setup.sh` (first line)
```bash
PORT=8989  # Change to different port if needed
```

### Data Access Configuration
- **OSDF URL**: Configured in notebook cells
- **Authentication**: Some datasets may require credentials
- **Bandwidth**: Network speed affects transfer rates

### Performance Tuning
- **Chunk Size**: Larger chunks = fewer requests, more memory
- **Downsampling Factor**: Balance between speed and detail
- **Variables**: Load only necessary variables
- **Time Subsetting**: Reduce time dimension when possible

---

## Common Issues & Troubleshooting

### Network Timeout Issues
**Problem**: "Connection timeout when accessing remote data"
**Solution**: 
```python
# Increase timeout and add retry logic
xr.set_options(file_cache_maxsize=128)
ds = xr.open_dataset(url, engine='netcdf4')
```

### Memory Errors with Large Subsets
**Problem**: "MemoryError when computing large arrays"
**Solution**: Process in chunks
```python
# Process by time chunks
for time_idx in range(0, len(ds.time), 100):
    chunk = ds.isel(time=slice(time_idx, time_idx+100))
    result = chunk['temperature'].mean().compute()
    # Process result
```

### Port Already in Use
**Problem**: "Address already in use" when running dashboard
**Solution**: Edit first line of setup.sh or use different port

### Slow Data Access
**Problem**: "Data loading is very slow"
**Solutions**:
- Use downsampled data for exploration
- Work with subregions instead of global data
- Access during off-peak hours
- Check internet connection speed

---

## Real-World Use Cases

### 1. **Climate Model Analysis**
Analyze global climate model outputs to identify temperature trends, extreme events, or seasonal patterns.

### 2. **Ocean Current Research**
Study ocean circulation patterns, upwelling zones, or thermal structures for marine biology applications.

### 3. **Weather Forecasting Validation**
Compare forecast model outputs with observations/reanalysis to assess prediction skill.

### 4. **Geophysical Data Exploration**
Examine large-scale geophysical data (sea level, ice extent, soil moisture) for trend analysis.

### 5. **Machine Learning on Climate Data**
Train neural networks on petascale climate data to predict extreme events or future scenarios.

---

## Integration with AI/ML Tools

### TensorFlow for Deep Learning
```python
import tensorflow as tf
from xarray import DataArray

# Convert xarray to tensor
temperature_tensor = tf.convert_to_tensor(
    ds['temperature'].values,
    dtype=tf.float32
)

# Build prediction model
model = tf.keras.Sequential([
    tf.keras.layers.Conv3D(64, 3, activation='relu', input_shape=(10, 90, 180, 1)),
    tf.keras.layers.GlobalAveragePooling3D(),
    tf.keras.layers.Dense(1)
])
```

### PyTorch for Machine Learning
```python
import torch
from torch.utils.data import TensorDataset

# Create dataset for training
X = torch.from_numpy(ds['temperature'].values[:1000])
y = torch.from_numpy(ds['precipitation'].values[:1000])

dataset = TensorDataset(X, y)
dataloader = torch.utils.data.DataLoader(dataset, batch_size=32)
```

### Scikit-learn for Analysis
```python
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

# Standardize data
scaler = StandardScaler()
data_scaled = scaler.fit_transform(ds['temperature'].values.reshape(-1, 1))

# Dimensionality reduction
pca = PCA(n_components=10)
pca_result = pca.fit_transform(data_scaled)
```

### Dask for Distributed Processing
```python
import dask.array as da

# Convert to dask array for parallel processing
data_dask = da.from_delayed(
    lazy_load_temperature(),
    shape=(10000, 90, 180),
    dtype=np.float32
)

# Parallel computation
mean_per_time = data_dask.mean(axis=(1, 2)).compute()
```

### Xarray with ML Preprocessing
```python
# Normalize features for ML
temp_norm = (ds['temperature'] - ds['temperature'].mean()) / ds['temperature'].std()

# Create feature matrix
features = xr.concat([
    temp_norm,
    (ds['salinity'] - ds['salinity'].mean()) / ds['salinity'].std()
], dim='features')
```

---

 ## Table of contents
 
- [Overview](#overview)
- [Directory Structure](#directory-structure)
- [Learning Objectives & Key Concepts](#learning-objectives--key-concepts)
- [Dependencies & Requirements](#dependencies--requirements)
- [Quick Start Code Snippets](#quick-start-code-snippets)
- [Data Format Guide](#data-format-guide)
- [API & Integration References](#api--integration-references)
- [Configuration & Customization](#configuration--customization)
- [Common Issues & Troubleshooting](#common-issues--troubleshooting)
- [Real-World Use Cases](#real-world-use-cases)
- [Integration with AI/ML Tools](#integration-with-aiml-tools)
- [Running the Tutorial](#running-the-tutorial)
- [Option 1: GitHub Codespaces](#option-1-github-codespaces-recommended)
- [Option 2: Local Machine](#option-2-local-machine)
- [Community and Resources](#community-and-resources)
- [Authors](#authors)
- [Related Works](#related-works)
- [Acknowledgments](#acknowledgments)
 
## Running the Tutorial
### Option 1: GitHub Codespaces (Recommended)

> :bulb: **Note:** To follow this tutorial using the GitHub Codespaces you must have a GitHub Account

Use your GitHub account to run this tutorial with GitHub Codespaces

Please click the next button to open in GitHub Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/TauferLab/NSDF-Tutorial-2025?devcontainer_path=.devcontainer/session+III/devcontainer.json)

Now follow these steps to set up your virtual environment using GitHub codespaces:

Verify that you are using the `main` branch, the repository name `TauferLab/NSDF-Tutorial-2025` and the dev container configuration `NSDF Tutorial - Session III`. Then click on `Create Codespace`

<p align="center">
    <img src="files/docs/codespaces.png" width="800">
    <br>
    <em>Figure 2. Creating GitHub codespaces.</em>
</p>

> :bulb: **Note:** This process may take a couple of minutes.

<p align="center">
    <img src="files/docs/Creating_container.png" width="800">
    <br>
    <em>Figure 3. Setting up your Codespace.</em>
</p>

This will take you to a GitHub Codespace, which can take upto 3 minutes to install all required dependencies. After this, you will be able to see an interface like this. Now, do the following:

- Browse `hands-on/session III`
- Select the Jupyter Notebook: `3.Tutorial_PetascaleAnalysis.ipynb`. See `Figure 4` below for reference.
- Click 'Run All'. (See images below for reference)
- A popup will apprear asking you to select Kernel. From there, select 'Python Environments'
- Select 'NSDF-Tutorial (Python 3.10.17)'

<figure>
    <img src="images/steps.jpg" alt="drawing" width="400"/>
    <figcaption>Figure 4. Steps to access the jupyter notbook.</figcaption>
</figure>
</br>

<figure>
    <img src="images/runall.png" alt="drawing" width="400"/>
    <figcaption>Step 3: Select 'Run All'</figcaption>
</figure>
</br>

<figure>
    <img src="images/pythonenv.png" alt="drawing" width="400"/>
    <figcaption>Step 4: Select 'Python Environments'</figcaption>
</figure>
</br>
<figure>
    <img src="images/openvisus-nasa.png" alt="drawing" width="400"/>
    <figcaption>Step 5: Select 'NSDF-Tutorial'</figcaption>
</figure>
</br>

If you are familiar with VS code, you should be able to execute the rest of the code now.
You can explore the jupyter notebooks now.

To launch the dashboard from here, open terminal from the VS code itself and do `sh setup.sh`. This will download other remaining dependencies. It will look like this image [Scroll to Installation](#installation-terminal)



----
### Option 2: Local Machine
#### Basic Pre-requirements
- Download [Python](https://www.python.org/downloads/) version > 3.8 and version< 3.12 depending on your  OS
- Install and setup latest version of [Git](https://git-scm.com/downloads) 


**1. Clone this repository**
- Open the terminal or git bash from your machine and run the following command:
``` git clone  https://github.com/sci-visus/Openvisus-NASA-Dashboard.git```

**2. Run the script**
- After cloning, go inside the repository using `cd Openvisus-NASA-Dashboard` from your terminal.

- If you are using Windows, you can go the folder containing the files, and double-click it. It should open a shell and start running the script.

- If you are using Linux or Mac, you can do `sh setup.sh` to run the script.

- This code uses port `8989` by default. If this port is already in use, please feel free to change it in the first line in the [`setup.sh`](setup.sh) file and run again.

- Once the installation completes, you should see something like this: 
<div id="installation-terminal">
  <img src="./images/installation.png" alt="Installation Terminal" width="600"/>
 
</div>
It is basically cloning a repo, setting up the environment and installing required dependencies to run the dashboard properly. It could take upto 3 minutes but your internet speed can affect this time.

**3. Visit the Dashboard**
- Once the script runs successfully, you can visit the url [localhost:8989](http://localhost:8989) or [0.0.0.0:8989](http://0.0.0.0:8989) in your browser and start exploring.
- By default, you can see the dashboard that looks like this:
![Dashboard](./images/dashboard_homepage.png)

**4. Interactivity**
There are several interactive options available within the dashboard. 

- *Dataset*: you can click dropdown option called `scene` at the topmost left and get a list of dataset available
- *Time*: You can change the timeslider called `Time` to get any timesteps. There are more than 10000 timesteps available from the original simulation.
- *Offset*: You can change the depth of the ocean by changing the `offset` slider. Since this is ocean data, `0` means the sea surface. The depth increases as the offset increases. Total 90 depths available from the original simulation.
- *Resolution*: It lets the users select the quality of the data they want. Lower resolution means coarser data, with low data movement, higher resolution means finer and more detailed data which can be slower.
- *Direction*: This is useful to see the vertical slicing, horizontal slicing or the surface visualization based on user's needs.
- *Play*: There is a `Play` button available that lets the users browse through time. 
- *Speed*: It is the number of timesteps users want to see at a time while `playing`. `1` means every single timestep, `2` means every other timestep and so on.
- *Frame delay*: This allows the users to manually slow down the rate at which data are updated.
- *Palette*: Users can choose from a list of high quality perceptually accurate color palettes depending on their needs. 
- *Range*: This lets the users decide if they want to keep the same range across entire data or dynamically change the range as new timestep or depths comes in. Users can manually set their own range by change the dropdown option to `user` and changing `min` and `max` values in the following boxes.

**5. Subregion Extraction**
We understand that extracting a region from this huge dataset can be extremely useful for certain usecases. So, we have used the bokeh widgets along with Javascript to allow selection of regions within the dashboard. Right next to the colormap, you can see a bokeh toolbar that looks like this:

<img src='./images/bokeh_widgets.png' alt = 'Bokeh Widgets' style= "float:left; margin-right: 20px">
<p> 

- *Pan*: The top option is called `pan` and its selected by default. You can move the image around while this is clicked. 

- *Selection*: The second option is a `selection` box. After clicking this, you can draw a bounding box on the image anywhere, and this will show the detailed view of that selection region, which is described in the next section below.

- *Zoom*: The third option is the `zoom` button. Its on by default and, users can use their mouse cursor to zoom into a region or zoom out as per their needs.

- *Reset*: If the viewing region is changed at any point because of the use of the buttons above, clicking this will reset the zoom and pan to default.  
</p>

**6. Region of Interest Detailed View**
 When a selection box is clicked from bokeh toolbar and a bounding box is drawn on the image, it queries for the higher resolution data in that selection region. We limit the size to be either 20MB or highest resolution possible without going over this limit. The detailed view looks like this:

 ![Detailed Window](./images/detailed_window.png)

 Some of the features available in this window are mentioned below:
 - *Download the numpy array*: Users have the option to save the selected data into their local machine as a numpy array. It captures both the data and their relative position in the data nad save it as a `.npz` file which can then  be loaded with `numpy` and can be used anywhere numpy is supported.

 - *Download the python script*: In case the data is large and users dont want to download the data immediately, it lets the users download the python script that can query for the exact region and save them locally in their machine. 

 - *Replace Existing Range*: If the range of the seleted data is different and users think this is more appropriate for the whole dashboard, they can click ` Replace Existing Range` to replace the min/max value in the original dashbaord. For example, if the original dashboard colormap has the range forom `-4` to `4`, and the selected region has range from `-1` to `1` which they believe is more appropriate, clicking this will change the original colormap in the dashboard to `-1`to `1`.

 - *Add This Range*: In other cases where the original dashboard is showing range thats not including the range in detailed view or if users changed the range previously and wants to manually manipulate the range, clicking `Add This Range` will change the min/max in the orginal dashboard ensuring that the new range is included. For example, if the main dashboard is showing range from `-1` to `1`, and users selected a region that had values ranging `-2` to `1.5`, clicking this will update the color range in main dashboard to include highest minima and maxima values, i.e. `-2` to `1.5` in this case.

 - *Detailed Stats*: The detailed view also shows the minimum and amximum value for the selected region. If users want to download the data locally, it also shows the approximate file size. Again, this is set to a 20 MB max so that users don't accidentally download large chunk of data in their local machine without being aware of.

---
## Community and Resources:

NSDF and OpenVisus are open-source projects. Questions, discussions, and contributions are welcome. Contributions can include new packages, bug fixes, documentation, or even new core features.


NSDF Resources:

- **Slack workspace**: [nsdf-workspace](https://nsdf-workspace.slack.com/).
- **Github Discussions**: [issues](https://github.com/nsdf-fabric/catalog-comparison-tool/issues): Discussions and Q&A.
- **Mailing list**: [https://groups.google.com/g/nsdf](https://groups.google.com/g/nsdf) - nsdf@googlegroups.com
- **LinkedIn**: [LinkedIn](https://www.linkedin.com/company/76216771/admin/dashboard/) 

OpenVisus Resources:

- **Github:** [Open Source distribution of the ViSUS capabilities](https://github.com/sci-visus/openvisus)
- **Webpage:** [VISUS - High performance Big Data Analysis and Visualization Solutions](https://visus.org/)
 ---
 ### Authors

 Please feel free to contact us here for detailed information:
  - Aashish Panta [Email me](mailto:aashishpanta0@gmail.com)
  - Giorgio Scorzelli [Email me](mailto:scrgiorgio@gmail.com)
  - Valerio Pascucci [Email me](mailto:pascucci.valerio@gmail.com)

  --- 
  ### Related Works


1. Aashish Panta,Xuan Huang, Nina McCurdy, David Ellsworth, Amy A. Gooch, Giorgio Scorzelli, Hector Torres, Patrice Klein, Gustavo A. Ovando-Montejo, Valerio Pascucci. “Web-based Visualization and Analytics of Petascale data: Equity as a Tide that Lifts All Boats”.  LDAV 2024
2. Pascucci, Valerio, et al. "The ViSUS visualization framework." High Performance Visualization. Chapman and Hall/CRC, 2012. 439-452. [Here](https://www.taylorfrancis.com/chapters/edit/10.1201/b12985-32/visus-visualization-framework-valerio-pascucci-giorgio-scorzelli-brian-summa-peer-timo-bremer-attila-gyulassy-cameron-christensen-sujin-philip-sidharth-kumar)
3. Brian Summa, Giorgio Scorzelli, Ming Jiang, Peer-Timo Bremer, and Valerio Pascucci. 2011. Interactive editing of massive imagery made simple: Turning Atlanta into Atlantis. ACM Trans. Graph. 30, 2, Article 7 (April 2011), 13 pages. [Here](https://dl.acm.org/doi/10.1145/1944846.1944847)

## Acknowledgments

The authors of this tutorial would like to express their gratitude to:

- NSF through the awards 2138811, 2103845, 2334945, 2138296, and 2331152.
- NASA Ames Research Center and NASA JPL
- Open Science Data Federation (OSDF) and Pelican Platform Team

Any opinions, findings, conclusions, or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.
