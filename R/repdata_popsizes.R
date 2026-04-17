#' Spatial population sizes of strata in each domain
#'
#' The data frame `domain_stratum_nunits` contains the spatial population size of each
#' stratum in each domain, without taking into account scheme-specific spatial
#' restrictions.
#'
#' `domain_stratum_nunits` is based on the collapsed & phab-corrected base sampling frame
#' (`stratum_grts_n2khab_phabcorrected_no_replacements`). Hence it is
#' scheme-agnostic, while some schemes need a more restricted sampling frame
#' (see [`sp_samplingframes`]). For the final population sizes at submodule x
#' domain x scheme level, see [`submod_dom_scheme_ssf_stratum_nunits`].
#'
#' @inherit modules source format
#'
#' @family REP objects about spatial population size
#'
#' @name domain_stratum_nunits
NULL



#' Spatial population sizes of types in each domain
#'
#' The data frame `domain_type_nunits` contains the spatial population size of each type
#' in each domain, without taking into account scheme-specific spatial
#' restrictions.
#'
#' `domain_type_nunits` is derived from [`domain_stratum_nunits`] by simply
#' aggregating strata that belong to the same type; see its documentation for
#' more background, as well as [`submod_dom_scheme_ssf_stratum_nunits`].
#'
#' @inherit modules source format
#'
#' @family REP objects about spatial population size
#'
#' @name domain_type_nunits
NULL



#' Spatial population sizes of strata at submodule x domain x scheme level
#'
#' The data frame `submod_dom_scheme_ssf_stratum_nunits` contains the spatial population
#' size of each stratum in each submodule x domain x scheme.
#'
#' `submod_dom_scheme_ssf_stratum_nunits` is based on [`scheme_sampling_frame`],
#' [`sp_samplingframe_domain`], [`scheme_targetpop_sets`], [`submodules`] and
#' [`module_domains`]. Its main application is the finite population correction.
#'
#' @inherit modules source format
#'
#' @family REP objects about spatial population size
#'
#' @name submod_dom_scheme_ssf_stratum_nunits
NULL



#' Type population size summary statistics per submodule x domain x scheme
#'
#' The data frame `submodule_domain_scheme_typestats` contains type counts and
#' spatial population size ranges and quartiles for each submodule x domain x
#' scheme.
#'
#' `submodule_domain_scheme_typestats` is an aggregation based on
#' [`submod_dom_scheme_ssf_stratum_nunits`]. It is used in the spatiotemporal
#' design attributes ([`submodule_domain_scheme_ps_designattr`]).
#'
#' @inherit modules source format
#'
#' @family REP objects about spatial population size
#'
#' @name submodule_domain_scheme_typestats
NULL



#' Stratum population size summary statistics per submodule x domain x scheme
#'
#' The data frame `submodule_domain_scheme_stratumstats` contains stratum counts
#' and spatial population size ranges and quartiles for each submodule x domain
#' x scheme.
#'
#' `submodule_domain_scheme_stratumstats` is an aggregation based on
#' [`submod_dom_scheme_ssf_stratum_nunits`]. It is used in the spatiotemporal
#' design attributes ([`submodule_domain_scheme_ps_designattr`]).
#'
#' @inherit modules source format
#'
#' @family REP objects about spatial population size
#'
#' @name submodule_domain_scheme_stratumstats
NULL
