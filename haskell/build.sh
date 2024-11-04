#!/bin/bash

# Step 1: Clean up the build directory
echo "Cleaning up the build directory..."
rm -rf build
mkdir -p build

# Step 2: Compile the project
echo "Compiling the project..."
ghc --make Main.hs -hidir build -odir build -o play

echo "Build complete. You can run the game using ./play"