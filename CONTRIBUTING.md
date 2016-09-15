Contributing
====

Managing the roster from GitHub is not meant to make life difficult
for people who do not (yet!) have powerful Git Fu.
There are various ways to modify the roster,
suitable for all different confidence levels.
Some basic methods are described below.
More advanced methods, such as using Git from the command line,
are not required and are not described.


Main Rules
----

The key thing to keep in mind is that the raw list of names
[`./data/names.csv`](./data/names.csv) should not be modified
except for the case of employee turnover.

If you want to be excluded from the Hacky Hour roster for now,
you should have your name _added_ to
[`./data/names-mask.csv`](./data/names-mask.csv).

This will mask out your name when the roster is generated.
If your availability changes in future semesters
so you can begin coming to Hacky Hour again,
we will be able to unmask your name by deleting it from the mask file.

To help keep things orderly,
advanced Git users should please adhere to a fork-and-pull model,
even if you have write access.
If you are not the primary maintainer of the Hacky Hour roster repo,
it would also be polite if you let the primary maintainer handle most pull
requests.


The easiest method
----

If you hate Git and you hate GitHub and you want someone else
to take care of everything, that is okay.
Contact whoever is currently maintaining the roster and we will look after you.


The second easiest method
----

If you have a GitHub account but feel very unconfident with Git,
you can create an [Issue](https://github.com/resbaz/hackyhour/issues).
This is effectively the same as the previous method,
except it makes it easier for the roster maintainers to track requests over time.


Basic fork-and-pull
----

If you have a GitHub account,
it is possible to propose changes directly without raising an issue.

In the top right of the page there is a `Fork` button.
If you click it, it will make a copy of the repository into your own account.
You can edit any files you feel like in your own account,
from within your web browser, while logged into GitHub.

When you are finished editing, notice there is a button available which says
`New pull request`.
Click on that button and you will be asked to describe your edits.

After you submit the pull request, if your edits seem reasonable,
they will be merged into the main respository.
