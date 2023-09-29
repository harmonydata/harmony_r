## R CMD check results
There were no ERRORs, WARNINGs or NOTEs.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of my package. All packages that I could install passed.

## Additional Comments
- Updated the `DESCRIPTION` file to include Ulster University as a copyright holder with the role `cph`.
- Renamed the `LICENCE` file to `LICENSE` and updated the `DESCRIPTION` file accordingly.
- Added `\value` tags to `.Rd` files to explain the output of exported functions.
- Replaced `\dontrun` with `\donttest` in examples that don't require special conditions to run.
- Omar wrote all the R code so I assigned 'cre' and 'aut' roles but Thomas made the API so I gave him the 'ctb' role.  
