# 🖼️ Two-Dimensional FIR Filters in MATLAB

## 📌 Project Overview

This project demonstrates the implementation of various **Two-Dimensional Finite Impulse Response (FIR) filters** using MATLAB.

The script applies spatial and frequency domain filtering techniques to images, including:

- Low-pass filtering (Average filter)
- High-pass filtering (Edge detection)
- Image sharpening
- Fourier Transform filtering
- Emboss filtering (with directional lighting effects)

---

## 🛠️ Requirements

- MATLAB
- Image Processing Toolbox

---

## 📂 Required Image Files

Make sure the following files are in the same folder as the MATLAB script:

- m83.tif
- liftingbody.png
- westconcordorthophoto.png
- saturn.png
- cameraman.tif

---

# 🔍 Implemented Techniques

## 1️⃣ Low Pass Filter (Averaging Filter)

- Converts grayscale image to binary.
- Applies a 3×3 averaging filter.
- Uses symmetric padding for borders.

### Purpose:
- Smooths the image
- Reduces noise
- Removes high-frequency components

---

## 2️⃣ High Pass Filter (Edge Detection)

Edge detection methods used:

- Prewitt
- Roberts
- LoG (Laplacian of Gaussian)

### Purpose:
- Detects edges
- Highlights intensity changes
- Extracts fine details

---

## 3️⃣ Image Sharpening (Unsharp Masking)

- Enhances edges
- Improves clarity
- Increases contrast around boundaries

---

## 4️⃣ Fourier Transform Filtering

Steps performed:

1. Convert RGB image to grayscale.
2. Apply 2D FFT.
3. Shift zero-frequency component to center.
4. Remove low-magnitude frequency components.

### Purpose:
- Analyze image in frequency domain
- Reduce noise
- Study spatial-frequency behavior

---

## 5️⃣ Emboss Filter

- Applies convolution using emboss kernels.
- Shifts pixel values by +128 to maintain visibility.
- Clips values to valid 0–255 range.

### Directional Lighting Effects:

- Light from North
- Light from South
- Light from East

Creates 3D shadow-like effects.

---

# 📊 Output Figures

The script generates multiple figures:

| Figure | Description |
|--------|------------|
| Figure 1 | Original & Binary image |
| Figure 2 | Averaged image |
| Figure 3 | Edge detection results |
| Figure 4 | Sharpening comparison |
| Figure 5 | Original & Grayscale |
| Figure 6 | FFT results |
| Figure 7 | Emboss effect |
| Figure 8 | Directional emboss effects |

---

# 🎯 Learning Outcomes

After running this project, you will understand:

- 2D FIR filtering in image processing
- Low-pass vs High-pass filters
- Convolution in MATLAB
- Edge detection techniques
- Frequency domain filtering using FFT
- Image enhancement and emboss effects

---

# 🚀 How to Run

1. Place all required images in the project folder.
2. Open MATLAB.
3. Run the script:

   ```
   FIR_Filters_in_Matlab
   ```

4. View the generated figures.

---

# 👨‍💻 Author
Miran Ghosh
Two-Dimensional FIR Filters in MATLAB  
Created for academic and educational purposes.
