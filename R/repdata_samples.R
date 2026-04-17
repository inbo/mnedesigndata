#' Spatial samples plus spare sampling units
#'
#' The data frame `scheme_moco_ps_stratum_sppost_spsamples_spares` contains the
#' spatial samples plus the spare units per stratum, for each scheme x panel set
#' x module combo.
#'
#' `scheme_moco_ps_stratum_sppost_spsamples_spares` is the first result of the
#' spatial sampling procedure that distinguishes the spatial poststrata.
#'
#' Note that spatial samples typically overlap between schemes, i.e. where the
#' scheme's target populations overlap.
#'
#' @inherit modules source format
#' @inheritSection scheme_moco_ps_stratum_sppost_spsamples Sample column notes
#'
#' @family REP objects of the design outcome
#'
#' @name scheme_moco_ps_stratum_sppost_spsamples_spares
NULL



#' Spatial samples
#'
#' The data frame `scheme_moco_ps_stratum_sppost_spsamples` contains the spatial
#' samples per stratum, for each scheme x panel set x module combo.
#'
#' `scheme_moco_ps_stratum_sppost_spsamples` is like
#' [`scheme_moco_ps_stratum_sppost_spsamples_spares`] without the spare units.
#'
#' Note that spatial samples typically overlap between schemes, i.e. where the
#' scheme's target populations overlap.
#'
#' @section Sample column notes:
#'
#'   XXXXXX **Omit once columns have been described**: XXXXXXXXXXXXXXXX
#'
#'   + `grts_address` and `stratum` together identify the spatial sampling unit.
#'   See further in [`fieldwork_shortterm_prioritization_by_stratum`].
#'
#'   + The spatial poststratum (`sp_poststratum`) serves to add spare units and
#'   to apply the revisit design (notably the panel membership design): it is
#'   based on the domain overlaps between modules in a module combo for a
#'   specific stratum in a scheme x panel set, so it is not an overall
#'   predetermined classification but a 'classification as needed'. It takes
#'   values of domains as well as the complement of overlapped smaller domains
#'   by using the suffix '_remainder', e.g. 'Flanders_remainder'. Don't use
#'   `sp_poststratum` to just characterize a GRTS address. If you need a fixed
#'   spatial partitioning across strata and schemes, make a join with
#'   [`domainpart_grts_n2khab`], where the 'domain partition' only represents
#'   areas that are mutually exclusive in space.
#'
#' @inherit modules source format
#'
#' @family REP objects of the design outcome
#'
#' @name scheme_moco_ps_stratum_sppost_spsamples
NULL



#' Designed fieldwork calendar per scheme x module combo x panel set x spatial
#' poststratum
#'
#' The data frame
#' `scheme_moco_ps_spsubset_fag_stratum_sppost_spsamples_calendar` represents
#' the designed sampling unit calendar of the distinguished field activity
#' groups (FAGs), after cleaning _within_, but not between, levels of scheme x
#' module combo x panel set x spatial poststratum.
#'
#' `scheme_moco_ps_spsubset_fag_stratum_sppost_spsamples_calendar` combines the
#' panel calendar and the panel memberships generated in the REP workflow, which
#' have been (indirectly) based on [`mod_scheme_ps_fag_paneldesign`] and
#' [`scheme_moco_ps_stratum_sppost_spsamples`]. Panels and FAG occasions have
#' been dropped if the scheduled calendar starts at a later point in time. Also
#' some superfluous occasions of specific auxiliary FAGs have been dropped.
#'
#' @inherit modules source format
#'
#' @family REP objects of the design outcome
#'
#' @name scheme_moco_ps_spsubset_fag_stratum_sppost_spsamples_calendar
NULL



#' Spatiotemporal samples
#'
#' The data frame
#' `scheme_moco_ps_spsubset_targetfag_stratum_sppost_spsamples_calendar`
#' represents the (planned) spatiotemporal samples per scheme x module combo x
#' panel set x spatial poststratum.
#'
#' `scheme_moco_ps_spsubset_targetfag_stratum_sppost_spsamples_calendar` is the
#' subset of [`scheme_moco_ps_spsubset_fag_stratum_sppost_spsamples_calendar`]
#' that only contains the target field activity groups (based on
#' [`mod_scheme_targetfieldactivity`]). The corresponding panel labels have been
#' simplified in the `targetpanel` column: 'targetpanels' are the panels of
#' target FAGs, cf. [`scheme_ps_target_paneldesign`].
#'
#' The spatiotemporal samples are not further used in the REP workflow, but the
#' object can be useful to add some attributes to FAG occasions from
#' [`fag_stratum_grts_calendar`], such as the involved scheme, module combo,
#' panel set and targetpanel. This has been done in the 'code snippets' (e.g.
#' [`fieldwork_shortterm_prioritization_by_stratum`]).
#'
#' @inherit modules source format
#'
#' @family REP objects of the design outcome
#'
#' @name scheme_moco_ps_spsubset_targetfag_stratum_sppost_spsamples_calendar
NULL



#' Designed fieldwork calendar
#'
#' The data frame `fag_stratum_grts_calendar` represents the designed sampling
#' unit calendar – across schemes – of the distinguished field activity groups
#' (FAGs). It has unique combinations of `stratum`, `grts_address`,
#' `date_interval` and `field_activity_group`.
#'
#' `fag_stratum_grts_calendar` is derived from the scheme-specific FAG calendars
#' (object [`scheme_moco_ps_spsubset_fag_stratum_sppost_spsamples_calendar`]) by
#' eliminating spatiotemporal duplication and taking into account the highest
#' required FAG frequency across schemes.
#'
#' @inherit modules source format
#'
#' @family REP objects of the design outcome
#'
#' @name fag_stratum_grts_calendar
NULL
