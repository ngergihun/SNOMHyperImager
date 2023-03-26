# SNOMapp
<!-- ABOUT THE PROJECT -->
## About The Project

The intent behind the creation of this MATLAB application is to speed up the data processing of single wavelength images from Scanning Near-field Optical Microscopy (SNOM) experiments.

Usage:
1. Download all the files to a folder
2. Launch MATLAB and add this folder to path or just navigate to it using matlab folder browser
3. Launch the main application: `SNOMapp.mlapp` (the other subapps cannot work sandalone without SNOMapp.mlapp)

❗❗❗**The application is still under active development. Serious bugs can be present. New features and bugfixes will be introduced as soon as possible.** ❗❗❗

+ ⚠️The current version is specifically written for filestructures of NeaSpec - NeaSNOM/NeasSCOPE microscopes⚠️
+ ⚠️Some functions use the nameing conventions of NeaSpec files also⚠️
+ ⚠️For wavelength recognition, you have to add _XXXX_cm-1 to the filename⚠️

## The principles

Let's suppose that you have chosen an interesting area on your sample and you want to have the optical spectrum through your spectral range of interest. Thus, you measured a new SNOM image at every desired wavelength.

In order to get a final hyperspectral image from all your measurements, I usually apply the following procedure:
+ Load one OPTICAL image at a specific wavelength
  + CORRECT the measurement artifacts (plane leveling, align row, etc ...)
  + Use plane level as reference
  + ADD the corrected image to the Spectral dataset (Optics)
+ Load the TOPOGRAPHY image (AFM image) corresponding to the same measurement
  + CORRECT the main artifacts of the AFM image (You don't have to be superprecise, but it helps! ;D)
  + ADD the corrected to Topography dataset (Topo)
+ Repeat the process for all the images taken at different wavelengths
  + ❗(at the moment the app recognizes the wavelength from filenames, thus you MUST add _xxxx_cm-1 to the filename)❗
+ After all the necessary data is added to the Topography and Optics dataset, you can proceed to `HyperSpectral Processing`
  + New window will appear

The subapp helps you to correct the drifts between images and extract the spectrum from specific regions of the measurement area:
+ Use the `Align maps` Panel for supervised correction of the drifts
+ Use `Extract spectrum` Panel
+ Save your final data:
  + Save the selected Spectrum to MATLAB workspace or to text file
  + Save the whole aligned Hyperspectral image for external use (Currently: to text file with [CytoSpec XYZ1 format](https://www.cytospec.com/ftir.php))
  + Save the result as a Project (you can load it back later)



