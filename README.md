# growth_curves
Matlab code to fit bacterial growth curves.
* `smoothtransposedplate` — a function that does three things
** It accepts a nx96 matrix where there 96 wells are in the A1, A2 _etc._ format and changes it to A1, B1 _etc._
** It does a LOWESS smoothing to remove outliers (bubbles)
** It subtracts the mininum value from the curves
* `growthfit` — does a fit on each well of a plate based on the function in `growthcurve.m` and plots all 96 in subplots.
* `platelayout.m` — accepts a vector of 96 dimensions or a 8x12 matrix and a string (to become the title) and plots a `imagesc`, but like a plate with NaNs as crossed wells.
* `platename.m` — converts a number to a string as a well position or vice-versa.

Discussion can be [here](http://blog.matteoferla.com/2016/03/growth-curves.html).
