codified
=====================================
Produce standard/formalized demographics tables

Clinical researchers often need to document and report the demographics of all consented subjects. A common use case is for reporting to funding agencies, including the National Institutes of Health (NIH). The NIH requires a particular format for the [PHS Inclusion Enrollment Report](https://grants.nih.gov/grants/how-to-apply-application-guide/forms-d/general/g.500-phs-inclusion-enrollment-report.htm) in each annual Research Performance Progress Report ([RPPR](https://grants.nih.gov/grants/rppr/index.htm)).

The <b>codified</b> package, in combination with the <b>REDCapR</b> package, provides a pipeline to directly extract the demographics of consented subjects from a REDCap database, and to rapidly and reproducibly produce standard demographics tables.



### Installation and Documentation

In the future, the *release* version can be installed from [CRAN](https://cran.r-project.org/package=codified).
```r
# install.packages("codified")
```

The *development* version can be installed from [GitHub](https://github.com/OuhscBbmc/codified) after installing the `devtools` package.

```r
install.packages("devtools") # Run this line if the 'devtools' package isn't installed already.
devtools::install_github(repo="OuhscBbmc/codified")
```


### Build Status and Package Characteristics

| [GitHub](https://github.com/OuhscBbmc/codified) | [Travis-CI](https://travis-ci.org/OuhscBbmc/codified/builds) | [AppVeyor](https://ci.appveyor.com/project/wibeasley/codified/history) | [Coveralls](https://coveralls.io/r/OuhscBbmc/codified) |
| :----- | :---------------------------: | :-----------------------------: | :-------: |
| [Master](https://github.com/OuhscBbmc/codified/tree/master) | [![Build Status](https://travis-ci.org/OuhscBbmc/codified.svg?branch=master)](https://travis-ci.org/OuhscBbmc/codified) | [![Build status](https://ci.appveyor.com/api/projects/status/geka1g6d7ms45fh8/branch/master?svg=true)](https://ci.appveyor.com/project/wibeasley/codified/branch/master) | [![Coverage Status](https://coveralls.io/repos/github/OuhscBbmc/codified/badge.svg?branch=master)](https://coveralls.io/github/OuhscBbmc/codified?branch=master) |
| [Dev](https://github.com/OuhscBbmc/codified/tree/dev) | [![Build Status](https://travis-ci.org/OuhscBbmc/codified.svg?branch=dev)](https://travis-ci.org/OuhscBbmc/codified) | [![Build status](https://ci.appveyor.com/api/projects/status/geka1g6d7ms45fh8/branch/dev?svg=true)](https://ci.appveyor.com/project/wibeasley/codified/branch/dev) | [![Coverage Status](https://coveralls.io/repos/github/OuhscBbmc/codified/badge.svg?branch=dev)](https://coveralls.io/github/OuhscBbmc/codified?branch=dev) |
| | *Ubuntu LTS* | *Windows Server* | *Test Coverage* |

| Key | Value |
| :--- | :----- |
| [License](https://choosealicense.com/) | [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) |
<!--| [CRAN Version](https://cran.r-project.org/package=codified) | [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/codified)](https://cran.r-project.org/package=codified) |
| [CRAN Rate](http://cranlogs.r-pkg.org/) | ![CRANPace](http://cranlogs.r-pkg.org/badges/codified) |
| [Zenodo Archive](https://zenodo.org/search?ln=en&p=codified) | [![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.61990.svg)](https://doi.org/10.5281/zenodo.61990) |
| [Production Doc](https://www.rdocumentation.org/) | [![Rdoc](http://www.rdocumentation.org/badges/version/codified)](http://www.rdocumentation.org/packages/codified) |
| [Development Doc](https://www.rdocumentation.org/) | [![Rdoc](https://img.shields.io/badge/pkgodwn-GitHub.io-orange.svg?longCache=true&style=style=for-the-badge)](https://ouhscbbmc.github.io/codified/) |-->
