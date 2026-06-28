# CRAN Submission: harmonydata 0.3.2

This is an update to the `harmonydata` package with new features, improvements, and bug fixes.

## Version 0.3.2 (2026-06-29)

### 🐛 Bug Fixes
- Fixed error when matching an instrument against itself caused by duplicate 
  row names in the matches data frame

### 🚀 New Features
- Users can now select the LLM model used for matching via the `model` 
  parameter in `match_instruments()`
- Added support for additional clustering algorithms: `kmeans`, 
  `deterministic`, and `hdbscan`

### 🔧 Improvements
- Match matrix is now returned as a data frame instead of a list
- Response options similarity matrix is now returned as a data frame
- Added check for empty response options matrix to ensure stability
- Added warning for image compression when generating heatmaps
- Added supermarket data clustering example

## R CMD check results

I have run `R CMD check` on:
- ✅ macOS (R-release)

There were:
- 🚫 0 errors
- ⚠️ 0 warnings
- ℹ️ 0 notes

## Reverse Dependency Check
- No known issues found when checking reverse dependencies.

## Notes
- All checks have passed successfully with no issues.

This update enhances the package's functionality and usability while 
maintaining full compatibility. Please let me know if any modifications 
are required for approval.

Thank you for your time and consideration.

Best,
Omar Hassoun
