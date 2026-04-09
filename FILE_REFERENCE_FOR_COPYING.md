# NSDF Tutorial: File Reference Guide for Other Projects

## Comprehensive File Paths & Copy Instructions

### 📋 Critical Files to Copy (Priority Order)

| File Name | Full Path | Purpose | Best For | Copy Command |
|-----------|-----------|---------|----------|--------------|
| **Session II README** | `hands-on/session II/README_session II.md` | Comprehensive geospatial/GIS reference with code examples, dependencies, APIs, troubleshooting | Geospatial, terrain analysis, GIS projects | `cp hands-on/session\ II/README_session\ II.md your-project/docs/REFERENCE_GEOSPATIAL.md` |
| **Session III README** | `hands-on/session III/README_session III.md` | Comprehensive petascale/remote data reference with ML integration examples | Climate, ocean data, petascale datasets, remote access | `cp hands-on/session\ III/README_session\ III.md your-project/docs/REFERENCE_PETASCALE.md` |
| **Session II Environment** | `hands-on/session II/Materials/environment.yml` | Conda environment with geospatial packages (rasterio, geopandas, xarray) | Geospatial Python projects | `cp hands-on/session\ II/Materials/environment.yml your-project/environment.yml` |
| **Session III Environment** | `hands-on/session III/environment.yml` | Conda environment with remote data packages (xarray, zarr, netcdf4) | Petascale/remote data projects | `cp hands-on/session\ III/environment.yml your-project/environment.yml` |
| **Session II Dockerfile** | `hands-on/session II/Materials/Dockerfile` | Docker container for geospatial/GIS analysis | Containerized geospatial projects | `cp hands-on/session\ II/Materials/Dockerfile your-project/Dockerfile` |
| **Session III Dockerfile** | `hands-on/session III/Dockerfile` | Docker container for petascale data analysis | Containerized climate/data projects | `cp hands-on/session\ III/Dockerfile your-project/Dockerfile` |

---

### 📁 Configuration & Setup Scripts

| File Name | Full Path | Purpose | Best For | Copy Command |
|-----------|-----------|---------|----------|--------------|
| **Docker Compose (S2)** | `hands-on/session II/Materials/docker-compose.yml` | Multi-container orchestration for Jupyter + dashboard | Container orchestration projects | `cp hands-on/session\ II/Materials/docker-compose.yml your-project/docker-compose.yml` |
| **Setup Script (S3)** | `hands-on/session III/setup.sh` | Automated environment setup for local machines | Quick-start automation | `cp hands-on/session\ III/setup.sh your-project/scripts/setup.sh && chmod +x your-project/scripts/setup.sh` |
| **Jetstream Setup (S2)** | `hands-on/session II/Materials/build_jetstream_environment.sh` | Specialized setup for Jetstream2 HPC environment | HPC/cloud deployment | `cp hands-on/session\ II/Materials/build_jetstream_environment.sh your-project/scripts/build_environment.sh && chmod +x your-project/scripts/build_environment.sh` |

---

### 🎓 Notebook Reference (Study Patterns, Don't Copy Directly)

| File Name | Full Path | Learn | Key Patterns |
|-----------|-----------|-------|--------------|
| **Earth Science Tutorial** | `hands-on/session II/1.Tutorial.ipynb` | Data processing workflow | GEOtiled API usage, terrain computation, NSDF integration |
| **Data Exploration** | `hands-on/session II/2.Explore_Data.ipynb` | Analysis patterns | xarray operations, visualization, statistics |
| **Petascale Analysis** | `hands-on/session III/3.Tutorial_PetascaleAnalysis.ipynb` | Remote data handling | Remote dataset access, lazy loading, chunked computing |

---

### 📚 Extract These Sections from READMEs as Standalone Docs

