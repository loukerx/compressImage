# Rules to resize an image
**a,** If both the width and the height are smaller or equal to 1280 pixels, return the original image.

**b,** If either the width or the height is larger than 1280 pixels, and the aspect ratio is smaller or equal to 2. Resize the larger side to 1280 pixels and another side on the same proportion of the original image.


**c,** If both the width and the height are larger than 1280 pixels, and the aspect ratio is larger than 2.  Resize the smaller side to 1280 pixels and another side on the same proportion of the original image.

**d,** If either the width or the height is larger than 1280 pixels,and the aspect ratio is larger than 2.  Return the original image.
