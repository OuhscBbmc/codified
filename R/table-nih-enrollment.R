#' @name table_nih_enrollment
#' @aliases  table_nih_enrollment table_nih_enrollment_pretty
#'
#' @title Produce an NIH-compliant enrollment table.
#'
#' @description Produce an NIH enrollment table, leveraging metadata to adapt to the observed [data.frame].
#'
#' @param d [data.frame] of observed values in the investigation. Required.
#' @param d_lu_gender [data.frame] that maps the observed levels of gender to the NIH-recommended levels of gender. Required only if the levels are not the same.
#' @param d_lu_race [data.frame] that maps the observed levels of gender to the NIH-recommended levels of gender. Required only if the levels are not the same.
#' @param d_lu_ethnicity [data.frame] that maps the observed levels of gender to the NIH-recommended levels of gender. Required only if the levels are not the same.
#' @param variable_gender    name of the gender variable in the `d` [data.frame].  Defaults to gender.
#' @param variable_race      name of the race variable in the `d` [data.frame].  Defaults to race.
#' @param variable_ethnicity name of the ethnicity variable in the `d` [data.frame].  Defaults to ethnicity.
#' @return Table for publication
#'
#' @details
#' https://grants.nih.gov/grants/how-to-apply-application-guide/forms-d/general/g.500-phs-inclusion-enrollment-report.htm
#'
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @author Will Beasley, Peter Higgins, Andrew Peters, Sreeharsha Mandem
#'
#' @examples
#' library(magrittr)
#' ds_1 <- tibble::tribble(
#'   ~subject_id,   ~gender  , ~race                      ,   ~ethnicity                     ,
#'            1L,   "Male"   , "Black or African American",  "Not Hispanic or Latino"        ,
#'            2L,   "Male"   , "Black or African American",  "Not Hispanic or Latino"        ,
#'            3L,   "Female" , "Black or African American",  "Unknown/Not Reported Ethnicity",
#'            4L,   "Male"   , "White"                    ,  "Not Hispanic or Latino"        ,
#'            5L,   "Male"   , "White"                    ,  "Not Hispanic or Latino"        ,
#'            6L,   "Female" , "White"                    ,  "Not Hispanic or Latino"        ,
#'            7L,   "Male"   , "White"                    ,  "Hispanic or Latino"            ,
#'            8L,   "Male"   , "White"                    ,  "Hispanic or Latino"
#' )
#'
#' table_nih_enrollment(ds_1)
#' table_nih_enrollment_pretty(ds_1)
#'
#' table_nih_enrollment(ds_1) %>%
#'   tidyr::spread(key=gender, value=n)
#'
#' table_nih_enrollment(ds_1) %>%
#'   dplyr::mutate(
#'     gender_ethnicity = paste0(gender, " by ", ethnicity)
#'   ) %>%
#'   dplyr::select(-gender, -ethnicity) %>%
#'   tidyr::spread(key=gender_ethnicity, value=n)
#'
#' ds_2 <- tibble::tribble(
#'   ~subject_id,  ~gender , ~race                      , ~ethnicity    ,
#'            1L,  "Male"  , "Black or African American", "Not Latino"  ,
#'            2L,  "Male"  , "Black or African American", "Not Latino"  ,
#'            3L,  "Female", "Black or African American", "Unknown"     ,
#'            4L,  "Male"  , "White"                    , "Not Latino"  ,
#'            5L,  "Male"  , "White"                    , "Not Latino"  ,
#'            6L,  "Female", "White"                    , "Not Latino"  ,
#'            7L,  "Male"  , "White"                    , "Latino"      ,
#'            8L,  "Male"  , "White"                    , "Latino"
#' )
#'
#' ds_lu_ethnicity <- tibble::tribble(
#'   ~input      ,   ~displayed                      ,
#'   "Not Latino",  "Not Hispanic or Latino"         ,
#'   "Latino"    ,  "Hispanic or Latino"             ,
#'   "Unknown"   ,  "Unknown/Not Reported Ethnicity"
#' )
#' table_nih_enrollment(ds_2, d_lu_ethnicity=ds_lu_ethnicity)
#' table_nih_enrollment_pretty(ds_2, d_lu_ethnicity=ds_lu_ethnicity)
#'
#' ## Read a 500-patient fake dataset
#' path <- system.file("misc/example-data-1.csv", package="codified")
#' ds_3 <- readr::read_csv(path) %>%
#'   dplyr::mutate(
#'     gender     = as.character(gender),
#'     race       = as.character(race),
#'     ethnicity  = as.character(ethnicity)
#'   )
#'
#' ds_lu_gender <- tibble::tribble(
#'   ~input,   ~displayed                      ,
#'   "0"   ,  "Female",
#'   "1"   ,  "Male",
#'   "U"   ,  "Unknown/Not Reported"
#' )
#' ds_lu_race <- tibble::tribble(
#'   ~input ,   ~displayed                      ,
#'   "1"    , "American Indian/Alaska Native",
#'   "2"    , "Asian",
#'   "3"    , "Native Hawaiian or Other Pacific Islander",
#'   "4"    , "Black or African American",
#'   "5"    , "White",
#'   "M"    , "More than One Race",
#'   "6"    , "Unknown or Not Reported"
#' )
#' ds_lu_ethnicity <- tibble::tribble(
#'   ~input,   ~displayed                      ,
#'   "2"   ,  "Not Hispanic or Latino"         ,
#'   "1"   ,  "Hispanic or Latino"             ,
#'   "0"   ,  "Unknown/Not Reported Ethnicity"
#' )
#'
#' table_nih_enrollment(
#'   d              = ds_3,
#'   d_lu_gender    = ds_lu_gender,
#'   d_lu_race      = ds_lu_race,
#'   d_lu_ethnicity = ds_lu_ethnicity
#' )
#'
#' table_nih_enrollment_pretty(
#'   d              = ds_3,
#'   d_lu_gender    = ds_lu_gender,
#'   d_lu_race      = ds_lu_race,
#'   d_lu_ethnicity = ds_lu_ethnicity
#' )


