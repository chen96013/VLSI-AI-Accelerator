# AI-Acceleration-System  
>This is a final proect in NCKU VLSI system design. Our team will design an AI acceleration system, which is composed of a RISC-V CPU, Systolic array based accelerator, model training and quantization flow and model compiler.  
## System overview
![proposal](https://github.com/chen96013/VLSI-AI-Accelerator/assets/70428182/3ddd2f66-4d7f-4154-b828-24088fba160b)

- [AI-Acceleration-System](#ai-acceleration-system)
  - [System overview](#system-overview)
  - [HARDWARE](#hardware)
    - [CPU](#cpu)
    - [Accelerator](#accelerator)
    - [AXI bus](#axi-bus)
    - [DMA](#dma)
    - [FFT](#fft)
  - [SOFTWARE](#software)
    - [Program and Compiler](#program-and-compiler)
    - [AI model train and quantize](#ai-model-train-and-quantize)

## HARDWARE  
### CPU  
Our system is totally controled by a RISC-V CPU. Supporting 64 bit memory accessing.  
  
### Accelerator  
> This accelerator's design is based on paper an IEEE paper  
> Topic: An energy‑efficient convolution unit for depthwise separable convolutional neural networks  
> Authors: Y. S. Chongg, W. L. Gohy, Y. S. Ongz, V. P. Nambiarx, A. T. Do  
> Issuer:  
> School of Electrical and Electronic Engineering, Nanyang Technological University (NTU), Singapore  
> Energy Research Institute, Interdisciplinary Graduate Programme, NTU, Singapore  
> School of Computer Science and Engineering, NTU, Singapore
> Institute of Microelectronics, A*STAR, Singapore  
> Publisher: IEEE International Symposium on Circuits and Systems (ISCAS)  
> Year: 2021  
> [Paper original site on IEEE](https://ieeexplore.ieee.org/document/9401192)

This accelerator is aimed to accelerate the pointwise convolution which is used in depthwise-separable convolution.
Depthwise-separable convolution is often used in the CNNs (Convolution Neural Networks) which deployed on edge or mobile devices because it saves more computation and memory.
Depthwise-separable convolution is composed of two types of convolution, depthwise convolution and pointwise convolution, and this kind of networks are so called "MobileNet like network" because the analysis 
and application of this architecture is first mention in paper [MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications](https://arxiv.org/abs/1704.04861).   
By these two convolutions, depthwise-separable convolution can show simmilar power to normal convolution which is used in CNNs while it saves a lot of memory and computation cost.
State-of-the-art CNN accelerator focus on how to enhance the computation speed of normal convolution, but pointwise convolution shows totally different computation properties.
Thus, these accelerators often shows low efficiency when running pointwise convolution, and the worst thing is that the most computaion we needed in depthwise-separable convolution is pointwise convolution.  
In this paper's accelerator's design, the most focus objective is to accelerate pointwise convolution, but this show another problem.
That is, the systolic array shows an obvious low efficiency when computing normal convolution and depthwise convolution.  
Our target is to make the data flow in systolic array better, which won't show such a poor computation efficieny when computing normal convolution and depthwise convolution.
  
### AXI bus  
AXI bus is a well-known (AMBA) Advanced Microcontroller Bus Architecture. for connecting different part of computing modules, we decided to use AXI because they are in different clock rate. For connecting the module in different clock domains, AXI is a better choice than AHB. All modules can transmit their information through one AXI bus, including data and controling signals.  
  
### DMA  
DMA (Direct Memory Access) is a high performace design for data accessing. With DMA, CPU do not need to using many interupt to deal with data accessing. DMA helps moving data for the computing unit through our AXI bus, then our computing unit can focurs most of power and time on high performance computing.  
  
### FFT  
A wide used picture compression technique JPEG uses CFT and low pass filter to compression the picture. In most of cases, memory bandwidth is the bottleneck of AI accelerator. We purpose to compression the pictures waited for prediction by FFT and filtered the high frequency noise before transmit them through AXI to computing unit.  By this way we hope to increase the bus bandwidth and improve our pediction FPS.  
  
## SOFTWARE  
  
### Program and Compiler
  
### AI model train and quantize  
  
