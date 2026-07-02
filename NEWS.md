# mnedesigndata (development version)

- Extend the 'Details' section of `fieldwork_shortterm_prioritization_by_stratum` with regard to occasions from old REP versions and occasions that go beyond the short-term window.
- Document columns in `fieldwork_shortterm_prioritization_by_stratum` (this needs the 'code snippets' since at least commit `60e19da`):
  - New column `matching_occasion`, to mark rows (FAG occasions) that actually represent a single FAG occasion in the field but are linked to multiple strata.
  The data collection may be still be stratum-specific.
  - Existing column `wait_watersurface`: its definition was modified.
  - Column names `scheme_ps_targetpanels_served` and `scheme_ps_oldtargetpanels_served` replace previous names `scheme_ps_targetpanels` and `scheme_ps_oldtargetpanels`.
  These names are better related to the similar column name `schemes_served_all`; all of them refer to schemes that are 'served' by a FAG occasion.
  The renaming avoids confusion with the `scheme_ps_targetpanels` column in object `stratum_schemepstargetpanel_spsamples`, where it is a direct attribute of spatial sampling units.

# mnedesigndata 0.2.1 (2026-05-20)

- Document new columns in `fieldwork_shortterm_prioritization_by_stratum`:
  - `scheme_ps_oldtargetpanels` (plural), which replaces `scheme_ps_oldtargetpanel`
  - `wait_obsolete_types`
- Document on appended rows from old versions in `fag_stratum_grts_calendar`.

# mnedesigndata 0.2.0 (2026-04-17)

- Document various REP objects (#5).

# mnedesigndata 0.1.2 (2026-04-04)

- Add three new columns for `fieldwork_shortterm_prioritization_by_stratum`.
- Follow updated column order of `fieldwork_shortterm_prioritization_by_stratum`.

# mnedesigndata 0.1.1 (2026-03-30)

- Add description of column `wait_mhq` for `fieldwork_shortterm_prioritization_by_stratum`.
- Improve descriptions of two first columns of `fieldwork_shortterm_prioritization_by_stratum`.

# mnedesigndata 0.1.0 (2026-03-20)

- Initial setup, based on `{n2khabmon}` and using a more standard contributing guide.
- Included documentation of a single object.
