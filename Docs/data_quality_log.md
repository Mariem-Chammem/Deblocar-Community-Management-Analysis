
# Data Quality Log — Deblocar Customer Growth Analytics

## Dataset Overview
- Total records: 166
- Unique Lead IDs: 166
- Duplicate Lead IDs: 0

## Data Quality Issues
- Missing lead sources: 17
- Missing requested services: 20
- Missing statuses: 10
- Repeated phone numbers: 10 rows across 5 unique phone values.
- Repeated VINs: 4 rows across 2 unique VINs.

## Cleaning Decisions
- Standardized lead sources and statuses.
- Standardized clear service label variations.
- Preserved missing values instead of deleting records.
- Preserved repeated identifiers in the private dataset.
- Removed direct identifiers and free-text notes from the anonymized dataset.

## Limitations
- Statuses represent a snapshot, not a historical conversion funnel.
- Repeated identifiers may represent returning customers or multiple requests.
- Missing and inconsistent entries may affect analysis.
