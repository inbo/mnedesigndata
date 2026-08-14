#' Prioritized legacy watersample points for the lentic spatial sampling units
#'
#' The sf object `legacy_watersamplepoints_spslocs_lentic` lists legacy
#' watersample points in the spatial locations (watersurfaces) of the lentic
#' spatial sampling units, with those spatial locations being defined by
#' `grts_address_final`. These points serve as candidates for re-use when taking
#' watersamples. If multiple points are available for a single watersurface,
#' then guidance is added about which one is preferred. The prior criterion
#' variable is `legacy_try_first`. Since the `x` and `y` coordinates directly
#' define the points, they are included as explicit attribute columns in order
#' to maintain the point definition if the geometry column is dropped.
#'
#' Once a point for surface water sample extraction has been established in the
#' field for an aquatic sampling unit, it can be reused as long as it remains
#' useful and conforms to a list of (field) criteria. Existing (legacy)
#' watersample point data for lentic types are available in an INBO database
#' (ArcGIS file geodatabase); the ones that are potentially relevant to the
#' (current) lentic spatial sampling units are withheld in the object.
#'
#' The prior criterion to decide on reuse of a legacy watersample point is the
#' column `legacy_try_first` (see its description for the workflow).
#'
#' `lastdate_legacysampling_polygon` is the latest 'legacy' sampling date of the
#' watersurface polygon, i.e. from before 1 July 2026. If it is recent enough
#' (its year is not older than the planned sampling year minus 2 years) _and_
#' `legacy_try_first` for the considered watersample point is `TRUE`, then a
#' planned SAMPLPOINT FAG for the unit in the FAG calendar can be ignored.
#' However, if during fieldwork it is found that the point where
#' `legacy_try_first` is `TRUE` does not fulfill criteria, then the SAMPLPOINT
#' FAG still needs to be executed (note: the same adhoc SAMPLPOINT approach
#' applies when revisiting points created within MNE). The sampling date does
#' not apply to older points, i.e. where `legacy_try_first` is `FALSE`. If such
#' a point is considered, the SAMPLPOINT FAG is always needed. Consequently,
#' `lastdate_legacysampling_polygon` only has values in rows where
#' `legacy_try_first` is `TRUE`.
#'
#' The columns `active_in_db_from`, `active_in_db_till`, `annotation` and
#' `ranknr` may provide an extra hint if the `legacy_try_first` criterion and
#' field criteria still yield multiple point candidates.
#'
#' @format A simple feature collection of type POINT.
#'
#' @inherit modules source
#'
#' @field grts_address_final Integer. The GRTS address that defines the spatial
#'   position and geometry of a lentic spatial sampling unit, i.e. the
#'   watersurface polygon, given a data frame that links unique, stable GRTS
#'   addresses to watersurface geometries (see REP object
#'   `stratum_grts_spsamples_lentic_sf` or the derived `grts_lentic_sf` snippet
#'   object). `grts_address_final` may (theoretically) represent a local
#'   replacement for `grts_address`, given the `stratum`. Its role is to define
#'   the final location for data collection.
#'
#' @field polygon_id String. Identifier of the watersurface _according to the
#'   used version_ of data sources that provide the geometries and extra
#'   attributes of watersurfaces (notably the 'watersurfaces_hab' and
#'   'watersurfaces' data sources). See REP object
#'   `stratum_grts_spsamples_lentic_sf` or the derived `grts_lentic_sf` snippet
#'   object to readily obtain these geometries in R. Use
#'   [n2khab::read_watersurfaces_hab()] and [n2khab::read_watersurfaces()] if
#'   you need more attributes from the original data sources.
#'
#'   **Note** that `polygon_id` is kept only for information and perhaps to join
#'   extra attributes from 'watersurfaces_hab' and 'watersurfaces'. The stable
#'   column to identify the polygons is `grts_address_final`. This is because
#'   `polygon_id` values can change with the versions of 'watersurfaces_hab' and
#'   'watersurfaces'.
#'
#' @field lastdate_legacysampling_polygon Date. The latest sampling date of the
#'   corresponding watersurface polygon before 1 July 2026 ('legacy sampling'),
#'   if available. The date is to be used as a criterion to decide whether a
#'   full SAMPLPOINT FAG is needed, but only if `legacy_try_first` is `TRUE`
#'   (see Details). As the date does not apply to points where
#'   `legacy_try_first` is `FALSE`, it is only present in rows where
#'   `legacy_try_first` is `TRUE`.
#'
#' @field legacy_try_first Logical. `TRUE` marks the (current) legacy
#'   watersample point that should be favoured for data collection, if the field
#'   criteria for point validity still hold. In some cases, multiple different
#'   points with `TRUE` may be present, in which case field criteria must be
#'   used. If the `TRUE` point does not fulfill criteria, then (historical)
#'   points marked as `FALSE` can still be considered, making use of the field
#'   criteria. If multiple points still survive in either of these cases
#'   (`TRUE`, or `FALSE` if `TRUE` isn't successful), then additional
#'   information can be inspected to make a choice, such as `active_in_db_from`,
#'   `active_in_db_till`, `annotation` and `ranknr`.
#'
#' @field x Numeric. Easting coordinate. In this object, a point is considered
#'   as defined by its coordinates, rather than by names or IDs.
#'
#' @field y Numeric. Northing coordinate. In this object, a point is considered
#'   as defined by its coordinates, rather than by names or IDs.
#'
#' @field annotation String. Point description according to the source database
#'   (column `WATERSTAAL.puntwaterkwal`). This may be a current or an outdated
#'   polygon ID, and it sometimes contains extra information.
#'
#' @field ranknr Integer. Object ID according to the source database (column
#'   `WATERSTAAL.OBJECTID`). A higher number refers to a later addition in the
#'   source database.
#'
#' @field active_in_db_from Date. Automated date field from the source database
#'   (column `WATERSTAAL.GDB_FROM_DATE`), reflecting a date where the point
#'   started to be marked as active _in the database_. `active_in_db_from` and
#'   `active_in_db_till` do not reflect the active period in the field; for that
#'   no point-specific date information exists.
#'
#' @field active_in_db_till Date. Automated date field from the source database
#'   (column `WATERSTAAL.GDB_TO_DATE`), reflecting a date where the point
#'   stopped to be marked as active _in the database_. If the date is in year
#'   9999, then the point is a currently valid point according to the source
#'   database; this is one of the criteria that has been used to construct
#'   `legacy_try_first`. `active_in_db_from` and `active_in_db_till` do not
#'   reflect the active period in the field; for that no point-specific date
#'   information exists.
#'
#' @field geometry A simple feature geometry list-column of type POINT. The
#'   geometry column mirrors the `x` and `y` columns.
#'
#' @family REP objects of design outcome applications
#'
#' @name legacy_watersamplepoints_spslocs_lentic
NULL
