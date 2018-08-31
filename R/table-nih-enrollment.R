#' @name table_nih_enrollment
#' @export
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
#'

table_nih_enrollment <- function( d, d_lu_gender, d_lu_race, d_lu_ethnicity ) {
  checkmate::assert_data_frame(d                  , any.missing=F)
  # checkmate::assert_data_frame(d_lu_gender        , any.missing=T)
  # checkmate::assert_data_frame(d_lu_race          , any.missing=T)
  # checkmate::assert_data_frame(d_lu_ethnicity     , any.missing=T)

  d %>%
    dplyr::count(gender, race, ethnicity)

}
