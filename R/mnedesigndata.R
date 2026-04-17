#' @details
#' See the \href{00Index.html}{Index}
#' for documentation of datasets delivered with the package.
#' A more accessible grouping structure is presented in the
#' \href{https://inbo.github.io/mnedesigndata/reference}{online reference}.
#'
#' For contributing, see the README on
#' \href{https://github.com/inbo/mnedesigndata/blob/master/README.md}{GitHub}.
#'
#' @keywords internal
"_PACKAGE"

utils::globalVariables(c("."))

#' @importFrom utils packageVersion packageDescription
#' @importFrom curl nslookup
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Attaching mnedesigndata ",
    packageVersion("mnedesigndata"),
    "."
  )
  if (!is.null(nslookup("api.github.com", error = FALSE))) {
    tryCatch(
      {
        ref <- remotes::github_remote(
          "inbo/mnedesigndata",
          ref = remotes::github_release()
        )$ref
        release <- package_version(gsub("\\p{L}*", "", ref, perl = TRUE))
        if (packageVersion("mnedesigndata") < release) {
          packageStartupMessage(
            "\n",
            rep("=", getOption("width")),
            "\nIt is advised to upgrade mnedesigndata to its current version ",
            release,
            ". Run:\n\n",
            'detach("package:mnedesigndata", unload = TRUE)\n',
            'install.packages("mnedesigndata", repos = c(inbo = "https://inbo.r-universe.dev",
                                        CRAN = "https://cloud.r-project.org"))',
            "\n",
            "library(mnedesigndata)\n",
            rep("=", getOption("width"))
          )
        }
      },
      error = function(e) {}
    )
  }
}
