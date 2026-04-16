#' Activities that support data collection directly or indirectly
#'
#' The data frame `activities` defines activities that support data collection
#' in some essential way, either directly or indirectly.
#'
#' Several attributes are given and not all categories are further used by the
#' REP-workflow. The field activities are used in the REP to create the designed
#' sampling unit calendar of field activity groups
#' ([`fag_stratum_grts_calendar`]). Several other activities are used in
#' fieldwork optimization steps outside of the REP.
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept REP objects that define variables and activities
#'
#' @name activities
NULL



#' Activity sequences
#'
#' The data frame `activity_sequences` defines the available activity sequences.
#' An activity sequence is a set of activities (from [`activities`]) that are
#' tied together at location level for a specific scheme in a module, with a
#' specific chronological order and a specific intent.
#'
#' The intent of an activity sequence is to be seen in the context of a scheme
#' in a module, and relates to data collection for one or more variables. An
#' activity sequence may be used by different schemes, and a single scheme may
#' combine more than one, since multiple variables are determined by a single
#' scheme. Also, different activity sequences may apply to the same scheme
#' depending on the module.
#'
#' Some activities in an activity sequence may have different panel designs, due
#' to the nature of the activity or other requirements or restrictions, so the
#' frequency of some activities may be higher but the overall chronology remains
#' in place.
#'
#' @section Note:
#'
#'   Currently, `activity_sequences` is also the place where the activity groups
#'   are inherently defined (i.e. which activities they are composed of),
#'   although this is no logical place for this. The plan is to isolate that
#'   aspect so that `activity_sequences` can be replaced by an object
#'   `activity_group_sequences`.
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept REP objects that define variables and activities
#'
#' @name activity_sequences
NULL



#' Variables and measurement variables
#'
#' The data frame `mod_scheme_vars` defines variables (usually environmental
#' variables) per module and (MNE) scheme, as well the associated measurement
#' variable (if the variable is directly based on measurements). Also, the
#' target site factor is given for which the variable serves a role in the
#' module and scheme. Further, multiple attributes are given that characterize
#' the variable in the context of the module and the scheme.
#'
#' The measurement variable may be different from the environmental variable
#' when the latter is defined by aggregating multiple measurements to obtain one
#' value for the spatiotemporal sampling unit.
#'
#' In the context of a module and (especially) a scheme, variables can be
#' qualified as 'target variables' (aka primary environmental variables),
#' 'explanatory variables' or 'quality control variables'. A variable sometimes
#' belongs to more than one of these categories.
#'
#' XXXXXX **Omit once columns have been described**: XXXXXXXXXXXXXXXX The main
#' data collection method represents the activity that is considered most
#' essential (most specific) for the data collection in the spatial or
#' spatiotemporal sampling unit. It must be an activity from the [`activities`]
#' object.
#'
#'
#' @inherit modules source format
#'
#' @family defining REP objects
#' @concept REP objects that define variables and activities
#'
#' @name mod_scheme_vars
NULL



#' Main field activities per module and scheme
#'
#' The data frame `mod_scheme_variableset_mainfieldactivity` contains just the
#' main data collection methods from [`mod_scheme_vars`] that are field
#' activities, which are now renamed as 'main field activities'. In addition, it
#' contains the main field activities for MHQ schemes.
#'
#' Note that MHQ schemes are not considered in [`mod_scheme_vars`], which is
#' focused on MNE, but their associated activities are supported by
#' [`activities`] and [`activity_sequences`].
#'
#' Note that the terms 'main data collection method' and 'main field activity'
#' are to be understood from the viewpoint of a _variable (variable set)_ in a
#' module:scheme combination; it is not about the 'main method' of the
#' module:scheme combination. In consequence, multiple 'main field activities'
#' can be linked to a module:scheme combination, and they may come from target
#' variables and other variables as well.
#'
#' @inherit modules source format
#' @inheritSection module_schemes Restriction by domains and sampling frames
#'
#' @family derivatives of defining REP objects
#' @concept derived REP objects with regard to variables and activities
#'
#' @name mod_scheme_variableset_mainfieldactivity
NULL



#' Strata for sampling and inference
#'
#' The data frame `mod_scheme_targetfieldactivity` contains the main field
#' activities that are related to the target variable(s) of a module and scheme.
#'
#' `mod_scheme_targetfieldactivity` is indirectly derived from
#' [`mod_scheme_variableset_mainfieldactivity`].
#'
#' @inherit modules source format
#' @inheritSection module_schemes Restriction by domains and sampling frames
#'
#' @family derivatives of defining REP objects
#' @concept derived REP objects with regard to variables and activities
#'
#' @name mod_scheme_targetfieldactivity
NULL



#' Field activities and field activity groups per module, scheme & spatial
#' subset
#'
#' The data frame `mod_scheme_field_activity` contains all field activities and
#' associated field activity groups per module, scheme and spatial subset. They
#' follow from the applicable activity sequences.
#'
#' `mod_scheme_field_activity` (indirectly) builds on
#' [`mod_scheme_variableset_mainfieldactivity`], [`activity_sequences`] and
#' properties of the target populations.
#'
#' XXXXXX **Omit once columns have been described**: XXXXXXXXXXXXXXXX The
#' spatial subset is currently used to distinguish between aquatic and
#' terrestrial strata, where this is relevant to determine the applicable
#' activity sequence (i.e. for involved field activity groups).
#'
#' @inherit modules source format
#' @inheritSection module_schemes Restriction by domains and sampling frames
#'
#' @family derivatives of defining REP objects
#' @concept derived REP objects with regard to variables and activities
#'
#' @name mod_scheme_field_activity
NULL
