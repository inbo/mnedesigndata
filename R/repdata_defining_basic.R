#' Modules
#'
#' The data frame `modules` defines the modules, their names, shortnames and
#' codes, as well as several temporal attributes.
#'
#' A module is like a project, that aims at realizing some well-defined part of
#' MNE + MHQ. It determines which schemes, which domains and which part of the
#' target populations are in scope for the module. For the schemes and target
#' populations this happens indirectly via [`submodules`]; for the domains this
#' is via [`module_domains`].
#'
#' Several objects with scheme properties have a `module` column to make these
#' properties module-dependent.
#'
#' @format Data frame.
#'
#' @source The REP (revisitplan) workflow. See
#'   <https://github.com/inbo/n2khab-mne-designs/tree/revisitplan/100_design_common/010_revisitplan>.
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name modules
NULL



#' Submodules, with a set of schemes and target populations
#'
#' The data frame `submodules` defines the submodules of each module. Each
#' submodule is strictly linked to a set of schemes and associated target
#' populations.
#'
#' The submodule name is only unique within a module. Each module has at least a
#' single submodule, typically the submodule 'main'. With only a single
#' submodule 'main' in place, the role of a submodule is trivial.
#'
#' More submodules can exist in the same module, and these open the possibility
#' to differentially extend the spatial sample of the main submodule. This means
#' that some strata get extra locations than others, and other strata may be
#' neglected in the submodule, meaning that the scheme + target population set
#' may be smaller than the one at the module level. Put more generally,
#' submodules differ in their scheme + target population set but together they
#' represent the scheme + target population set of the module.
#'
#' Submodules of the same module serve to contribute a part of the spatial
#' sample size of each stratum in a module x scheme x domain, via
#' [`submodule_domain_scheme_ps_designattr`].
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name submodules
NULL



#' Strata for sampling and inference
#'
#' The data frame `n2khab_strata` defines the stratum levels available in the
#' `stratum` column of the spatial sampling frames (see [`sp_samplingframes`],
#' [`scheme_sampling_frame`]). Also, the data frame defines the link between
#' `type` and `stratum`.
#'
#' The strata are used in spatial sampling and inference. They are either a type
#' or a subdivision thereoff. The latter applies to watersurface types (type
#' regex `"^31|^2190_a"`) and to type `8310`.
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name n2khab_strata
NULL



#' Named sets of schemes with target populations
#'
#' The data frame `scheme_targetpop_sets` defines different collections of
#' schemes with associated target populations. Each submodule in the
#' [`submodules`] object refers to a single 'scheme + target population set',
#' i.e. to one row of this data frame.
#'
#' The target populations are given at type level and at stratum level. The
#' stratum level target population follows from the type level, as all strata of
#' each involved type are included.
#'
#' These target populations cannot exceed the target populations defined by
#' [n2khabmon::read_scheme_types()], but they can be subsets considered by a
#' specific (sub)module, which is their true aim.
#'
#' Note that `scheme_targetpop_sets` can list more sets than actually used by
#' the active modules and submodules.
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name scheme_targetpop_sets
NULL



#' All schemes considered by `scheme_targetpop_sets`
#'
#' The data frame `schemes` contains the schemes listed by at least one
#' 'scheme + target population set' of the [`scheme_targetpop_sets`] object.
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name schemes
NULL



#' All target populations considered by `scheme_targetpop_sets`, at type level
#'
#' The data frame `targetpops` contains the target populations (at type level)
#' listed by at least one 'scheme + target population set' of the
#' [`scheme_targetpop_sets`] object.
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name targetpops
NULL



#' All target populations considered by `scheme_targetpop_sets`, at stratum
#' level
#'
#' The data frame `targetpops_strata` contains the target populations (at
#' stratum level) listed by at least one 'scheme + target population set' of
#' the [`scheme_targetpop_sets`] object.
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name targetpops_strata
NULL



#' Domains
#'
#' The sf object `domains` defines code, names and geometry of each geospatial
#' domain that is targeted by a module (see [`module_domains`]).
#'
#' With the term 'domain' we always refer to a geospatial domain listed in this
#' object.
#'
#' @format A simple feature collection of type MULTIPOLYGON.
#'
#' @inherit modules source
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name domains
NULL



#' Domains per module
#'
#' The data frame `module_domains` defines which geospatial domains are targeted
#' by each module.
#'
#' For the domains, see [`domains`]; for the modules, see [`modules`].
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name module_domains
NULL



