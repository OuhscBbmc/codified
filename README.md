codified
=====================================

Produce standard/formalized demographics tables

Clinical researchers often need to document and report the demographics of all consented subjects. A common use case is for reporting to funding agencies, including the National Institutes of Health (NIH). The NIH requires a particular format for the [PHS Inclusion Enrollment Report](https://www.era.nih.gov/erahelp/assist/Content/ASSIST_Help_Topics/3_Form_Screens/PHS_HS_CT/Incl_Enroll_Rprt.htm) in each annual Research Performance Progress Report ([RPPR](https://grants.nih.gov/grants/rppr/index.htm)).

The **codified** package, in combination with the **REDCapR** package, provides a pipeline to directly extract the demographics of consented subjects from a REDCap database, and to rapidly and reproducibly produce standard demographics tables.  This pipeline is demonstrated in the vignette, *[NIH Enrollment Tables in HTML](https://ouhscbbmc.github.io/codified/articles/nih-enrollment-html.html)*.

Installation and Documentation
-----------------------

The *development* version can be installed from [GitHub](https://github.com/OuhscBbmc/codified) after installing the [remotes](https://CRAN.R-project.org/package=remotes) package.

```r
install.packages("remotes") # Run this line if the 'remotes' package isn't installed already.
remotes::install_github(repo="OuhscBbmc/codified")
```

The *release* version can be installed from [CRAN](https://cran.r-project.org/package=codified).

```r
install.packages("codified")
```

The package can be uninstalled from your local machine with `remove.packages("codified")`.

Build Status and Package Characteristics
-----------------------

| [GitHub](https://github.com/OuhscBbmc/codified) | [GitHub Actions](https://github.com/OuhscBbmc/codified/actions) | [Coveralls](https://coveralls.io/github/OuhscBbmc/codified) |
| :----- | :---------------------------: |  :-------: |
| [Main](https://github.com/OuhscBbmc/codified/tree/main) | [![R-CMD-check](https://github.com/OuhscBbmc/codified/actions/workflows/check-release.yml/badge.svg)](https://github.com/OuhscBbmc/codified/actions/workflows/check-release.yml) | [![Coverage Status](https://coveralls.io/repos/github/OuhscBbmc/codified/badge.svg?branch=main)](https://coveralls.io/github/OuhscBbmc/codified?branch=main) |
| [Dev](https://github.com/OuhscBbmc/codified/tree/dev) | [![R-CMD-check](https://github.com/OuhscBbmc/codified/actions/workflows/check-release.yml/badge.svg?branch=dev)](https://github.com/OuhscBbmc/codified/actions/workflows/check-release.yml) | [![Coverage Status](https://coveralls.io/repos/github/OuhscBbmc/codified/badge.svg?branch=dev)](https://coveralls.io/github/OuhscBbmc/codified?branch=dev) |
| | *Ubuntu LTS* | *Windows Server* | *Test Coverage* |

| Key | Value |
| :--- | :----- |
| [License](https://choosealicense.com/) | [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) |
| [Development Doc](https://www.rdocumentation.org/) | [![Rdoc](https://img.shields.io/badge/pkgodwn-GitHub.io-orange.svg?longCache=true&style=style=for-the-badge)](https://ouhscbbmc.github.io/codified/) |
| [Zenodo Archive](https://zenodo.org/search?ln=en&p=codified) | [![DOI](https://zenodo.org/badge/146359325.svg)](https://zenodo.org/badge/latestdoi/146359325) |
| [CRAN Version](https://cran.r-project.org/package=codified) | [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/codified)](https://cran.r-project.org/package=codified) |
| [CRAN Rate](https://cranlogs.r-pkg.org:443/) | ![CRANPace](https://cranlogs.r-pkg.org:443/badges/codified) |
| [Production Doc](https://www.rdocumentation.org/) | [![Rdoc](http://www.rdocumentation.org/badges/version/codified)](https://www.rdocumentation.org/packages/codified) |