#' @export
table_nih_enrollment <- function(
  d,
  d_lu_gender=NULL, d_lu_race=NULL, d_lu_ethnicity=NULL,
  variable_gender="gender", variable_race="race", variable_ethnicity="ethnicity"
) {
  checkmate::assert_data_frame(d                  , any.missing=F)
  checkmate::assert_data_frame(d_lu_gender        , any.missing=F, null.ok=T)
  checkmate::assert_data_frame(d_lu_race          , any.missing=F, null.ok=T)
  checkmate::assert_data_frame(d_lu_ethnicity     , any.missing=F, null.ok=T)
  checkmate::assert_character( variable_gender    , any.missing=F, min.chars=1, len=1)
  checkmate::assert_character( variable_race      , any.missing=F, min.chars=1, len=1)
  checkmate::assert_character( variable_ethnicity , any.missing=F, min.chars=1, len=1)

  levels_gender <- c(
    "Female",
    "Male",
    "Unknown/Not Reported"
  )
  levels_race <- c(
    "American Indian/Alaska Native",
    "Asian",
    "Native Hawaiian or Other Pacific Islander",
    "Black or African American",
    "White",
    "More than One Race",
    "Unknown or Not Reported"
  )
  levels_ethnicity <- c(
    "Not Hispanic or Latino",
    "Hispanic or Latino",
    "Unknown/Not Reported Ethnicity"
  )

  # Enumerate all possible combinations of the three variables
  d_possible <- tidyr::crossing(
    gender    = levels_gender,
    race      = levels_race,
    ethnicity = levels_ethnicity
  )

  d <- d %>%
    dplyr::select_(
      "gender"      = variable_gender   ,
      "race"        = variable_race     ,
      "ethnicity"   = variable_ethnicity
    )
  if( !is.null(d_lu_gender) ) {
    d <- d %>%
      dplyr::left_join(d_lu_gender, by=c("gender" = "input")) %>%
      dplyr::select(-.data$gender) %>%
      dplyr::rename(gender = .data$displayed)
  }

  if( !is.null(d_lu_race) ) {
    d <- d %>%
      dplyr::left_join(d_lu_race, by=c("race" = "input")) %>%
      dplyr::select(-.data$race) %>%
      dplyr::rename(race = .data$displayed)
  }

  if( !is.null(d_lu_ethnicity) ) {
    d <- d %>%
      dplyr::left_join(d_lu_ethnicity, by=c("ethnicity" = "input")) %>%
      dplyr::select(-.data$ethnicity) %>%
      dplyr::rename(ethnicity = .data$displayed)
  }

  d_count <- d %>%
    dplyr::count(.data$gender, .data$race, .data$ethnicity) %>%
    dplyr::full_join(d_possible, by = c("gender", "race", "ethnicity")) %>%
    dplyr::mutate(
      gender    = factor(.data$gender   , levels=levels_gender    ),
      race      = factor(.data$race     , levels=levels_race      ),
      ethnicity = factor(.data$ethnicity, levels=levels_ethnicity ),
      n         = dplyr::coalesce(.data$n, 0L)
    ) %>%
    dplyr::select(.data$gender, .data$race, .data$ethnicity, .data$n) %>%
    dplyr::arrange(.data$gender, .data$race, .data$ethnicity)
}

