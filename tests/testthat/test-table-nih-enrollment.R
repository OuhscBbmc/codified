library(testthat)
context("NIH Table")

expected_1 <- structure(
  list(gender = c("Female", "Female", "Female", "Female",
  "Female", "Female", "Female", "Female", "Female", "Female", "Female",
  "Female", "Female", "Female", "Female", "Female", "Female", "Female",
  "Female", "Female", "Female", "Male", "Male", "Male", "Male",
  "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male",
  "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male",
  "Male", "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported"
  ), race = c("American Indian/Alaska Native", "American Indian/Alaska Native",
  "American Indian/Alaska Native", "Asian", "Asian", "Asian", "Black or African American",
  "Black or African American", "Black or African American", "More than One Race",
  "More than One Race", "More than One Race", "Native Hawaiian or Other Pacific Islander",
  "Native Hawaiian or Other Pacific Islander", "Native Hawaiian or Other Pacific Islander",
  "Unknown or Not Reported", "Unknown or Not Reported", "Unknown or Not Reported",
  "White", "White", "White", "American Indian/Alaska Native", "American Indian/Alaska Native",
  "American Indian/Alaska Native", "Asian", "Asian", "Asian", "Black or African American",
  "Black or African American", "Black or African American", "More than One Race",
  "More than One Race", "More than One Race", "Native Hawaiian or Other Pacific Islander",
  "Native Hawaiian or Other Pacific Islander", "Native Hawaiian or Other Pacific Islander",
  "Unknown or Not Reported", "Unknown or Not Reported", "Unknown or Not Reported",
  "White", "White", "White", "American Indian/Alaska Native", "American Indian/Alaska Native",
  "American Indian/Alaska Native", "Asian", "Asian", "Asian", "Black or African American",
  "Black or African American", "Black or African American", "More than One Race",
  "More than One Race", "More than One Race", "Native Hawaiian or Other Pacific Islander",
  "Native Hawaiian or Other Pacific Islander", "Native Hawaiian or Other Pacific Islander",
  "Unknown or Not Reported", "Unknown or Not Reported", "Unknown or Not Reported",
  "White", "White", "White"), ethnicity = c("Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity"),
  n = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  2L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 2L, 2L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L)), class = c("tbl_df", "tbl", "data.frame"
  ), row.names = c(NA, -63L)
)


ds_1a <- tibble::tribble(
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
  observed <- table_nih_enrollment(ds_1a)
  expect_true(!is.null(observed))
})

test_that("ds_1a", {
  observed <- table_nih_enrollment(ds_1a) # dput(observed)
  expect_equal(observed, expected_1)
})