#' Domain partition of each GRTS address in the base sampling frame
#'
#' The data frame `domainpart_grts_n2khab` classifies the GRTS addresses of the
#' base sampling frame using the domain partition. Domain partitions are
#' mutually exclusive in space, while domains (see [`domains`]) can spatially
#' overlap.
#'
#' The domain partition is used to uniquely characterize each GRTS address,
#' preferring its membership to the smallest (innermost) domain it belongs to,
#' whereas the remainder of the larger (including) domain is regarded as the
#' domain partition labelled with suffix `"_remainder"`.
#'
#' Note that values of the `domain_part` column can also be based on domains
#' that are not used to drive sampling.
#'
#' `domainpart_grts_n2khab` is derived from the `domain_grts_n2khab` data frame,
#' itself derived from [`domains`] and `grts_mh_n2khab` (= the
#' `GRTSmaster_habitats` raster data source subsetted by the base sampling
#' frame).
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name domainpart_grts_n2khab
NULL



#' Schemes per module
#'
#' The data frame `module_schemes` lists the schemes of each module. It is
#' derived from [`submodules`] and [`scheme_targetpop_sets`].
#'
#' @section Restriction by domains and sampling frames:
#'
#'   This object has been further restricted by [`module_domain_schemes`]. This
#'   means that the current spatial distribution of target populations of the
#'   module's schemes _within the module's domain(s)_ is taken into account,
#'   using the scheme's spatial sampling frame. When the domains of a module
#'   represent a relatively small area, it is possible:
#'
#'   - for target populations:  that some types (that were initially targeted by the
#'   module) are not present in that area and consequently dropped from the
#'   module's target populations
#'   - for schemes: that some schemes targeted by the module are not
#'   applicable, i.e. when no types of its target population are present in that
#'   area
#'
#'   Also, note that for MHQ schemes, [`module_domain_schemes`] only considers –
#'   on a domain basis – the schemes with sampling approaches, not the census
#'   approaches, and this also leads to a further restriction.
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name module_schemes
NULL



#' Target populations per module
#'
#' The data frame `module_targetpops` lists the target populations of each
#' module at type level. It is derived from [`submodules`] and
#' [`scheme_targetpop_sets`].
#'
#' @inherit modules source format
#' @inheritSection module_schemes Restriction by domains and sampling frames
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name module_targetpops
NULL



#' Spatial sampling frames
#'
#' The data frame `sp_samplingframes` defines spatial sampling frames that can
#' be shared among different schemes and modules, but which are generally still
#' 'too large' for a specific scheme in a specific module. The object
#' [`scheme_sampling_frame`] defines which spatial sampling frame should be
#' further processed for use in a specific scheme.
#'
#' These spatial sampling frames are the result of applying some special spatial
#' restrictions to the base sampling frame as implied by
#' [n2khabmon::read_scheme_types()]. To obtain the ultimate spatial sampling
#' frame for a specific scheme in a specific module, these sampling frames must
#' still be subsetted using the target population and domain implied by a scheme
#' in a module. A summarized result of that final step can be found in
#' [`submod_dom_scheme_ssf_stratum_nunits`].
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name sp_samplingframes
NULL



#' Spatial sampling frames with a domain attribute
#'
#' The data frame `sp_samplingframe_domain` is no more than the data frame
#' `sp_samplingframes` where each sampling frame has been extended with a
#' `domain` column. Since domains can overlap, joining the spatial population
#' units with the applicable domain(s) has generated duplicates of many units in
#' this object.
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name sp_samplingframe_domain
NULL



#' Spatial sampling frames by scheme
#'
#' The data frame `scheme_sampling_frame` defines which spatial sampling frame
#' from [`sp_samplingframes`] should be further processed to use in a specific
#' scheme.
#'
#' See [`sp_samplingframes`] for more information.
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept basic defining REP objects
#'
#' @name scheme_sampling_frame
NULL



#' Schemes per module x domain, taking into account the sampling frames
#'
#' The data frame `module_domain_schemes` lists the schemes that apply to each
#' domain in each module, according to the presence of strata in domains, hence
#' according to the sampling frames.
#'
#' For MHQ schemes, `module_domain_schemes` only considers – on a domain basis –
#' the schemes with sampling approaches, not the census approaches, and this
#' also leads to a further restriction.
#'
#' `module_domain_schemes` is derived from
#' [`submod_dom_scheme_ssf_stratum_nunits`], which is in turn derived from
#' [`scheme_sampling_frame`], [`sp_samplingframe_domain`] and a few other
#' objects (see there).
#'
#' `module_domain_schemes` has been used to limit several module:scheme objects
#' that had been made before, such as [`module_schemes`], [`module_targetpops`],
#' [`mod_scheme_variableset_mainfieldactivity`], [`mod_scheme_field_activity`],
#' [`mod_scheme_ps_fag_paneldesign`].
#'
#' @inherit modules source format
#'
#' @family derivatives of defining REP objects
#' @concept derivatives of basic defining REP objects
#'
#' @name module_domain_schemes
NULL



