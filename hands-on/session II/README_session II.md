# **NSDF Tutorial: Using NSDF for End-to-End Analysis of Scientific Data - Earth Science**


<p align="center">
    <img src="Materials/files/docs/Logos.png" width="450">
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

This tutorial introduces the <a href="https://nationalsciencedatafabric.org/" target="_blank" rel="noreferrer">NSDF</a> ecosystem, which enhances scientific data access, analysis, and visualization through cloud technologies. It provides step-by-step guidance using a module of the [SOMOSPIE](https://globalcomputing.group/somospie/) engine called [GEOtiled](https://github.com/TauferLab/GEOtiled) to retrieve raw data from public sources, such as the [USGS](https://www.usgs.gov/) portal and efficiently computes terrain attributes from digital elevation models (DEMs) across large geographic areas while preserving accuracy. The data is processed into multiple files for analysis using NSDF services and stored across both public and private platforms.

By the end of the tutorial, you will learn how to:

- **Build a modular workflow** that integrates your application with NSDF services

- **Upload, download, and stream data** across **public and private storage** platforms

- Use the NSDF dashboard for **large-scale data access, visualization, and analysis**.

You can download the introductory slides [here](https://drive.google.com/file/d/16IKgoejeKarthKd4u6rWI52I2Gu4AChb/view?usp=sharing). The tutorial follows the process shown in Figure 1.

<p align="center">
    <img src="Materials/files/docs/arq.png" width="800">
    <br>
    <em>Figure 1. Workflow diagram illustrating the tutorial's process of data collection, transformation, analysis, and storage using the SOMOSPIE engine and NSDF services.</em>
</p>

---

## Directory Structure

This section provides a detailed overview of the session II directory organization and the purpose of each component.

```
session II/
├── 1.Tutorial.ipynb                 # Main tutorial notebook - START HERE
├── 2.Explore_Data.ipynb             # Data exploration and visualization notebook
├── README_session II.md              # This file
└── Materials/                        # Contains all resources and dependencies
    ├── Dockerfile                   # Docker container specification
    ├── docker-compose.yml           # Docker Compose configuration for multi-container setup
    ├── environment.yml              # Conda environment specification with all dependencies
    ├── build_jetstream_environment.sh# Script for setting up Jetstream2 environment
    ├── setup_openvisuspy.sh          # Script to configure OpenVisuspy
    ├── download_urls.txt            # URLs for data download
    ├── merged.vrt                   # Virtual raster file for GIS data
    ├── jetstream2_manual.pdf        # Manual for Jetstream2 setup
    │
    ├── files/                       # Data files and resources
    │   ├── docs/                    # Documentation images and assets
    │   │   ├── Logos.png
    │   │   ├── arq.png              # Architecture diagram
    │   │   ├── codespaces.png
    │   │   ├── Creating_container.png
    │   │   ├── tutorial.png
    │   │   ├── vscode.png
    │   │   ├── workflow-diagram.png
    │   │   └── Openvisus-somospie.png
    │   ├── json/
    │   │   └── dataverse.json       # Metadata file
    │   ├── shape_files/             # GIS shapefile data (Tennessee state boundary)
    │   │   ├── STATEFP_47.shp       # Shapefile geometry
    │   │   ├── STATEFP_47.shx       # Shapefile index
    │   │   ├── STATEFP_47.dbf       # Attribute database
    │   │   └── STATEFP_47.prj       # Projection information
    │   └── tif_files/               # GeoTIFF raster files (terrain data)
    │       ├── elevation.tif        # Digital elevation model
    │       ├── aspect.tif           # Terrain aspect data
    │       ├── slope.tif            # Slope calculations
    │       ├── hillshading.tif      # Hillshade visualization
    │       ├── pcs.tif              # Projected coordinate system raster
    │       ├── temp_combined.*      # Combined temporary raster files
    │       └── gcs.tif.aux.xml      # GeoTIFF auxiliary metadata
    │
    ├── GEOtiled/                    # GEOtiled module for terrain analysis
    │   ├── README.md                # GEOtiled documentation
    │   ├── geotiled/                # Main GEOtiled package
    │   │   ├── LICENSE
    │   │   ├── pyproject.toml       # Python project configuration
    │   │   ├── setup.cfg            # Setup configuration
    │   │   ├── README.md
    │   │   └── src/
    │   │       ├── __init__.py
    │   │       ├── geotiled.py      # Core GEOtiled implementation
    │   │       └── geotiled.egg-info/
    │   ├── demo/                    # Demo files and examples
    │   │   ├── demo.ipynb           # GEOtiled demonstration notebook
    │   │   └── demo_images/
    │   │       └── workflow.png     # Workflow diagram
    │   └── docs/                    # Sphinx documentation
    │       ├── Makefile             # Documentation build
    │       ├── make.bat
    │       └── source/
    │           ├── conf.py          # Sphinx configuration
    │           └── index.rst        # Documentation index
    │
    ├── idx_data/                    # Indexed terrain data (VISUS format)
    │   ├── Tennessee_terrain_parameters.idx # Index file for streaming data
    │   └── Tennessee_terrain_parameters/
    │       └── 0/
    │           ├── aspect/          # Aspect index tiles
    │           ├── elevation/       # Elevation index tiles
    │           ├── hillshading/     # Hillshading index tiles
    │           └── slope/           # Slope index tiles
    │
    └── openvisuspy/                 # OpenVisuspy dashboard framework
        ├── README.md                # OpenVisuspy documentation
        ├── LICENSE
        ├── pyproject.toml           # Python project configuration
        ├── TODO.md                  # Development tasks
        ├── openvisus.env            # Environment configuration
        ├── diagram.drawio           # Architecture diagram
        ├── favicon.ico
        │
        ├── data/                    # Sample datasets
        │   └── ironProt.vtk         # VTK format sample data
        │
        ├── examples/                # Usage examples
        │   ├── create_streamable/   # Examples for creating streamable data
        │   │   ├── create_streamable.py
        │   │   ├── xarray_backend.py
        │   │   ├── diagram.drawio
        │   │   ├── run.ipynb        # Executable example
        │   │   └── ReadMe.md
        │   ├── experimental/        # Experimental examples
        │   │   ├── jupyterlite-example.ipynb
        │   │   ├── README.md
        │   │   ├── server.py
        │   │   ├── 2kbit1.html
        │   │   ├── chess_zip.html
        │   │   ├── david_subsampled.html
        │   │   └── index.html
        │   ├── notebooks/           # Jupyter notebook examples
        │   │   ├── ov-dashboards.ipynb
        │   │   ├── ov-retina-rabbit-matplot.ipynb
        │   │   ├── ov-signal.ipynb
        │   │   ├── ov-vr.ipynb
        │   │   ├── test-bokeh.ipynb
        │   │   ├── test-ipywidgets.ipynb
        │   │   ├── test-matplotlib.ipynb
        │   │   ├── test-panel.ipynb
        │   │   └── test-pyvista.ipynb
        │   └── python/              # Python script examples
        │       ├── test-pyvista.py
        │       └── test-vtkvolume.py
        │
        ├── scripts/                 # Utility scripts
        │   ├── new_tag.py           # Version tagging script
        │   ├── new_tag.sh
        │   └── run_command.py
        │
        └── src/openvisuspy/         # OpenVisuspy source code
            ├── __init__.py
            ├── backend.py           # Backend abstraction
            ├── backend_cpp.py       # C++ backend
            ├── backend_py.py        # Python backend
            ├── dashboards/          # Dashboard components
            ├── probe.py             # Data probing utilities
            ├── slice.py             # Slicing utilities
            └── utils.py             # Utility functions
```

### Key Components Overview

| Component | Purpose |
|-----------|---------|
| **1.Tutorial.ipynb** | Main interactive tutorial for NSDF workflow |
| **2.Explore_Data.ipynb** | Data exploration and visualization exercises |
| **GEOtiled** | Terrain data processing and analysis module |
| **OpenVisuspy** | Dashboard and data streaming visualization framework |
| **idx_data** | Pre-indexed terrain data for efficient streaming access |
| **files** | GIS data (shapefiles, GeoTIFFs) and documentation images |

### Quick File Reference

- **Notebooks**: Start with `1.Tutorial.ipynb`, then proceed to `2.Explore_Data.ipynb`
- **Configuration**: `environment.yml` (dependencies), `docker-compose.yml` (containerization)
- **GIS Data**: Shapefiles in `files/shape_files/`, rasters in `files/tif_files/`
- **Documentation**: View `Materials/GEOtiled/README.md` and `Materials/openvisuspy/README.md`

---

## Learning Objectives & Key Concepts

### Notebook-by-Notebook Breakdown

#### **1.Tutorial.ipynb** - Main Workflow
**Topics Covered:**
- Data retrieval from USGS sources using GEOtiled
- Terrain parameter computation (elevation, slope, aspect, hillshading)
- Processing digital elevation models (DEMs) at scale
- NSDF service integration for data management
- Multi-platform storage (public and private)

**Key Functions:**
- `GEOtiled.download_dem()` - Retrieve elevation data
- `GEOtiled.compute_terrain_parameters()` - Calculate terrain attributes
- Data upload/download workflows

**Prerequisites:** Basic Python knowledge, familiarity with geospatial concepts
**Expected Runtime:** 30-45 minutes
**Output:** Processed terrain datasets in GeoTIFF format

#### **2.Explore_Data.ipynb** - Analysis & Visualization
**Topics Covered:**
- Loading and exploring terrain raster data
- Visualization using OpenVisuspy dashboards
- Statistical analysis of terrain parameters
- Interactive data exploration
- Subsetting and filtering spatial data

**Key Functions:**
- `rasterio.open()` - Load GeoTIFF files
- `xarray.DataArray` - Multidimensional data handling
- OpenVisuspy dashboard rendering

**Prerequisites:** Completion of Tutorial.ipynb
**Expected Runtime:** 20-30 minutes
**Output:** Visualizations, statistical summaries, interactive dashboards

### Core Concepts
- **DEM (Digital Elevation Model)**: Raster representation of terrain elevation
- **Terrain Parameters**: Derived attributes (slope, aspect, curvature, hillshade)
- **GeoTIFF**: Georeferenced image format preserving coordinate information
- **Shapefile**: Vector data format for geographic boundaries
- **VISUS Indexing**: Hierarchical streaming format for efficient data access

---

## Dependencies & Requirements

### Key Python Packages

| Package | Version | Purpose | Documentation |
|---------|---------|---------|----------------|
| **GEOtiled** | Latest | Terrain data processing and analysis | [GitHub](https://github.com/TauferLab/GEOtiled) |
| **rasterio** | ≥1.3.0 | Read/write GIS raster data (GeoTIFF) | [Docs](https://rasterio.readthedocs.io/) |
| **geopandas** | ≥0.11.0 | Geospatial vector data (shapefiles) | [Docs](https://geopandas.org/) |
| **xarray** | ≥2022.0 | Multidimensional array operations | [Docs](http://xarray.pydata.org/) |
| **OpenVisuspy** | Latest | Interactive dashboard visualization | [GitHub](https://github.com/sci-visus/openvisuspy) |
| **numpy** | ≥1.20.0 | Numerical computing and array operations | [Docs](https://numpy.org/doc/) |
| **pandas** | ≥1.3.0 | Data manipulation and analysis | [Docs](https://pandas.pydata.org/) |
| **matplotlib** | ≥3.5.0 | Static data visualization | [Docs](https://matplotlib.org/) |
| **GDAL** | ≥3.0 | Geospatial data abstraction | [Docs](https://gdal.org/) |
| **Jupyter** | ≥1.0 | Interactive notebooks | [Docs](https://jupyter.org/) |

### System Requirements
- **RAM**: 8 GB minimum (16 GB recommended for large datasets)
- **Disk Space**: 5 GB for tutorial materials + datasets
- **Python**: 3.10 (as specified in environment.yml)

---

## Quick Start Code Snippets

### Loading GeoTIFF Terrain Data
```python
import rasterio
from rasterio.plot import show
import numpy as np

# Load elevation data
with rasterio.open('Materials/files/tif_files/elevation.tif') as src:
    elevation = src.read(1)  # Read first band
    profile = src.profile  # Get metadata
    print(f"Shape: {elevation.shape}")
    print(f"CRS: {src.crs}")
    print(f"Bounds: {src.bounds}")
```

### Working with Shapefiles
```python
import geopandas as gpd

# Load state boundary
shapefile = gpd.read_file('Materials/files/shape_files/STATEFP_47.shp')
print(shapefile.crs)  # Projection info
print(shapefile.bounds)  # Geographic extent
```

### Statistical Analysis of Terrain
```python
import numpy as np

# Calculate terrain statistics
slope_data = elevation[~np.isnan(elevation)]
stats = {
    'mean': np.mean(slope_data),
    'std': np.std(slope_data),
    'min': np.min(slope_data),
    'max': np.max(slope_data),
    'median': np.median(slope_data)
}
print(stats)
```

### Creating xarray DataArray from GeoTIFF
```python
import xarray as xr
import rasterio

with rasterio.open('Materials/files/tif_files/elevation.tif') as src:
    data = src.read()
    transform = src.transform
    
# Create xarray with coordinates
da = xr.DataArray(
    data[0],
    dims=['y', 'x'],
    coords={
        'y': np.arange(data.shape[1]),
        'x': np.arange(data.shape[2])
    }
)
```

---

## Data Format Guide

### GeoTIFF Format Specifications
- **Channels**: Single-band (grayscale) for elevation, slope, aspect
- **Data Type**: Float32 (32-bit floating point)
- **Projection**: Project Coordinate System (PCS) for accurate measurements
- **Resolution**: ~30 meters per pixel (adjustable)
- **Spatial Extent**: Tennessee state boundary
- **Metadata**: Includes CRS, geotransform, and coordinate reference system

**Access Example**: `src.read(1)` returns 2D numpy array

### Shapefile Structure
- **Geometry**: Polygon boundaries (Tennessee state)
- **Attributes**: FIPS codes, state identifiers
- **Files Required**: `.shp` (geometry), `.shx` (index), `.dbf` (attributes), `.prj` (projection)

### VISUS Index Format (.idx)
- **Hierarchical Structure**: Multiresolution tiled pyramid
- **Performance**: Enables fast data streaming without loading entire dataset
- **Structure**: `Tennessee_terrain_parameters/0/{aspect,elevation,hillshading,slope}/`
- **Use Case**: Efficient dashboard visualization with interactive zooming

### xarray Data Structure
```
Dataset with dimensions: (time, y, x) or (Band, y, x)
Contains coordinates for spatial and temporal indexing
Supports lazy evaluation and chunked processing
```

---

## API & Integration References

### GEOtiled Core Functions
```python
# Download DEM data
GEOtiled.download_dem(
    bbox=(west, south, east, north),
    resolution=30,
    output_dir='./'
)

# Compute terrain parameters
GEOtiled.compute_parameters(
    dem_file='./elevation.tif',
    parameters=['slope', 'aspect', 'hillshading'],
    output_dir='./'
)
```

### OpenVisuspy Dashboard Components
```python
from openvisuspy import Dashboard

dashboard = Dashboard(
    data_path='Materials/idx_data/Tennessee_terrain_parameters',
    port=8989,
    resolution='multiresolution'
)
```

### xarray Common Operations
```python
# Load from GeoTIFF
da = xr.open_rasterio('elevation.tif')

# Slicing and subsetting
subset = da.isel(x=slice(100, 200), y=slice(100, 200))

# Resampling
resampled = da.coarsen(x=2, y=2).mean()

# Statistical operations
mean_val = da.mean()
std_val = da.std()
```

---

## Configuration & Customization

### GEOtiled Parameters
- **Resolution (meters)**: Adjust DEM resolution (30, 90, 250)
- **Bounding Box**: Specify geographic area of interest
- **Terrain Parameters**: Select subset of slope, aspect, curvature, hillshading
- **Output Format**: GeoTIFF, NetCDF, or other formats

### OpenVisuspy Configuration
**File**: `Materials/openvisuspy/openvisus.env`
```
VISUS_OUTPUT_DIR=./idx_data
VISUS_STREAMING_ENABLED=true
VISUS_CACHE_SIZE=512MB
```

### Performance Tuning
- **Reduce Resolution**: Lower resolution = faster processing, less memory
- **Subset Data**: Process only regions of interest
- **Enable Caching**: Cache computed terrain parameters

---

## Common Issues & Troubleshooting

### Memory Issues
**Problem**: "MemoryError when loading large GeoTIFF files"
**Solution**: 
```python
# Use windowed reading
with rasterio.open('large_file.tif') as src:
    window = rasterio.windows.Window(0, 0, 512, 512)
    data = src.read(1, window=window)
```

### Port Conflicts
**Problem**: Port 8989 already in use
**Solution**: Change port in `docker-compose.yml` or environment configuration
```yaml
environment:
  VISUS_PORT: 9999
```

### CRS Mismatches
**Problem**: Different projections between files
**Solution**: Reproject to common CRS
```python
reprojected = gpd.read_file('shapefile.shp').to_crs('EPSG:4326')
```

### Slow Dashboard Loading
**Problem**: Dashboard takes too long to render
**Solution**: Use lower resolution or pre-computed VISUS indices

---

## Real-World Use Cases

### 1. **Climate & Environmental Monitoring**
Apply to analyze elevation changes, land subsidence, or glacier retreat monitoring using time-series DEM data.

### 2. **Disaster Response & Risk Assessment**
Use for flood modeling, landslide susceptibility analysis, or post-disaster terrain change detection.

### 3. **Urban Planning & Infrastructure**
Analyze slope stability for construction projects, viewshed analysis, or optimal wind turbine placement.

### 4. **Agriculture & Land Management**
Optimize irrigation patterns based on slope, assess erosion risk, or plan forestry operations.

### 5. **Mining & Geological Analysis**
Characterize terrain for resource identification or pit design optimization.

---

## Integration with AI/ML Tools

### TensorFlow/Deep Learning
```python
import tensorflow as tf

# Convert terrain data to tensor
terrain_tensor = tf.convert_to_tensor(elevation, dtype=tf.float32)

# Build model to predict slope from elevation
model = tf.keras.Sequential([
    tf.keras.layers.Conv2D(32, 3, activation='relu', input_shape=(512, 512, 1)),
    tf.keras.layers.MaxPooling2D(2),
    tf.keras.layers.Dense(1)
])
```

### Scikit-learn for Classification
```python
from sklearn.cluster import KMeans
import numpy as np

# Cluster terrain types based on elevation and slope
X = np.column_stack([elevation.ravel(), slope.ravel()])
kmeans = KMeans(n_clusters=5).fit(X)
labels = kmeans.labels_.reshape(elevation.shape)
```

### GeoPandas for Spatial Analysis
```python
import geopandas as gpd

# Spatial join: find which cells intersect state boundary
gdf_cells = gpd.GeoDataFrame(geometry=gpd.points_from_xy(x, y))
gdf_state = gpd.read_file('STATEFP_47.shp')
intersecting = gpd.sjoin(gdf_cells, gdf_state, how='inner')
```

### Dask for Distributed Computing
```python
import dask.array as da

# Process large arrays in parallel chunks
data_dask = da.from_delayed(
    delayed_load_tif(),
    shape=(10000, 10000),
    dtype=np.float32
)
result = data_dask.mean().compute()
```

---

## Table of contents

1. [Directory Structure](#directory-structure)
2. [Learning Objectives & Key Concepts](#learning-objectives--key-concepts)
3. [Dependencies & Requirements](#dependencies--requirements)
4. [Quick Start Code Snippets](#quick-start-code-snippets)
5. [Data Format Guide](#data-format-guide)
6. [API & Integration References](#api--integration-references)
7. [Configuration & Customization](#configuration--customization)
8. [Common Issues & Troubleshooting](#common-issues--troubleshooting)
9. [Real-World Use Cases](#real-world-use-cases)
10. [Integration with AI/ML Tools](#integration-with-aiml-tools)
11. [Running the Tutorial](#running-the-tutorial)
12. [Option 1: GitHub Codespaces (Recommended)](#option-1-GitHub-codespaces-recommended)
13. [Option 2: Docker](#0ption-2-docker)
14. [Option 3: Jetstream2](#option-3-jetstream2)
15. [APPENDIX: Prerequities for Docker](#appendix-prerequities-for-docker)
16. [Community and Resources](#community-and-resources)
17. [Publications](#publications)
18. [Copyright and License](#copyright-and-license)
19. [Authors](#authors)
20. [Acknowledgments](#acknowledgments)


## Running the Tutorial
This tutorial can be executed in two different environments:

- GitHub Codespaces – a cloud-based development environment that requires no local installation beyond a GitHub account.

- Docker – a container-based approach that requires Git and Docker installed on your local machine.

You can choose one of the two options below based on your preferred setup.


## Option 1: GitHub Codespaces (Recommended)
  <p><strong>Requirements:</strong> A GitHub account. No software installation required.</p>
  <p>
    <a href="https://github.com/codespaces/new/TauferLab/NSDF-Tutorial-2025?devcontainer_path=.devcontainer/session+II/devcontainer.json">
      <img src="https://github.com/codespaces/badge.svg" alt="Open in GitHub Codespaces"> 
    </a> <= Click here to take you to create a new codespace
  </p>
  <ol>
    <li>Repository: <code>TauferLab/NSDF-Tutorial-2025</code>.</li>
    <li>Use the <strong>main</strong> branch of the repository.</li>
    <li>Dev container: <code>NSDF Tutorial – Session II</code>.</li>
    <li>Click <strong>Create Codespace</strong>.</li>
  </ol>
  <p>This process may take a few minutes. Once ready, run <code>Hands-on/session II/Tutorial.ipynb</code> in Jupyter.</p>
  <div align="center">
    <img src="Materials/files/docs/codespaces.png" width="800">
    <br><em>Figure 1. Creating GitHub Codespaces</em>
  </div>
  <div align="center">
    <img src="Materials/files/docs/Creating_container.png" width="800">
    <br><em>Figure 2. Setting up your Codespace</em>
  </div>
  <div align="center">
    <img src="Materials/files/docs/vscode.png" width="800">
    <br><em>Figure 3. VS Code interface in Codespaces</em>
  </div>
  After the creation of the codespace, proceed to Session II by clicking in the file <a href="./1.Tutorial.ipynb">hands-on/session II/1.Tutorial.ipynb</a> 
  <div align="center">
    <img src="Materials/files/docs/tutorial.png" width="800">
    <br><em>Figure 4. Opening the tutorial file</em>
  </div>

## Option 2: Docker
  <p><strong>Requirements:</strong> Git, Docker Desktop (v4.15.10 or newer), 8 GB RAM, 5 GB disk space (See Appendix for more information on the installation.</p>
  <ol>
    <li>
      <a href="https://github.com/git-guides/install-git">Install Git</a> and
      <a href="https://docs.docker.com/engine/install/">Install Docker Desktop</a>
    </li>
    <li>Open Docker Desktop before continuing.</li>
    <li>Open terminal and run:
      <pre><code>git clone https://github.com/TauferLab/NSDF-Tutorial-2025.git
cd NSDF-Tutorial-2025/session\ II/Materials/
docker-compose up -d</code></pre>
    </li>
    <li>Open <a href="http://127.0.0.1:5000/lab/tree/Tutorial.ipynb">http://127.0.0.1:5000/lab/tree/Tutorial.ipynb</a> in a browser.</li>
    <li>To stop the container:
      <pre><code>docker-compose down</code></pre>
    </li>
  </ol>

## Option 3: Jetstream2
<p><strong>Requirements:</strong> Access to a Jetstream2 instance via SSH.</p>

<h4>Initial Setup (First Time Only)</h4>
<ol>
  <li>
    If you do not already have a Jetstream2 instance, follow the
    <a href="Materials/jetstream2_manual.pdf" target="_blank">
    Jetstream2 Setup Manual
    </a>
    to create and connect to one.
  </li>

  <li>Connect to your Jetstream2 instance via SSH.</li>

<li>
  Clone the tutorial repository:
  <pre><code>git clone https://github.com/TauferLab/NSDF-Tutorial-2025.git</code></pre>
</li>

  <li>
    Navigate to the session materials directory and build the environment:
    <pre><code>cd NSDF-Tutorial-2025/hands-on/session\ II/Materials/
module load miniforge
./build_jetstream_environment.sh</code></pre>
  </li>

  <li>
    Start Jupyter Lab:
    <pre><code>cd ..
jupyter-ip.sh</code></pre>
  </li>

  <li>Open the Jupyter Lab URL printed in the terminal in your web browser.</li>

  <li>
    In Jupyter Lab, select the kernel named
    <strong>NSDF-Tutorial</strong>.
  </li>
</ol>

<h4>Starting the Environment (After Installation)</h4>
<ol>
  <li>
    Load Conda:
    <pre><code>module load miniforge
</code></pre>
  </li>

  <li>
    Navigate to the tutorial directory and start Jupyter:
    <pre><code>cd hands-on/session\ II
jupyter-ip.sh</code></pre>
  </li>

  <li>Open the Jupyter Lab URL printed in the terminal in your browser.</li>
</ol>

<h4>Accessing OpenVisuspy Dashboards</h4>
<ol>
  <li>
    From your local machine, create an SSH tunnel to forward the dashboard port:
    <pre><code>ssh -L 8989:127.0.0.1:8989 &lt;Jetstream Native SSH&gt;</code></pre>
  </li>

  <li>
    After executing the corresponding dashboard cell in Jupyter, open your browser and navigate to:
    <pre><code>http://localhost:8989</code></pre>
  </li>
</ol>


## APPENDIX: Prerequisites

> :bulb: ONLY IF YOU RUN THE TUTORIAL WITH DOCKER
 
To install Git and Docker Desktop on your computer, follow these steps:

- **To install Git**: Follow the [installation instructions](https://github.com/git-guides/install-git) for your operating system (Linux, Windows, or Mac).
- **To install Docker Desktop**: Follow the [installation instructions](https://docs.docker.com/engine/install/) for your operating system (Linux, Windows, or Mac). -
- **_Be sure you are running the most recent version of Docker! Previous versions to 4.15.10 may not work._**

After installation, confirm that both tools are correctly set up by executing the following commands in your terminal.

> :bulb: **Note:** For Windows users, we recommend using the [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4) terminal for these verifications.

- To verify the GitHub installation:

```
# Check the Git version
git --version
```

Expected output (NOTE: git version can be different):

```
git version 3.12.0
```

- To verify Docker Desktop installation: Open the Docker Desktop application before running Docker commands.

```
# Check the Docker installation information
docker info
```

Expected output:

```
Client:
 Version:    24.0.5
 Context:    default
 Debug Mode: false

Server:
 Containers: 120
  Running: 0
  Paused: 0
  Stopped: 120
 Images: 48
```

> :bulb: **Note:** The specific numbers in the output might vary based on your installation details and additional information may also appear.

<h3>Using Docker</h3>
<pre><code>cd Materials
docker build --platform linux/amd64 -t globalcomputinglab/somospie_openvisus .
docker pull --platform linux/amd64 globalcomputinglab/somospie_openvisus:tutorial
docker run -d -p 5000:5000 -p 8989:8989 --name tutorial --platform linux/amd64 globalcomputinglab/somospie_openvisus</code></pre>
<p>Visit: <code>http://localhost:5000/</code></p>

<h3>Using Your Local Machine</h3>
<ol>
    <li>Install <a href="https://www.anaconda.com/download/">Conda</a></li>
    <li>Run:
      <pre><code>cd Materials
conda env create -f environment.yml
conda activate NSDF-Tutorial
cd GEOtiled/geotiled
pip install -e .
./setup_openvisuspy.sh
jupyter notebook Tutorial.ipynb</code></pre>
    </li>
</ol>

## Community and Resources:

NSDF and SOMOSPIE are open-source projects. Questions, discussions, and contributions are welcome. Contributions can include new packages, bug fixes, documentation, or even new core features.


NSDF Resources:

- **Slack workspace**: [nsdf-workspace](https://nsdf-workspace.slack.com/).
- **Github Discussions**: [issues](https://github.com/nsdf-fabric/catalog-comparison-tool/issues): Discussions and Q&A.
- **Mailing list**: [https://groups.google.com/g/nsdf](https://groups.google.com/g/nsdf) - nsdf@googlegroups.com
- **LinkedIN**: [LinkedIn](https://www.linkedin.com/company/76216771/admin/dashboard/)) 

OpenVisus Resources:

- **Github:** [Open Source distribution of the ViSUS capabilities](https://github.com/sci-visus/openvisus)
- **Webpage:** [VISUS - High performance Big Data Analysis and Visualization Solutions](https://visus.org/)

SOMOSPIE Resources:

- **GitHub:** [SOMOSPIE software](https://github.com/TauferLab/SOMOSPIE)
- **Webpage:** [SOMOSPIE overview](https://globalcomputing.group/somospie)
- **Questions:** Michela Taufer [mtaufer@utk.edu](email:mtaufer@utk.edu)

GEOtiled Resources:

- **GitHub:** [GEOtiled software](https://github.com/TauferLab/GEOtiled)
- **Webpage:** [GEOtiled overview](https://github.com/TauferLab/GEOtiled)
- **Questions:** Michela Taufer [mtaufer@utk.edu](email:mtaufer@utk.edu)


## Publications

[1] Roa, C., Olaya, P., Llamas, R., Vargas, R., Taufer, M. GEOtiled: A Scalable Workflow for Generating Large Datasets of High-Resolution Terrain Parameters. Proceedings of the 32nd International Symposium on High-Performance Parallel and Distributed Computing (2023). [link](https://dl.acm.org/doi/abs/10.1145/3588195.3595941)

[2] Olaya, Paula, and Luettgau, Jakob, and Roa, Camila, and Llamas, Richardo, and Vargas, Rodrigo, and Wen, Sophia, and Chung, I-Hsin, and Seelam, Seetharami, and Park, Yoonho, and Lofstead, Jay, and others. Enabling Scalability in the Cloud for Scientific Workflows: An Earth Science Use Case. IEEE International Conference on Cloud Computing (2023). [link](https://research.ibm.com/publications/enabling-scalability-in-the-cloud-for-scientific-workflows-an-earth-science-use-case)

[3] D. Rorabaugh, M. Guevara, R. Llamas, J. Kitson, R. Vargas, and M. Taufer. SOMOSPIE: A modular SOil MOisture SPatial Inference Engine based on data-driven decisions. In Proceedings of the 2019 15th International Conference on eScience (eScience) (2019). [link](https://ieeexplore.ieee.org/document/9041768)

[4] V. Pascucci and R. J. Frank, "Global Static Indexing for Real-Time Exploration of Very Large Regular Grids," SC '01: Proceedings of the 2001 ACM/IEEE Conference on Supercomputing, Denver, CO, USA, 2001, pp. 45-45, [link](http://doi.org/10.1145/582034.582036)

[5] Pascucci, Valerio, et al. "The ViSUS visualization framework." High Performance Visualization. Chapman and Hall/CRC, 2012. 439-452. [link](https://www.taylorfrancis.com/chapters/edit/10.1201/b12985-32/visus-visualization-frame[…]a-gyulassy-cameron-christensen-sujin-philip-sidharth-kumar)

[6] Brian Summa, Giorgio Scorzelli, Ming Jiang, Peer-Timo Bremer, and Valerio Pascucci. 2011. Interactive editing of massive imagery made simple: Turning Atlanta into Atlantis. ACM Trans. Graph. 30, 2, Article 7 (April 2011), 13 pages. [link](https://doi.org/10.1145/1944846.1944847)


## Copyright and License

Copyright (c) 2024, Global Computing Lab

Catalog Comparison Tool is distributed under the terms of the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) with LLVM Exceptions.
See [LICENSE](Materials/LICENSE) for more details.


## Authors

This project was created by the [NSDF team](https://nationalsciencedatafabric.org/contributors.html) and the SOMOSPIE team. To reach out email us at [info@nationalsciencedatafabric.org](email:info@nationalsciencedatafabric.org) and Dr. Michela Taufer [mtaufer@utk.edu](email:mtaufer@utk.edu).


## Acknowledgments

The authors of this tutorial would like to express their gratitude to:

- NSF through the awards 2138811, 2103845, 2334945, 2138296, and 2331152.
- The Dataverse team [link](https://dataverse.org/about)
- Vargas Lab led by Dr. Rodrigo Vargas [link](https://www.udel.edu/academics/colleges/canr/departments/plant-and-soil-sciences/faculty-staff/rodrigo-vargas/)

Any opinions, findings, conclusions, or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.


<!-- 
  <ul>
    <li><a href="https://nsdf-workspace.slack.com/">Slack workspace</a></li>
    <li><a href="https://github.com/nsdf-fabric/catalog-comparison-tool/issues">GitHub Discussions</a></li>
    <li><a href="https://groups.google.com/g/nsdf">Mailing List</a></li>
    <li><a href="https://twitter.com/FabricNsdf">Twitter: @FabricNsdf</a></li>
  </ul>

  <h2 id="publications">Related Publications</h2>
  <ul>
    <li><a href="https://dl.acm.org/doi/abs/10.1145/3588195.3595941">GEOtiled: HPDC 2023</a></li>
    <li><a href="https://research.ibm.com/publications/enabling-scalability-in-the-cloud-for-scientific-workflows-an-earth-science-use-case">Earth Science Use Case: IEEE Cloud 2023</a></li>
    <li><a href="https://ieeexplore.ieee.org/document/9041768">SOMOSPIE: eScience 2019</a></li>
  </ul>


<h2 id="license">Copyright and License</h2>
  <p>&copy; 2024 Global Computing Lab. Licensed under <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache 2.0</a>.</p>

<h2 id="authors">Authors</h2>
  <p>Created by the <a href="https://nationalsciencedatafabric.org/contributors.html">NSDF</a> and SOMOSPIE teams. Contact: <a href="mailto:mtaufer@utk.edu">Michela Taufer</a></p>

<h2 id="acknowledgments">Acknowledgments</h2>
  <p>Supported by NSF grants 2138811, 2103845, 2334945, 2138296, and 2331152.<br>
  Thanks to Dataverse, Wasabi, and the Vargas Lab.</p>
--> 

<!-- 
-----
## Prerequisites

> :bulb: **Note:** These prerequisites are required to run the section 3 [Running the Tutorial with Docker](#running-the-tutorial-with-docker) if your not using docker please skip this section and continue with the section 2 [Running the Tutorial with GitHub Codespaces](#running-the-tutorial-with-github-codespaces)

Before starting this tutorial, ensure you have installed Git and Docker Desktop on your computer.

- **To install Git**: Follow the [installation instructions](https://github.com/git-guides/install-git) for your operating system (Linux, Windows, or Mac).
- **To install Docker Desktop**: Follow the [installation instructions](https://docs.docker.com/engine/install/) for your operating system (Linux, Windows, or Mac). **_Be sure you are running the most recent version of Docker! Previous versions to 4.15.10 may not work._**

After installation, confirm that both tools are correctly set up by executing the following commands in your terminal.

> :bulb: **Note:** For Windows users, we recommend using the [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4) terminal for these verifications.

- To verify the GitHub installation:

```
# Check the Git version
git --version
```

Expected output (NOTE: git version can be different):

```
git version 3.12.0
```

- To verify Docker Desktop installation: Make sure you open the Docker Desktop application before running Docker commands.

```
# Check the Docker installation information
docker info
```

Expected output:

```
Client:
 Version:    24.0.5
 Context:    default
 Debug Mode: false

Server:
 Containers: 120
  Running: 0
  Paused: 0
  Stopped: 120
 Images: 48
```

> :bulb: **Note:** The specific numbers in the output might vary based on your installation details and additional information may also appear.

## Running the Tutorial with GitHub Codespaces

> :bulb: **Note:** To follow this tutorial using the GitHub Codespaces you must have a GitHub Account

Use your GitHub account to run this tutorial with GitHub Codespaces

Please click the next button to open in GitHub Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/TauferLab/NSDF-Tutorial-2025?devcontainer_path=.devcontainer/session+II/devcontainer.json)

Now follow these steps to set up your virtual environment using GitHub codespaces:

Verify that you are using the `main` branch, the repository name `TauferLab/NSDF-Tutorial-2025` and the dev container configuration `NSDF Tutorial - Session II`. Then click on `Create Codespace`

<p align="center">
    <img src="Materials/files/docs/codespaces.png" width="800">
    <br>
    <em>Figure 2. Creating GitHub codespaces.</em>
</p>

> :bulb: **Note:** This process may take a couple of minutes.

<p align="center">
    <img src="Materials/files/docs/Creating_container.png" width="800">
    <br>
    <em>Figure 3. Setting up your Codespace.</em>
</p>

After creating the codespace, execute the tutorial notebook (Tutorial.ipynb)

<p align="center">
    <img src="Materials/files/docs/vscode.png" width="800">
    <br>
    <em>Figure 4. VS Code in GitHub Codespaces.</em>
</p>

## Running the Tutorial with Docker

> :bulb: **Note:** To follow this tutorial you must have a computer with minimum **8 GB of RAM** and **5 GB of free disk**
>
> To run this tutorial, we have prepared a Docker container named [`globalcomputinglab/somospie_openvisus`](https://hub.docker.com/repository/docker/globalcomputinglab/somospie_openvisus/general) that includes all necessary software. Ensure you have installed Docker Desktop as outlined in the [Prerequisites](#prerequisites).

**:bulb: Note: Before following the next steps, make sure to open the Docker Desktop Application.**

Now open the terminal and follow the next steps to deploy the tutorial in the Docker container:

```
# Clone the tutorial repository:
git clone https://github.com/nsdf-fabric/Tutorial_2024_IEEE_VIS.git

# Navigate to the tutorial directory:
cd Tutorial_2024_IEEE_VIS/session II/Materials/

# Launch the Docker environment:
docker-compose up -d
```

:bulb: **Note:** If you get a `permission denied` error, please add `sudo` before the command. For example, `sudo docker-compose up -d`

After executing the above command, open your preferred web browser (such as Google Chrome, Firefox, or Safari) and enter the following URL to access Jupyter Lab and the tutorial notebook (Tutorial.ipynb): http://127.0.0.1:5000/lab/tree/Tutorial.ipynb

When you have finished the tutorial, ensure to stop the Docker container to free up resources. Do this by entering the following command in your terminal:

```
# Stop the Docker container
docker-compose down
```

## APPENDIX: Installing the Tutorial from the Beginning

This session provides detailed instructions for setting up and running the workflow from the beginning. You have two options: you can set up a [Docker container](#using-a-docker-container) or configure your [local machine](#using-your-local-machine) for deployment. These instructions are designed for users with more advanced technical skills, and they can be customized to incorporate your application with GEOtiled.

### Using a Docker container

To build the docker image in your local machine:

```
cd Materials
docker build --platform linux/amd64 -t globalcomputinglab/somospie_openvisus .
```

To pull the image from Dockerhub:

```
docker pull --platform linux/amd64 globalcomputinglab/somospie_openvisus:tutorial
```

To run:

```
docker run -d -p 5000:5000 -p 8989:8989 --name tutorial --platform linux/amd64 globalcomputinglab/somospie_openvisus
```

Follow this URL to run the Jupyter Notebook `1.Tutorial.ipynb`:

```
http://localhost:5000/
```

### Using your local machine

[Conda](https://www.anaconda.com/download/) is used to control all the dependencies in this project; the file `environment.yml` contains the list of required versions:

```
# environment.yml

name: somospie
channels:
  - conda-forge
  - defaults
dependencies:
  - python=3.10
  - gdal
  - ipykernel==6.29.2
  - ipywidgets==8.1.2
  - xmltodict
  - requests
  - colorcet
  - jupyterlab
  - tifffile
  - rasterio
  - imagecodecs
  - boto3
  - param==2.0.2
  - bokeh==3.3.4
  - ipywidgets-bokeh==1.5.0
  - pip
  - pip:
      - panel==1.3.8
      - OpenVisusNoGui==2.2.128

```

To install the dependencies in your local machine, use the following command:

> :bulb: **Note:** Conda is mandatory in this step, use [this](https://www.anaconda.com/download/) link to install it

```
cd Materials
conda env create -f environment.yml
```

Activate the virtual environment:

```
conda activate NSDF-Tutorial
```

Install GEOtiled library:
```
cd GEOtiled/geotiled
pip install -e .
```

Install OpenVisus dependencies:

```
# use this file to install openvisus in your local machine
./setup_openvisuspy.sh
```

Run the Jupyter Notebook and follow the internal instructions:

```
jupyter notebook Tutorial.ipynb
```

## Community and Resources

NSDF and SOMOSPIE are open-source projects. Questions, discussion, and contributions are welcome. Contributions can be anything from new packages to bug fixes, documentation, or even new core features.

NSDF Resources:

- **Slack workspace**: [nsdf-workspace](https://nsdf-workspace.slack.com/).
- **Github Discussions**: [issues](https://github.com/nsdf-fabric/catalog-comparison-tool/issues): Discussions and Q&A.
- **Mailing list**: [https://groups.google.com/g/nsdf](https://groups.google.com/g/nsdf) - nsdf@googlegroups.com
- **Twitter**: [@FabricNsdf](https://twitter.com/FabricNsdf)

OpenVisus Resources:

- **Github:** [Open Source distribution of the ViSUS capabilities](https://github.com/sci-visus/openvisus)
- **Webpage:** [VISUS - High performance Big Data Analysis and Visualization Solutions](https://visus.org/)

SOMOSPIE Resources:

- **GitHub:** [SOMOSPIE software](https://github.com/TauferLab/SOMOSPIE)
- **Webpage:** [SOMOSPIE overview](https://globalcomputing.group/somospie)
- **Questions:** Michela Taufer [mtaufer@utk.edu](email:mtaufer@utk.edu)

## Related Publications

[1] Roa, C., Olaya, P., Llamas, R., Vargas, R., Taufer, M. GEOtiled: A Scalable Workflow for Generating Large Datasets of High-Resolution Terrain Parameters. Proceedings of the 32nd International Symposium on High-Performance Parallel and Distributed Computing (2023). [link](https://dl.acm.org/doi/abs/10.1145/3588195.3595941)

[2] Olaya, Paula and Luettgau, Jakob and Roa, Camila and Llamas, Richardo and Vargas, Rodrigo and Wen, Sophia and Chung, I-Hsin and Seelam, Seetharami and Park, Yoonho and Lofstead, Jay and others Enabling Scalability in the Cloud for Scientific Workflows: An Earth Science Use Case. IEEE International Conference on Cloud Computing (2023). [link](https://research.ibm.com/publications/enabling-scalability-in-the-cloud-for-scientific-workflows-an-earth-science-use-case)

[3] D. Rorabaugh, M. Guevara, R. Llamas, J. Kitson, R. Vargas, and M. Taufer. SOMOSPIE: A modular SOil MOisture SPatial Inference Engine based on data-driven decisions. In Proceedings of the 2019 15th International Conference on eScience (eScience) (2019). [link](https://ieeexplore.ieee.org/document/9041768)

[4] V. Pascucci and R. J. Frank, "Global Static Indexing for Real-Time Exploration of Very Large Regular Grids," SC '01: Proceedings of the 2001 ACM/IEEE Conference on Supercomputing, Denver, CO, USA, 2001, pp. 45-45, [link](http://doi.org/10.1145/582034.582036)

[5] Pascucci, Valerio, et al. "The ViSUS visualization framework." High Performance Visualization. Chapman and Hall/CRC, 2012. 439-452. [link](https://www.taylorfrancis.com/chapters/edit/10.1201/b12985-32/visus-visualization-frame[…]a-gyulassy-cameron-christensen-sujin-philip-sidharth-kumar)

[6] Brian Summa, Giorgio Scorzelli, Ming Jiang, Peer-Timo Bremer, and Valerio Pascucci. 2011. Interactive editing of massive imagery made simple: Turning Atlanta into Atlantis. ACM Trans. Graph. 30, 2, Article 7 (April 2011), 13 pages. [link](https://doi.org/10.1145/1944846.1944847)

## Copyright and License

Copyright (c) 2024, Global Computing Lab

Catalog Comparison Tool is distributed under terms of the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) with LLVM Exceptions.
See [LICENSE](Materials/LICENSE) for more details.

## Authors

This project was created by the [NSDF team](https://nationalsciencedatafabric.org/contributors.html) and the SOMOSPIE team. To reach out email us at [info@nationalsciencedatafabric.org](email:info@nationalsciencedatafabric.org) and Dr. Michela Taufer [mtaufer@utk.edu](email:mtaufer@utk.edu).

## Acknowledgments

The authors of this tutorial would like to express their gratitude to:

- NSF through the awards 2138811, 2103845, 2334945, 2138296, and 2331152.
- The Dataverse team [link](https://dataverse.org/about)
- Vargas Lab led by Dr. Rodrigo Vargas [link](https://www.udel.edu/academics/colleges/canr/departments/plant-and-soil-sciences/faculty-staff/rodrigo-vargas/)

Any opinions, findings, conclusions, or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.
-> 
