#!/bin/bash

# Create temporary directory for assembly
TEMP_DIR="/tmp/nsdf-tutorial-hands-on"
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# Create directory structure
mkdir -p "$TEMP_DIR/hands-on/session II/Materials"
mkdir -p "$TEMP_DIR/hands-on/session III"

# Copy Session II files
echo "Copying Session II critical files..."
cp "hands-on/session II/README_session II.md" "$TEMP_DIR/hands-on/session II/"
cp "hands-on/session II/Materials/environment.yml" "$TEMP_DIR/hands-on/session II/Materials/"
cp "hands-on/session II/Materials/Dockerfile" "$TEMP_DIR/hands-on/session II/Materials/"
cp "hands-on/session II/Materials/docker-compose.yml" "$TEMP_DIR/hands-on/session II/Materials/"
cp "hands-on/session II/Materials/build_jetstream_environment.sh" "$TEMP_DIR/hands-on/session II/Materials/"
cp "hands-on/session II/Materials/setup_openvisuspy.sh" "$TEMP_DIR/hands-on/session II/Materials/"

# Copy Session III files
echo "Copying Session III critical files..."
cp "hands-on/session III/README_session III.md" "$TEMP_DIR/hands-on/session III/"
cp "hands-on/session III/environment.yml" "$TEMP_DIR/hands-on/session III/"
cp "hands-on/session III/Dockerfile" "$TEMP_DIR/hands-on/session III/"
cp "hands-on/session III/setup.sh" "$TEMP_DIR/hands-on/session III/"

# Copy the reference guide
echo "Copying reference guide..."
cp "FILE_REFERENCE_FOR_COPYING.md" "$TEMP_DIR/"

# Create a README for the archive
cat > "$TEMP_DIR/README.md" << 'INNEREOF'
# NSDF Tutorial - Hands-On Reference Files

This archive contains essential configuration files and documentation from the NSDF Tutorial that can be referenced and adapted for other projects.

## 📋 Contents

- **Session II**: Geospatial/GIS workflow reference with terrain analysis
- **Session III**: Petascale/remote data workflow reference with climate data

## 🚀 How to Use

1. Extract this archive
2. Read `FILE_REFERENCE_FOR_COPYING.md` for detailed instructions on which files to copy
3. Copy the README files to your project for comprehensive reference documentation
4. Adapt `environment.yml` and `Dockerfile` for your specific needs
5. Customize setup scripts for your environment

## 📁 Directory Structure

```
nsdf-tutorial-hands-on/
├── README.md                          (This file)
├── FILE_REFERENCE_FOR_COPYING.md      (Detailed reference guide)
├── hands-on/
│   ├── session II/
│   │   ├── README_session II.md       (Geospatial reference)
│   │   └── Materials/
│   │       ├── environment.yml        (Python dependencies)
│   │       ├── Dockerfile             (Container config)
│   │       ├── docker-compose.yml     (Multi-container setup)
│   │       ├── build_jetstream_environment.sh
│   │       └── setup_openvisuspy.sh
│   │
│   └── session III/
│       ├── README_session III.md      (Petascale reference)
│       ├── environment.yml            (Python dependencies)
│       ├── Dockerfile                 (Container config)
│       └── setup.sh                   (Setup automation)
```

## 📚 Quick Start

### For Geospatial Projects
```bash
cp hands-on/session\ II/README_session\ II.md your-project/docs/
cp hands-on/session\ II/Materials/environment.yml your-project/
cp hands-on/session\ II/Materials/Dockerfile your-project/
```

### For Petascale/Climate Projects
```bash
cp hands-on/session\ III/README_session\ III.md your-project/docs/
cp hands-on/session\ III/environment.yml your-project/
cp hands-on/session\ III/Dockerfile your-project/
```

## 🔗 Resources

- **NSDF**: https://nationalsciencedatafabric.org/
- **GEOtiled**: https://github.com/TauferLab/GEOtiled
- **OpenVisus**: https://github.com/sci-visus/openvisus

## ℹ️ Notes

- README files contain comprehensive code examples and API references
- environment.yml files specify exact Python package versions for reproducibility
- Dockerfile files can be adapted for your specific needs
- Setup scripts provide automation templates

See `FILE_REFERENCE_FOR_COPYING.md` for complete paths and detailed instructions.
INNEREOF

# Create the zip file
echo "Creating zip file..."
cd /tmp
zip -r /workspaces/nsdf-tutorial/nsdf-tutorial-hands-on.zip nsdf-tutorial-hands-on/ > /dev/null 2>&1

# Verify creation
if [ -f /workspaces/nsdf-tutorial/nsdf-tutorial-hands-on.zip ]; then
    SIZE=$(ls -lh /workspaces/nsdf-tutorial/nsdf-tutorial-hands-on.zip | awk '{print $5}')
    echo "✅ Zip file created successfully!"
    echo "   Location: /workspaces/nsdf-tutorial/nsdf-tutorial-hands-on.zip"
    echo "   Size: $SIZE"
    
    # Show contents
    echo ""
    echo "📦 Archive contents:"
    unzip -l /workspaces/nsdf-tutorial/nsdf-tutorial-hands-on.zip
else
    echo "❌ Failed to create zip file"
    exit 1
fi

# Cleanup
rm -rf "$TEMP_DIR"
