#' Designed short-term fieldwork calendar with extra attributes
#'
#' The data frame `fieldwork_shortterm_prioritization_by_stratum` is an extract
#' from [fag_stratum_grts_calendar] and has extra attribute columns. The aim is
#' to provide the input needed for shortterm fieldwork planning and
#' prioritization, based on the designed revisit pattern of the most important
#' field activities. For that reason, it has the `priority` and `wait_xxx`
#' columns.
#'
#' The `is_forest`, `in_mhq_samples` and `last_type_assessment_in_field` columns
#' are given because they drive subsampling locations in cell-based sampling
#' units.
#'
#' The dates of early `"LOCEVAL"`-containing field activity groups may have been
#' edited (postponed) compared to [fag_stratum_grts_calendar].
#'
#' @field scheme_ps_targetpanels Factor. A concatenation of `"{scheme}:PS{panel
#'   set number}{targetpanel}"` strings, separated by `" | "` in case more than
#'   one targetpanel applies. It represents the different targetpanels (each
#'   belonging to a scheme and panel set) for which this field activity group in
#'   the specified spatial sampling unit needs to be done in the specified date
#'   interval as it cannot be delayed for the data collection in this
#'   targetpanel.
#'
#' @field schemes_served_all Factor. A concatenation of schemes, separated by
#'   `"|"`, that will make use of this scheduled field activity group (FAG) in
#'   the specified spatial sampling unit. It includes the schemes mentioned in
#'   `scheme_ps_targetpanels` but it can have more: in other schemes this FAG
#'   would have been scheduled at a later time, but they can and will use this
#'   FAG occasion instead.
#'
#' @field nr_schemes_current Integer. The number of schemes that have scheduled
#'   this field activity group in the specified spatial sampling unit in the
#'   specified date interval.
#'
#' @field nr_schemes_later Integer. The number of schemes that originally
#'   scheduled this field activity group in the specified spatial sampling unit
#'   in a later date interval, but that will be using this occasion instead.
#'
#' @field stratum Factor. A type or a subdivision thereof, used in the
#'   stratified sampling design and inference. Defined by the [n2khab_strata]
#'   data frame.
#'
#' @field grts_address Integer. The GRTS address from the
#'   [`GRTSmaster_habitats`](https://doi.org/10.5281/zenodo.2611233) data source
#'   that has been drawn when creating the sample. **`grts_address` and
#'   `stratum` together identify the spatial sampling unit**.
#'
#' @field grts_address_final Integer. The GRTS address from the
#'   [`GRTSmaster_habitats`](https://doi.org/10.5281/zenodo.2611233) data source
#'   that has been used as a local replacement for `grts_address`, given the
#'   `stratum`. Its role is to point at the final location for data collection.
#'   `grts_address_final` remains tied to `grts_address` and `stratum`, that
#'   identify the spatial sampling unit. (`grts_address_final` can also be
#'   regarded as a secondary sampling unit within a larger primary sampling unit
#'   determined by `grts_address` and `stratum`.)
#'
#' @field grts_join_method Factor. The method that has served to assign a GRTS
#'   address to the sampling unit.
#'
#' @field is_forest Logical. Does the stratum correspond to a forest type?
#'   Forest types are defined using the regex `"^9|^2180|^rbbppm"`.
#'
#' @field in_mhq_samples Logical. Is the sampling unit also a member of a
#'   spatial sample of MHQ (at the Flemish level)?
#'
#' @field last_type_assessment_in_field Logical. Did the sampling unit get a
#'   field assessment in the past as part of MHQ (at the Flemish level)?
#'
#' @field domain_part Factor. The domain partition to which the spatial sampling
#'   unit belongs.
#'
#' @field scheme_ps_oldtargetpanel Factor. A string formatted as
#'   `"{scheme}:PS{panel set number}{targetpanel}"` but according to an older
#'   version of the REP. Most rows have a missing value, but rows with a value
#'   refer to a part of [fag_stratum_grts_calendar] from an older REP version
#'   that has been appended to the current version.
#'
#' @field date_start Date. Start of the date interval during which the field
#'   activity group is scheduled in the spatial sampling unit.
#'
#' @field date_end Date. End of the date interval during which the field
#'   activity group is scheduled in the spatial sampling unit.
#'
#' @field date_interval [Interval][lubridate::Interval-class]. The date interval
#'   during which the field activity group is scheduled in the spatial sampling
#'   unit.
#'
#' @field field_activity_group Factor. A defined group of field activities. Many
#'   field activity groups consist of just one field activity.
#'
#' @field rank Integer. A rank number representing the order of execution
#'   relative to other field activity groups that are scheduled in the same date
#'   interval, for the same spatial sampling unit. This rank has originally been
#'   defined within an activity sequence that was assigned to the spatial
#'   sampling unit in the context of a specific module and scheme.
#'
#' @field priority Integer. A rank number representing the priority of the
#'   scheduled field activity group for the specified spatial sampling unit.
#'
#' @field wait_any Logical. Should the scheduled field activity group in the
#'   specified spatial sampling unit be put on hold? This column is `TRUE` if
#'   any of the other wait columns is `TRUE`.
#'
#' @field wait_watersurface Logical. Should the scheduled field activity group
#'   in the specified spatial sampling unit be put on hold because the sampling
#'   unit is a watersurface? Watersurface types are defined using the regex
#'   `"^31|^2190_a"`.
#'
#' @field wait_3260 Logical. Should the scheduled field activity group in the
#'   specified spatial sampling unit be put on hold because the sampling unit
#'   belongs to type `3260`?
#'
#' @field wait_7220 Logical. Should the scheduled field activity group in the
#'   specified spatial sampling unit be put on hold because the sampling unit
#'   belongs to type `7220`?
#'
#' @field wait_floating Logical. Should the scheduled field activity group in
#'   the specified spatial sampling unit be put on hold because the sampling
#'   unit belongs to a floating (fen) type? Currently this is defined as type
#'   `7140_mrd`.
#'
#' @field wait_mhq Logical. Should the scheduled field activity group in the
#'   specified spatial sampling unit be put on hold because in the considered
#'   date interval (year) the field activity group is only needed for a MHQ
#'   scheme? (The latter is seen in the value of `scheme_ps_targetpanels`.)
#'
#' @source The code snippets file, which creates objects derived from REP
#'   objects. See
#'   <https://github.com/inbo/n2khab-mne-monitoring/blob/main/020_fieldwork_organization/code_snippets.R>.
#'
#' @family code snippets objects
#'
#' @name fieldwork_shortterm_prioritization_by_stratum
NULL
