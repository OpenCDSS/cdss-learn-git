# Learn Git / Workflow Concepts #

This lesson explains workflow concepts.

**This lesson is incomplete.**

The initial OpenCDSS Git/GitHub projects will use a "feature branch" workflow model.
In this workflow the default Git/GitHub `master` branch is the stable branch and is used to deploy releases.
Major milestones use tags.

Each bug fix or enhancement is developed by creating a branch corresponding to the issue number,
modifying files, validating the changes, and then merging the feature branch with the `master` branch using `merge --no-ff`.
This approach minimizes the degree of separation from the `master` branch in order to accommodate new Git/GitHub users.

More information will be added later about workflow concepts.