#' @export
table_nih_enrollment_pretty <- function(
  d,
  d_lu_gender=NULL, d_lu_race=NULL, d_lu_ethnicity=NULL,
  variable_gender="gender", variable_race="race", variable_ethnicity="ethnicity"
) {
  column_order <- c(
    "race",

    "Female by Not Hispanic or Latino",
    "Male by Not Hispanic or Latino",
    "Unknown/Not Reported by Not Hispanic or Latino",

    "Female by Hispanic or Latino",
    "Male by Hispanic or Latino",
    "Unknown/Not Reported by Hispanic or Latino",

    "Female by Unknown/Not Reported Ethnicity",
    "Male by Unknown/Not Reported Ethnicity",
    "Unknown/Not Reported by Unknown/Not Reported Ethnicity"
  )

  table_nih_enrollment(d, d_lu_gender, d_lu_race, d_lu_ethnicity, variable_gender, variable_race, variable_ethnicity) %>%
    dplyr::mutate(
      gender_ethnicity  = paste0(.data$gender, " by ", .data$ethnicity)
    ) %>%
    dplyr::select(-.data$gender, -.data$ethnicity) %>%
    tidyr::spread(key=.data$gender_ethnicity, value=.data$n) %>%
    dplyr::select(!!column_order) %>%
    knitr::kable(
      format      = "html",
      format.args = list(big.mark=","),
      escape      = FALSE,
      col.names   = c(
        "Racial\nCategories",
        "Female",
        "Male",
        "Unknown/<br/>Not Reported",
        "Female",
        "Male",
        "Unknown/<br/>Not Reported",
        "Female",
        "Male",
        "Unknown/<br/>Not Reported"
      )
    ) %>%
    kableExtra::kable_styling(
      bootstrap_options = c("striped", "hover", "condensed", "responsive"),
      full_width        = FALSE
    ) %>%
    kableExtra::column_spec(c(1, 4, 7), border_right = T) %>%
    kableExtra::add_header_above(c(
      " "                               = 1L,
      "Not Hispanic or Latino"          = 3L,
      "Hispanic or Latino"              = 3L,
      "Unknown/Not Reported Ethnicity"  = 3L
    )) %>%
    kableExtra::add_header_above(c(" " = 1L, "Ethnic Categories" = 9L))
}
