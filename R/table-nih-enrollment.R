#' @name table_nih_enrollment
#' @aliases  table_nih_enrollment table_nih_enrollment_pretty
#'
#' @title Produce an NIH-compliant enrolment table.
#'
#' @description Produce an NIH enrollment table, leveraging metadata to adapt to the observed [data.frame].
#'
#' @param d [data.frame] of observed values in the investigation. Required.
#' @param d_lu_gender [data.frame] that maps the observed levels of gender to the NIH-recommended levels of gender. Required only if the levels are not the same.
#' @param d_lu_race [data.frame] that maps the observed levels of gender to the NIH-recommended levels of gender. Required only if the levels are not the same.
#' @param d_lu_ethnicity [data.frame] that maps the observed levels of gender to the NIH-recommended levels of gender. Required only if the levels are not the same.
#'
#' @return Table for publication
#'
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @author Will Beasley, Peter Higgins, Andrew Peters, Sreeharsha Mandem
#'
#' @examples
#' d1 <- tibble::tribble(
#'   ~subject_id,   ~gender,                       ~race,                ~ethnicity,
#'            1L,    "Male", "Black or African American",  "Not Hispanic or Latino",
#'            2L,    "Male", "Black or African American",  "Not Hispanic or Latino",
#'            3L,  "Female", "Black or African American",  "Not Hispanic or Latino",
#'            4L,    "Male",                     "White",  "Not Hispanic or Latino",
#'            5L,    "Male",                     "White",  "Not Hispanic or Latino",
#'            6L,  "Female",                     "White",  "Not Hispanic or Latino",
#'            7L,    "Male",                     "White",      "Hispanic or Latino",
#'            8L,    "Male",                     "White",      "Hispanic or Latino"
#' )
#'
#' table_nih_enrollment(d1)
#' table_nih_enrollment_pretty(d1)
#'
#' \dontrun{
#' table_nih_enrollment(d1) %>%
#'   tidyr::spread(key=gender, value=n)
#'
#' table_nih_enrollment(d1) %>%
#'   dplyr::mutate(
#'     gender_ethnicity = paste0(gender, " by ", ethnicity)
#'   ) %>%
#'   dplyr::select(-gender, -ethnicity) %>%
#'   tidyr::spread(key=gender_ethnicity, value=n)
#'   }

#' @export
table_nih_enrollment <- function( d, d_lu_gender, d_lu_race, d_lu_ethnicity ) {
  checkmate::assert_data_frame(d                  , any.missing=F)
  # checkmate::assert_data_frame(d_lu_gender        , any.missing=T)
  # checkmate::assert_data_frame(d_lu_race          , any.missing=T)
  # checkmate::assert_data_frame(d_lu_ethnicity     , any.missing=T)

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

  d %>%
    dplyr::count(.data$gender, .data$race, .data$ethnicity) %>%
    dplyr::right_join(d_possible, by = c("gender", "race", "ethnicity")) %>%
    dplyr::mutate(
      n = dplyr::coalesce(.data$n, 0L)
    )
}

#' @export
table_nih_enrollment_pretty <- function(d, d_lu_gender, d_lu_race, d_lu_ethnicity ) {

  d %>%
    table_nih_enrollment() %>%
    dplyr::mutate(
      gender_ethnicity = paste0(.data$gender, " by ", .data$ethnicity)
    ) %>%
    dplyr::select(-.data$gender, -.data$ethnicity) %>%
    tidyr::spread(key=.data$gender_ethnicity, value=.data$n) %>%
    knitr::kable(
      format = "html"
    ) %>%
    kableExtra::kable_styling(
      bootstrap_options = c("striped", "hover", "condensed", "responsive"),
      full_width        = FALSE
    )


}
