rm(list=ls(all=TRUE))
# library(devtools)
deviceType <- ifelse(R.version$os=="linux-gnu", "X11", "windows")
options(device = deviceType) #http://support.rstudio.org/help/discussions/problems/80-error-in-function-only-one-rstudio-graphics-device-is-permitted

devtools::document()
devtools::check_man() #Should return NULL
devtools::build_vignettes()
pkgdown::clean_site()
pkgdown::build_site()
system("R CMD Rd2pdf --no-preview --force --output=./documentation-peek.pdf ." )

devtools::run_examples(); #dev.off() #This overwrites the NAMESPACE file too
# devtools::run_examples(, "table-nih-enrollment.Rd")
test_results_checked <- devtools::test()
test_results_checked <- devtools::test(filter = "table-nih-enrollment")
# testthat::test_dir("./tests/")
test_results_not_checked <- testthat::test_dir("./tests/manual/")
