Description
-----------------------------------------------
This is a new release.  I've corrected the note about the license file/template (sorry, I thought that note was pointing to the new submission line.)

Thank you for taking the time to review my submission, and please tell me if there's something else I should do for CRAN.  -Will Beasley


Test environments
-----------------------------------------------

The win-builder and a local machine have used the CRAN version of dplyr.  The others have used the current GitHub master version of dplyr.

* Local Ubuntu, R 3.5.1 patched
* [win-builder](https://win-builder.r-project.org/loyQ4mpg13bQ/) (version="R-devel")
* R Hub -R Release 
    * [Fedora](https://builder.r-hub.io/status/codified_0.2.0.tar.gz-9e323515f1c645de88948b62f47ea256)
    * [Ubuntu LTS](https://builder.r-hub.io/status/codified_0.2.0.tar.gz-0b2beb0a150f4a85a20296868425bcd6)
    * [Windows Server](https://builder.r-hub.io/status/codified_0.2.0.tar.gz-628ea3de132d44039f349301e03816c0)
* [Travis CI](https://travis-ci.org/OuhscBbmc/codified), Ubuntu LTS
* [AppVeyor](https://ci.appveyor.com/project/wibeasley/codified), Windows Server


R CMD check results
-----------------------------------------------

* No ERRORs or WARNINGs on any builds.

* No consistent NOTEs other than 'New submission'.  There are a few things popping up in some of the seven builds above, but nothing serious.  For example,  win-builder couldn't connect to the "https://CRAN.R-project.org/package=staplr" or the Zenodo links.


Downstream dependencies
-----------------------------------------------

No other packages depend/import this one.
