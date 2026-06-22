# mnedesigndata (development version)

- Document columns in `fieldwork_shortterm_prioritization_by_stratum` (this needs the 'code snippets' since at least commit `89a3ffb`):
  - New column `matching_occasion`, to mark rows (FAG occasions) that actually represent a single FAG occasion in the field but are linked to multiple strata.
  The data collection may be still be stratum-specific.
  - Existing column `wait_watersurface`: its definition was modified.

# mnedesigndata 0.2.1 (2026-05-20)

- Document new columns in  `fieldwork_shortterm_prioritization_by_stratum`:
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
