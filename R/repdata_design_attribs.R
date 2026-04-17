#' Spatiotemporal design attributes per submodule x domain x scheme x panel set
#'
#' The data frame `submodule_domain_scheme_ps_designattr` contains the
#' spatiotemporal design attributes per submodule x domain x scheme x panel set.
#'
#' `submodule_domain_scheme_ps_designattr` is the last stage in the REP workflow
#' where submodules are being distinguished; in determining stratum level sample
#' sizes (see [`module_domain_scheme_ps_stratum_sample_size`]) the sample sizes
#' of the submodules of each module are taken together (see [`submodules`]).
#'
#' XXXXXX **Omit once columns have been described**: XXXXXXXXXXXXXXXX The
#' spatial sample sizes refer to the submodule x domain x scheme x panel set
#' level (`sp_sample_size_all_panels`) and to the level of a single
#' (generalized) type (`sp_sample_size_all_panels_type`) within submodule x
#' domain x scheme x panel set, respectively.
#'
#' @inherit modules source format
#'
#' @family REP objects with design attributes
#'
#' @name submodule_domain_scheme_ps_designattr
NULL



#' Spatial sample sizes of strata per module x domain x scheme x panel set
#'
#' The data frame `module_domain_scheme_ps_stratum_sample_size` contains the
#' spatial sample size per stratum in each module x domain x scheme x panel set.
#'
#' `module_domain_scheme_ps_stratum_sample_size` plays a key role in the spatial
#' sampling procedure. It is derived from
#' [`submodule_domain_scheme_ps_designattr`], it no longer distinguishes between
#' submodules (see [`submodules`]) and takes into account finite population
#' correction.
#'
#' @section Note:
#'
#'   This object still has the full target population for each module x domain x
#'   scheme in the case of non-core schemes, but the sample sizes will generally
#'   be missing values since they are not designed: only the locations that are
#'   common between the sample of a related core scheme and the sampling frame
#'   of the non-core scheme can be attributed to the non-core scheme (insofar
#'   the core scheme schedules data collection that makes sense to the non-core
#'   scheme target variables). So this sample can be a subset of the sample of
#'   the core scheme. Since it causes no extra fieldwork, we don't explicitly
#'   consider these sample sizes and samples. (There's still an exception
#'   possible: we exceptionally attribute an extra sample size in non-core MNE
#'   schemes in order to adopt an extra type (which must belong to the non-core
#'   scheme's target population) that is not covered by a corresponding core MNE
#'   scheme, if it makes an important difference to that non-core scheme.)
#'
#' @inherit modules source format
#'
#' @family REP objects with design attributes
#'
#' @name module_domain_scheme_ps_stratum_sample_size
NULL



#' Panel design of field activity groups per module x scheme x panel set x
#' spatial subset
#'
#' The data frame `mod_scheme_ps_fag_paneldesign` defines the panel design of
#' each field activity group per module x scheme x panel set x spatial subset.
#'
#' `mod_scheme_ps_fag_paneldesign` (indirectly) uses
#' [`mod_scheme_field_activity`] as its base, but with collapsed activity
#' sequences: field activity groups shared among multiple activity sequences (in
#' the same module, scheme and spatial subset) appear only once.
#'
#' @inherit modules source format
#' @inheritSection mod_scheme_field_activity Spatial subset XXXXXXXXXXXXXX
#'
#' @family REP objects with design attributes
#'
#' @name mod_scheme_ps_fag_paneldesign
NULL