| Document to Create | Extract From | Source Path | Content |
|-------------------|--------------|-------------|---------|
| `docs/DEPENDENCIES.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 154-185) | Dependencies table, package versions, documentation links |
| `docs/CODE_EXAMPLES.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 187-245) | Quick start code snippets ready to use |
| `docs/DATA_FORMATS.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 247-290) | Data format specifications and structures |
| `docs/API_REFERENCE.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 292-330) | API functions and usage patterns |
| `docs/TROUBLESHOOTING.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 332-390) | Common issues and solutions |
| `docs/ML_INTEGRATION.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 392-445) | ML/AI tool integration examples |
| `docs/USE_CASES.md` | Session II OR III README | `hands-on/session II/README_session II.md` (lines 354-370) | Real-world applications |

---

### 🗂️ Directory Structure Reference Files

| Source Path | File Type | Use For |
|------------|-----------|---------|
| `hands-on/session II/Materials/` | Directory | Reference directory structure for geospatial projects |
| `hands-on/session II/Materials/files/` | Subdirectory | Understanding data file organization (GIS data, documentation) |
| `hands-on/session II/Materials/GEOtiled/` | External package | Reference for integrating existing Python packages |
| `hands-on/session III/` | Directory | Reference directory structure for petascale projects |

---

## 🚀 Quick Copy Recipes by Project Type

### **For Geospatial/GIS Projects**

```bash
# Create project structure
mkdir -p your-geo-project/{docs,scripts,docker}

# Copy critical files
cp hands-on/session\ II/README_session\ II.md your-geo-project/docs/REFERENCE.md
cp hands-on/session\ II/Materials/environment.yml your-geo-project/
cp hands-on/session\ II/Materials/Dockerfile your-geo-project/
cp hands-on/session\ II/Materials/docker-compose.yml your-geo-project/
cp hands-on/session\ II/Materials/build_jetstream_environment.sh your-geo-project/scripts/
chmod +x your-geo-project/scripts/build_jetstream_environment.sh
```

### **For Climate/Petascale Data Projects**

```bash
# Create project structure
mkdir -p your-climate-project/{docs,scripts,docker}

# Copy critical files
cp hands-on/session\ III/README_session\ III.md your-climate-project/docs/REFERENCE.md
cp hands-on/session\ III/environment.yml your-climate-project/
cp hands-on/session\ III/Dockerfile your-climate-project/
cp hands-on/session\ III/setup.sh your-climate-project/scripts/
chmod +x your-climate-project/scripts/setup.sh
```

### **For ML/AI-Heavy Projects**

```bash
# Create project structure
mkdir -p your-ml-project/{docs,scripts,docker,requirements}

# Copy both READMEs
cp hands-on/session\ II/README_session\ II.md your-ml-project/docs/REFERENCE_GEOSPATIAL.md
cp hands-on/session\ III/README_session\ III.md your-ml-project/docs/REFERENCE_PETASCALE.md

# Copy environments
cp hands-on/session\ II/Materials/environment.yml your-ml-project/requirements/geo.txt
cp hands-on/session\ III/environment.yml your-ml-project/requirements/petascale.txt

# Copy Docker files and merge
cp hands-on/session\ II/Materials/Dockerfile your-ml-project/docker/Dockerfile.geo
cp hands-on/session\ III/Dockerfile your-ml-project/docker/Dockerfile.petascale
```

---

## 📍 Complete Directory Tree for Reference

