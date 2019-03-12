# Iterative First-Order Reverse Image Filtering

Remove the image filtering affects based on Newton-Raphson method.

## Source Code

This project includes the following MATLAB scripts:
* **Demo_Main.m**: 
Demo for our proposed iterative first-order reverse image filtering.

* **Demo_Convergence.m**: 
Demo for the convergence of our method on the image set BSD500.

* **Demo_NonBlindDeblur.m**: Demo for the practical usage of our method on the non-blind image deblurring application.

* **Demo_RecoverDetails.m**: 
Demo for the practical usage of our method on the image detail recovery application.

* **L0Smoothing.m**: 
The function of L0 smoothing filter 

* **bilateralFilter.m**: 
The function of bilateral filter 

## Filters Used for Test
Currently, our method is tested on 10 commonly-used filters:
* **GS**: [Gaussian Filter](https://www.mathworks.com/help/images/ref/fspecial.html)
*	**DK**: [Disk Filter](https://www.mathworks.com/help/images/ref/fspecial.html)
*	**LOG**: [Laplacian of Gaussian Filter](https://www.mathworks.com/help/images/ref/fspecial.html) 
*	**MT**: [Motion Blurring](https://www.mathworks.com/help/images/ref/fspecial.html)
*	**UMF**: [Unsharp Masking Filter](https://www.mathworks.com/help/images/ref/imsharpen.html)
*	**BF**: [Bilateral Filter](http://groups.csail.mit.edu/graphics/bilagrid/) 
*	**GF**: [Guided Image Filtering](http://kaiminghe.com/eccv10/index.html)
*	**AWF**: [Adaptive Wiener Filter](https://www.mathworks.com/help/images/ref/wiener2.html)
*	**L0**: [L0 Smoothing](http://www.cse.cuhk.edu.hk/~leojia/projects/L0smoothing/)
*	**MF**: [Median Filter](https://www.mathworks.com/help/images/ref/medfilt2.html) 



## Image Set

The test imageset BSD500 is built from the Berkeley segmentation dataset [[Project]](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/bsds/).



## Authors

* **Li Dong** - [Homepage](http://www.escience.cn/people/dongli90/index.html) - Email: dongli@nbu.edu.cn

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

