# Contributing to mnedesigndata

This outlines how to propose a change to mnedesigndata.
The guidelines are partly based on the tidyteam's [code review principles](https://code-review.tidyverse.org/).

[repo]: https://github.com/inbo/mnedesigndata
[issues]: https://github.com/inbo/mnedesigndata/issues
[new_issue]: https://github.com/inbo/mnedesigndata/issues/new
[website]: https://inbo.github.io/mnedesigndata
[citation]: https://inbo.github.io/mnedesigndata/authors.html

## Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation directly using the GitHub web interface, as long as the changes are made in the _source_ file. 
This generally means you'll need to edit [roxygen2 comments](https://roxygen2.r-lib.org/articles/roxygen2.html) in an `.R`, not a `.Rd` file. 
You can find the `.R` file that generates the `.Rd` by reading the comment in the first line.

## Bigger changes

If you want to make a bigger change, it's a good idea to first file an issue and make sure someone from the team agrees that it’s needed. 
See the tidyteam guide on [how to create a great issue](https://code-review.tidyverse.org/issues/) for more advice.

## Code style

*   New code should follow the tidyverse [style guide](https://style.tidyverse.org). 
    You can use [Air](https://posit-dev.github.io/air/) to apply this style, but please don't restyle code that has nothing to do with your PR.  

*  We use [roxygen2](https://cran.r-project.org/package=roxygen2), with [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), for documentation.  

## How to contribute code? 

### _Without_ write permissions to the [code repository][repo]

We try to follow the [GitHub flow](https://guides.github.com/introduction/flow/) for development.

1. Fork [this repo][repo] and clone it to your computer. To learn more about this process, see [this guide](https://guides.github.com/activities/forking/).
2. If you have forked and cloned the project before and it has been a while since you worked on it, [pull changes from the original repo](https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/) to your clone by using `git pull upstream main`.
3. Open the RStudio project file (`.Rproj`).
5. Make your changes:
    * Write your code.
    * Test your code (bonus points for adding unit tests).
    * Document your code (see function documentation above).
    * Do an `R CMD check` using `devtools::check()` and aim for 0 errors and warnings.
5. Commit and push your changes.
6. Submit a [pull request](https://guides.github.com/activities/forking/#making-a-pull-request).

### _With_ write permissions to the [code repository][repo]

It is wise to first think about the scope of your function (or your proposed enhancement of an existing one), and talk it through with other collaborators.

**Releases, version numbering and the relation to git branches**

- We follow the semantic version numbering as described [here](https://r-pkgs.org/description.html#version).
- The commit referred to by `main` (branch tip) must always have a `<major>.<minor>.<patch>` version number in the `DESCRIPTION` file.
It is the latest released package version.
  - Subsequent commits on `main` which do not change the package code itself, but only website setup and repo documentation, must inherit the _same_ release version number.
  - **Commits which do change the package _must_ carry a development version number**; typically `<major>.<minor>.<patch>.9000`.
It follows that they never appear at the tip of the `main` branch.
Non-package commits _may_ follow this route as well: it is safe for all new commits.

  These conventions ensure that:
  - a simple package installation with `remotes::install_github()`, which defaults to downloading from the `main` branch, will result in an installation of the latest release;
  - the `pkgdown` [website] shows the version number of the latest release.
  
- Other branches than `main` can have various names.
However, there is always at least one **development branch** whose name begins with `dev`.
For example: `dev_nextrelease`, `dev_0.4.0`, ...
It is the collector of new features and bugfixes that will lead to a later release, and its first commit should be to add a dev-suffix (`.9000`) to the current version number (don't increment `<major>.<minor>.<patch>`).
  - Especially when cooperating, it is counteradvised to push directly to this branch; better do so through pull requests from feature branches.
- Eventually, the development branch's last commit before merging to `main` will be to increment at least one of `<major>`, `<minor>` or `<patch>` and to drop the dev-suffix from the version number (i.e. in the `DESCRIPTION` file).
Such final commits should happen directly on the development branch.
No later than that commmit (but it can safely be done earlier), also the `.zenodo.json` metadata file must be updated to the new release version number.


**Steps and tricks in git**

The preceding philosophy leads to following steps and guidelines:

1. Make commits (in your local clone of the remote repo on Github) _in your own git branch_, branched off from the **base** branch you wish to contribute to -- below referred as `<base>` branch.
Let's call your new branch the `<feature>` branch.
    - In general, the base branch will be a `dev*` branch, or it could be a feature branch of someone else you wish to make a contribution to.
    
    You can push your branch to the remote as often as you like, as it will not influence other branches (first time: do `git push -u origin yourbranchname`; afterwards `git push` suffices). It serves as a backup and enables others to work with you on that branch.
1. Meanwhile, make sure that your branch stays up to date with evolutions in the base branch.
This is needed to ensure a smooth merge of your branch to the base branch later on.
    - To do that in your local repo, you can run `git pull origin <base>` while having your feature branch checked out.
    - If you also wish to update your local base branch in this process, you can first `git checkout <base>` followed by `git pull`, then switch back to `git checkout <feature>` and merge the base branch with `git merge --no-ff <base>`.
    
    If any merge conflicts arise at this stage, resolve them in your own branch.
1. Propose to merge your commits into the base branch: after pushing your branch to GitHub (which you can do repeatedly), this starts with making a **pull request** (PR; actually this is a merge request) and assign at least one reviewer before a merge can be decided.
At that moment, open online discussion in the repo is possible on your changes (for other open discussion that you want to start, make an _issue_).
As long as no merge is performed, more commits can be added to this PR with `git push`, e.g. to implement requested changes by others.
    - make sure to correctly **set the base branch** in the pull request (because the default is `main`).
1. After your PR is merged, pull the base branch and clean up your local repo in order to keep up with the remote.

**Git resources**

- Info on general git workflows at INBO: <https://inbo.github.io/tutorials/tags/git/>.
See also [these git workshop materials](https://inbo.github.io/git-course/index.html).
- Günther T. (2014). Learn version control with Git: A step-by-step course for the complete beginner.
- <https://learngitbranching.js.org/>
- [Interactive Git cheatsheet](http://ndpsoftware.com/git-cheatsheet.html)

## Code of Conduct

Please note that the mnedesigndata project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this
project you agree to abide by its terms.