```
nsdf-tutorial/
└── hands-on/
    ├── session II/
    │   ├── README_session II.md                    ← CRITICAL: Copy this
    │   ├── 1.Tutorial.ipynb                        (study patterns only)
    │   ├── 2.Explore_Data.ipynb                    (study patterns only)
    │   └── Materials/
    │       ├── environment.yml                     ← CRITICAL: Copy this
    │       ├── Dockerfile                          ← CRITICAL: Copy this
    │       ├── docker-compose.yml                  ← Copy if using containers
    │       ├── build_jetstream_environment.sh      ← Copy if using HPC
    │       ├── setup_openvisuspy.sh               (optional)
    │       ├── download_urls.txt                   (project-specific)
    │       ├── merged.vrt                         (data-specific)
    │       ├── files/                             (data files - don't copy)
    │       ├── GEOtiled/                          (external dependency)
    │       ├── idx_data/                          (data-specific)
    │       └── openvisuspy/                       (external dependency)
    │
    ├── session III/
    │   ├── README_session III.md                   ← CRITICAL: Copy this
    │   ├── 3.Tutorial_PetascaleAnalysis.ipynb     (study patterns only)
    │   ├── environment.yml                         ← CRITICAL: Copy this
    │   ├── Dockerfile                              ← CRITICAL: Copy this
    │   ├── setup.sh                                ← Copy if using local setup
    │   ├── files/                                 (data files - don't copy)
    │   └── images/                                (tutorial images - don't copy)
```

---

## 💾 Extraction Workflow Example

### Step 1: Create Local Projects Directory
```bash
mkdir ~/projects/my-geospatial-project
cd ~/projects/my-geospatial-project
mkdir -p docs scripts docker
```

### Step 2: Copy README for Reference
```bash
cp /workspaces/nsdf-tutorial/hands-on/session\ II/README_session\ II.md ./docs/REFERENCE.md
```

### Step 3: Copy Configuration Files
```bash
cp /workspaces/nsdf-tutorial/hands-on/session\ II/Materials/environment.yml ./
cp /workspaces/nsdf-tutorial/hands-on/session\ II/Materials/Dockerfile ./docker/
```

### Step 4: Extract Specific Sections (Manual)
```bash
# Open REFERENCE.md and copy-paste these sections to new files:
# - Dependencies section → docs/DEPENDENCIES.md
# - Quick Start Code Snippets → docs/CODE_EXAMPLES.md
# - Data Format Guide → docs/DATA_FORMATS.md
# - Common Issues & Troubleshooting → docs/TROUBLESHOOTING.md
# - Integration with AI/ML Tools → docs/ML_INTEGRATION.md
```

### Step 5: Customize for Your Project
```bash
# Edit environment.yml to add/remove packages
# Edit Dockerfile to match your Python version
# Edit REFERENCE.md to add project-specific information
```

---

## 🎯 Which Files to Keep Synchronized

| File | Sync Frequency | Why |
|------|---------------|-----|
| `README_session II.md` | Regularly | Contains evolving best practices and patterns |
| `README_session III.md` | Regularly | Contains evolving best practices and patterns |
| `environment.yml` | Per major update | Package versions may change; dependencies may be added |
| `Dockerfile` | Per major update | Base images, dependencies may need updates |
| `setup.sh` | Rarely | Setup logic remains stable; adapt once |
| `docker-compose.yml` | As needed | Only if you maintain containers |

---

## 📌 Summary Table: What to Copy

| Category | Copy? | How Often | Purpose |
|----------|-------|-----------|---------|
| **README Files** | ✅ YES | Every use | Reference documentation |
| **environment.yml** | ✅ YES | Every project | Reproducible environments |
| **Dockerfile** | ✅ YES | Every container project | Container reproducibility |
| **Setup Scripts** | ✅ YES | Once, then customize | Automation |
| **docker-compose.yml** | ✅ YES (if needed) | For containers only | Multi-container setup |
| **Notebooks** | ❌ NO | Study only | Learn patterns, don't reuse directly |
| **Data Files** | ❌ NO | Never | Project-specific data |
| **External Packages** | ❌ NO | Use via pip/conda | Already in environment.yml |

---

## 🔗 Quick Reference Links in READMEs

Both README files already contain direct links to:
- Package documentation (rasterio, xarray, pandas, etc.)
- GitHub repositories (GEOtiled, OpenVisus)
- Official frameworks (TensorFlow, PyTorch, Scikit-learn)
- Data platforms (OSDF, Pelican, USGS)

**Benefit for AI tools**: These links are already documented and can be used for context!
