library(testthat)
context("NI Table")

d1 <- tibble::tribble(
  ~subject_id,   ~gender,                       ~race,                ~ethnicity,
           1L,    "Male", "Black or African American",  "Not Hispanic or Latino",
           2L,    "Male", "Black or African American",  "Not Hispanic or Latino",
           3L,  "Female", "Black or African American",  "Not Hispanic or Latino",
           4L,    "Male",                     "White",  "Not Hispanic or Latino",
           5L,    "Male",                     "White",  "Not Hispanic or Latino",
           6L,  "Female",                     "White",  "Not Hispanic or Latino",
           7L,    "Male",                     "White",      "Hispanic or Latino",
           8L,    "Male",                     "White",      "Hispanic or Latino"
)



test_that("Smoke Test", {
  testthat::skip_on_cran()
  table_nih_enrollment(d1)

})
