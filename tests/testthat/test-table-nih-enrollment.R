library(testthat)
context("NIH Table")

expected_1 <- structure(
  list(gender = structure(c(1L, 1L, 1L, 1L, 1L, 1L, 1L,
  1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L,
  2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L,
  2L, 2L, 2L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L,
  3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L), .Label = c("Female", "Male",
  "Unknown/Not Reported"), class = "factor"), race = structure(c(1L,
  1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L, 5L, 5L, 5L, 6L, 6L,
  6L, 7L, 7L, 7L, 1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L,
  5L, 5L, 5L, 6L, 6L, 6L, 7L, 7L, 7L, 1L, 1L, 1L, 2L, 2L, 2L, 3L,
  3L, 3L, 4L, 4L, 4L, 5L, 5L, 5L, 6L, 6L, 6L, 7L, 7L, 7L), .Label = c("American Indian/Alaska Native",
  "Asian", "Native Hawaiian or Other Pacific Islander", "Black or African American",
  "White", "More than One Race", "Unknown or Not Reported"), class = "factor"),
  ethnicity = structure(c(1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L,
  1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L,
  1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L,
  1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L,
  1L, 2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L), .Label = c("Not Hispanic or Latino",
  "Hispanic or Latino", "Unknown/Not Reported Ethnicity"), class = "factor"),
  n = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 1L,
  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 2L, 0L, 0L, 2L, 2L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
  0L, 0L, 0L, 0L, 0L)), class = c("tbl_df", "tbl", "data.frame"
  ), row.names = c(NA, -63L)
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

test_that("ds_1d --different variable names", {
  ds_1d <- ds_1a %>%
    dplyr::rename(
      vg  = gender,
      vr  = race,
      ve  = ethnicity
    )

  observed <- table_nih_enrollment(ds_1d, variable_gender="vg", variable_race="vr", variable_ethnicity="ve")
  expect_equal(observed, expected_1)
})

test_that("ds_2 --500 patients w/ numeric codes", {

  # library(magrittr)
  path <- system.file("misc/example-data-1.csv", package="codified")
  d_2 <- readr::read_csv(path) %>%
    dplyr::mutate(
      gender     = as.character(gender),
      race       = as.character(race),
      ethnicity  = as.character(ethnicity)
    )
  d_lu_gender <- tibble::tribble(
    ~input,   ~displayed                      ,
    "0"   ,  "Female",
    "1"   ,  "Male",
    "U"   ,  "Unknown/Not Reported"
  )
  d_lu_race <- tibble::tribble(
    ~input ,   ~displayed                      ,
    "1"    , "American Indian/Alaska Native",
    "2"    , "Asian",
    "3"    , "Native Hawaiian or Other Pacific Islander",
    "4"    , "Black or African American",
    "5"    , "White",
    "M"    , "More than One Race",
    "6"    , "Unknown or Not Reported"
  )
  d_lu_ethnicity <- tibble::tribble(
    ~input,   ~displayed                      ,
    "2"   ,  "Not Hispanic or Latino"         ,
    "1"   ,  "Hispanic or Latino"             ,
    "0"   ,  "Unknown/Not Reported Ethnicity"
  )
  table_nih_enrollment(
    d              = d_2,
    d_lu_gender    = d_lu_gender,
    d_lu_race      = d_lu_race,
    d_lu_ethnicity = d_lu_ethnicity
  )
})
