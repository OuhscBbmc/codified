Description
============================

This is a rerelease after it was removed a few days ago for "policy violation... On Internet access."  The vignette called an external server that was being upgraded (and I was in the middle of a two-week camping trip).

In the meantime, I've made some minor updates to code and reduced some package dependencies.

Thank you for taking the time to review my submission, and please tell me if there's something else I should do for CRAN.  -Will Beasley


Test environments
-----------------------------------------------

The win-builder and a local machine have used the CRAN version of dplyr.  The others have used the current GitHub master version of dplyr.

* Local Ubuntu, R 4.2.1 patched
* [win-builder](https://win-builder.r-project.org/loyQ4mpg13bQ/) (version="R-devel")
* R Hub -R Release
  * [Fedora](https://builder.r-hub.io/status/codified_0.2.9001.tar.gz-04d7f8fa685f4838b58ef9d92646d6c4)
  * [Ubuntu LTS](https://builder.r-hub.io/status/codified_0.2.9001.tar.gz-0b3d5e1af0d545acb1fed149064e3d98)
  * [Windows Server](https://builder.r-hub.io/status/codified_0.2.9001.tar.gz-f19cf505473c4557984b8a4102f0c4a6)
* [GiHub Actions](https://github.com/OuhscBbmc/REDCapR/actions), Ubuntu 20.04 LTS

R CMD check results
-----------------------------------------------

* No ERRORs or WARNINGs on any builds.

* One consistent NOTE:
  > CRAN repository db overrides:
  > X-CRAN-Comment: Archived on 2022-08-08 for policy violation.
  >
  > On Internet access.

* There is one NOTE that is only found on R-hub Windows (Server 2022, R-devel 64-bit):

  ```txt
  * checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'
  As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this could be due to a bug/crash in MiKTeX and can likely be ignored.
  ```

* There is one NOTE that is only found on the R-hub Fedora:

  ```txt
  * checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found
  ```

  Based on [this discussion](https://groups.google.com/g/r-sig-mac/c/7u_ivEj4zhM?pli=1), it sounds like a problem with the testing environment, and not the package code.

Downstream dependencies
-----------------------------------------------

No other packages depend/import this one.
