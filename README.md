
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gifify

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/imaddowzimet/gifify.svg?branch=master)](https://travis-ci.org/imaddowzimet/gifify)
[![Codecov test
coverage](https://codecov.io/gh/imaddowzimet/gifify/branch/master/graph/badge.svg)](https://codecov.io/gh/imaddowzimet/gifify?branch=master)
<!-- badges: end -->

gifify is a simple wrapper for the amazing
[magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html)
package that simplifies the process of importing videos, adding
subtitles, and turning them into GIFs for your meme-ing needs.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("imaddowzimet/gifify")
```

## Example

To use *gifify*, just pass it a link to a video file with the clip you
want to subtitle (already cut to the correct length), and the text you
want for the subtitle.

``` r
library(gifify)
```

![](brilliant.gif)