#' Target panel designs per scheme x panel set x module combo
#'
#' The data frame `scheme_ps_target_paneldesign` contains only the panel designs
#' (from [`mod_scheme_ps_fag_paneldesign`]) for the so called 'target field
#' activity groups' (target FAGs), i.e. the FAGs containing the target field
#' activity (see [`mod_scheme_targetfieldactivity`]). These panel designs can be
#' called _target_ panel designs and the corresponding panels will be called
#' 'targetpanels'. Importantly, the module level is gone: instead, modules with
#' the same target panel design are combined as 'module combos' at the scheme x
#' panel set level.
#'
#' `scheme_ps_target_paneldesign` is derived from
#' [`mod_scheme_targetfieldactivity`], [`mod_scheme_ps_fag_paneldesign`] and
#' [`mod_scheme_field_activity`] (to link field activity and field activity
#' groups).
#'
#' The target variables limit the main field activities of a module x scheme to
#' a great extent, since the latter also comprise variables for explanation &
#' quality control. (Remember: the term 'main field activity' is to be
#' understood from the viewpoint of a variable (set) in a module x scheme, not
#' just the module x scheme; see [`mod_scheme_variableset_mainfieldactivity`].)
#'
#' For each scheme x panel set, the modules (in
#' [`mod_scheme_ps_fag_paneldesign`]) have been collapsed to **module combos**
#' (module combinations) if the corresponding target panel design is the same.
#'
#' - So, beware that the module combo can only be interpreted as a unique panel
#' design in combination with scheme x panel set.
#' - `scheme_ps_target_paneldesign` is the object in the REP-workflow where the
#' module combos are effectively generated and defined.
#' - However, see the derived data frame [`mod_scheme_yrs_moco_ps`] for a
#' convenient object that links modules and module combos within scheme x panel
#' set.
#' - The concept of module combos is important to the spatial
#' sampling procedure: spatial sampling for a scheme x panel set is to be
#' combined over active modules when their target panel design is the same. This
#' is necessary since the modules can have overlapping domains.
#'
#' Note that the 'spatial subset' from [`mod_scheme_ps_fag_paneldesign`] is
#' gone. That is because for the _main_ field activities the spatial subsets
#' don't have differences in the corresponding panel designs.
#'
#' @inherit modules source format
#'
#' @family REP objects with design attributes
#'
#' @name scheme_ps_target_paneldesign
NULL



#' Relation between module x scheme x panel set and module combos
#'
#' The data frame `mod_scheme_yrs_moco_ps` is a simple object with the link
#' between modules and module combos per scheme x panel set.
#'
#' `mod_scheme_yrs_moco_ps` is derived from [`scheme_ps_target_paneldesign`] and
#' [`module_domain_scheme_ps_stratum_sample_size`].
#'
#' Compared to [`scheme_ps_target_paneldesign`], `mod_scheme_yrs_moco_ps` no
#' longer covers the non-core schemes, except if a type had been additionally
#' adopted for such a scheme (see
#' [`module_domain_scheme_ps_stratum_sample_size`]).
#'
#' @inherit modules source format
#'
#' @family REP objects with design attributes
#'
#' @name mod_scheme_yrs_moco_ps
NULL



#' Panel designs of measurements (data occurrence) per scheme x panel set
#'
#' The data frame `scheme_ps_variableset_paneldesign` contains the panel design
#' of measurements at the level of a variable set in a scheme x panel set. With
#' 'measurements' we mean the data occurrence, not the human activity. The
#' associated 'main field activity' is included though to make clear _how_ the
#' data are collected. All variables are covered, so this is different from the
#' scope of [`scheme_ps_target_paneldesign`], where only the 'target field
#' activities' (main field activities for target variables) are considered.
#'
#' `scheme_ps_variableset_paneldesign` has statistical relevance and it is
#' (should be) in line with relevant parts of [`mod_scheme_ps_fag_paneldesign`],
#' but it is not used further in the REP workflow.
#'
#' `scheme_ps_variableset_paneldesign` uses
#' [`mod_scheme_variableset_mainfieldactivity`] as its base.
#'
#' Notable differences with [`mod_scheme_ps_fag_paneldesign`] are that:
#'
#' - automated frequent measurements are reflected as 'frequent revisit' while
#' fieldwork is much less frequent;
#' - currently no distinction between modules is made;
#' - only core schemes are considered;
#' - no installation or maintenance is involved, since those are not main field
#' activities (for a variable set).
#'
#' @inherit modules source format
#'
#' @family REP objects with design attributes
#'
#' @name scheme_ps_variableset_paneldesign
NULL
