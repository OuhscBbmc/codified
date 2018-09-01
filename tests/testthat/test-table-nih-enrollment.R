library(testthat)
context("NIH Table")

expected_1 <- structure(
  list(gender = c("Female", "Female", "Male", "Male",
  "Male", "Female", "Female", "Female", "Female", "Female", "Female",
  "Female", "Female", "Female", "Female", "Female", "Female", "Female",
  "Female", "Female", "Female", "Female", "Female", "Female", "Male",
  "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male",
  "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male",
  "Male", "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported",
  "Unknown/Not Reported", "Unknown/Not Reported", "Unknown/Not Reported"
  ), race = c("Black or African American", "White", "Black or African American",
  "White", "White", "American Indian/Alaska Native", "American Indian/Alaska Native",
  "American Indian/Alaska Native", "Asian", "Asian", "Asian", "Black or African American",
  "Black or African American", "More than One Race", "More than One Race",
  "More than One Race", "Native Hawaiian or Other Pacific Islander",
  "Native Hawaiian or Other Pacific Islander", "Native Hawaiian or Other Pacific Islander",
  "Unknown or Not Reported", "Unknown or Not Reported", "Unknown or Not Reported",
  "White", "White", "American Indian/Alaska Native", "American Indian/Alaska Native",
  "American Indian/Alaska Native", "Asian", "Asian", "Asian", "Black or African American",
  "Black or African American", "More than One Race", "More than One Race",
  "More than One Race", "Native Hawaiian or Other Pacific Islander",
  "Native Hawaiian or Other Pacific Islander", "Native Hawaiian or Other Pacific Islander",
  "Unknown or Not Reported", "Unknown or Not Reported", "Unknown or Not Reported",
  "White", "American Indian/Alaska Native", "American Indian/Alaska Native",
  "American Indian/Alaska Native", "Asian", "Asian", "Asian", "Black or African American",
  "Black or African American", "Black or African American", "More than One Race",
  "More than One Race", "More than One Race", "Native Hawaiian or Other Pacific Islander",
  "Native Hawaiian or Other Pacific Islander", "Native Hawaiian or Other Pacific Islander",
  "Unknown or Not Reported", "Unknown or Not Reported", "Unknown or Not Reported",
  "White", "White", "White"), ethnicity = c("Unknown/Not Reported Ethnicity",
  "Not Hispanic or Latino", "Not Hispanic or Latino", "Hispanic or Latino",
  "Not Hispanic or Latino", "Hispanic or Latino", "Not Hispanic or Latino",
  "Unknown/Not Reported Ethnicity", "Hispanic or Latino", "Not Hispanic or Latino",
  "Unknown/Not Reported Ethnicity", "Hispanic or Latino", "Not Hispanic or Latino",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity", "Hispanic or Latino",
  "Unknown/Not Reported Ethnicity", "Hispanic or Latino", "Not Hispanic or Latino",
  "Unknown/Not Reported Ethnicity", "Hispanic or Latino", "Not Hispanic or Latino",
  "Unknown/Not Reported Ethnicity", "Hispanic or Latino", "Not Hispanic or Latino",
  "Unknown/Not Reported Ethnicity", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity",
  "Hispanic or Latino", "Not Hispanic or Latino", "Unknown/Not Reported Ethnicity"
  ), n = c(1L, 1L, 2L, 2L, 2L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L)), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA,
  -63L)
)


ds_1a <- tibble::tribble(
  ~subject_id,   ~gender  , ~race                      ,   ~ethnicity                     ,
           1L,   "Male"   , "Black or African American",  "Not Hispanic or Latino"        ,
           2L,   "Male"   , "Black or African American",  "Not Hispanic or Latino"        ,
           3L,   "Female" , "Black or African American",  "Unknown/Not Reported Ethnicity",
           4L,   "Male"   , "White"                    ,  "Not Hispanic or Latino"        ,
           5L,   "Male"   , "White"                    ,  "Not Hispanic or Latino"        ,
           6L,   "Female" , "White"                    ,  "Not Hispanic or Latino"        ,
           7L,   "Male"   , "White"                    ,  "Hispanic or Latino"            ,
           8L,   "Male"   , "White"                    ,  "Hispanic or Latino"
)


test_that("Smoke Test", {
  observed <- table_nih_enrollment(ds_1a)
  expect_true(!is.null(observed))
})

test_that("ds_1a --no metadata required", {
  observed <- table_nih_enrollment(ds_1a) # dput(observed)
  expect_equal(observed, expected_1)
})

test_that("ds_1b --ethnicity metadata required", {
  d_1b <- tibble::tribble(
    ~subject_id,  ~gender , ~race                      , ~ethnicity    ,
             1L,  "Male"  , "Black or African American", "Not Latino"  ,
             2L,  "Male"  , "Black or African American", "Not Latino"  ,
             3L,  "Female", "Black or African American", "Unknown"     ,
             4L,  "Male"  , "White"                    , "Not Latino"  ,
             5L,  "Male"  , "White"                    , "Not Latino"  ,
             6L,  "Female", "White"                    , "Not Latino"  ,
             7L,  "Male"  , "White"                    , "Latino"      ,
             8L,  "Male"  , "White"                    , "Latino"
  )

  d_lu_ethnicity <- tibble::tribble(
    ~input      ,  ~displayed                      ,
    "Not Latino",  "Not Hispanic or Latino"         ,
    "Latino"    ,  "Hispanic or Latino"             ,
    "Unknown"   ,  "Unknown/Not Reported Ethnicity"
  )

  observed <- table_nih_enrollment(d_1b, d_lu_ethnicity=d_lu_ethnicity)
  expect_equal(observed, expected_1)
})

test_that("ds_1c --all metadata required", {
  d_1c <- tibble::tribble(
    ~subject_id,  ~gender , ~race , ~ethnicity    ,
             1L,  "M"     , "B"   , "Not Latino"  ,
             2L,  "M"     , "B"   , "Not Latino"  ,
             3L,  "F"     , "B"   , "Unknown"     ,
             4L,  "M"     , "W"   , "Not Latino"  ,
             5L,  "M"     , "W"   , "Not Latino"  ,
             6L,  "F"     , "W"   , "Not Latino"  ,
             7L,  "M"     , "W"   , "Latino"      ,
             8L,  "M"     , "W"   , "Latino"
  )

  d_lu_gender <- tibble::tribble(
    ~input,   ~displayed                      ,
    "F"   ,  "Female",
    "M"   ,  "Male",
    "U"   ,  "Unknown/Not Reported"
  )
  d_lu_race <- tibble::tribble(
    ~input ,   ~displayed                      ,
    "N"    , "American Indian/Alaska Native",
    "A"    , "Asian",
    "H"    , "Native Hawaiian or Other Pacific Islander",
    "B"    , "Black or African American",
    "W"    , "White",
    "M"    , "More than One Race",
    "U"    , "Unknown or Not Reported"
  )
  d_lu_ethnicity <- tibble::tribble(
    ~input      ,   ~displayed                      ,
    "Not Latino",  "Not Hispanic or Latino"         ,
    "Latino"    ,  "Hispanic or Latino"             ,
    "Unknown"   ,  "Unknown/Not Reported Ethnicity"
  )

  observed <- table_nih_enrollment(d_1c, d_lu_gender=d_lu_gender, d_lu_race=d_lu_race, d_lu_ethnicity=d_lu_ethnicity)
  expect_equal(observed, expected_1)
})
