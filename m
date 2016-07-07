From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 121211] Please provide conventions for documenting subcommands
 in man-pages(7)
Date: Thu, 07 Jul 2016 17:53:01 +0000
Message-ID: <bug-121211-11311-6z9bSry8l2@https.bugzilla.kernel.org/>
References: <bug-121211-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-121211-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=121211

--- Comment #2 from Josh Triplett <josh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #1)
> Hi Josh
> 
> > Many programs now provide subcommands, such as git, systemctl, git-remote,
> > git-hub, and apt.  These programs follow various different inconsistent
> > conventions for documenting these subcommands in their manpages.  I'm about
> > to write such a program with subcommands myself.  I'd love to see some
> > standard conventions documented in man-pages(7).
> 
> I generally would love to see more consistency in man pages across all
> projects of course. The thing is, man-pages(7) was primarily driven from the
> desire to document best practice for the Linux man-pages project, which
> produces only a handful of (relatively short) man pages in Sections 1 and 8.
> As such, I'm cautious about making too many prescriptions there about pages
> in Sections 1 and 8.

The man-pages project, though, seems like the one project with the greatest
claim to provide style guidelines for consistency.  Some of these have less to
do with one stylistic choice looking *better*, and more about maintaining
consistency between pages.

> I have made a few changes though in man-pages(7) just
> now (see Git).

Those look helpful, thanks.

One bug report for those changes: the first of the two new subheadings should
say "Formatting conventions for manual pages describing commands", rather than
"... functions" (duplicating the second heading).

> > Note that some programs will want to document all their subcommands in
> > separate manpages, and others will want a single all-encompassing manpage. 
> > I don't think man-pages(7) should mandate one or the other approach there,
> > just establish standards that work either way.
> > 
> > In particular:
> > 
> > - Should the SYNOPSIS section document the usage of every subcommand (see
> > git-remote for an example), or use a placeholders for subcommands and their
> > options (see systemctl, git, or git-hub for examples)?
> 
> It seems either approach works. Not sure that anything needs to be said in
> man-pages about this?

Consistency between pages helps.

Personally, I'd suggest using a placeholder for the subcommand, for the same
reason that the majority of manpages just say [OPTION]... rather than listing
every possible option in the synopsis.

> > - If the SYNOPSIS just uses placeholders, what placeholder should it use for
> > subcommands?  "<command>" or "<subcommand>" or "<cmd>" or "<subcmd>"?  (Or
> > similar with square brackets if optional.)
> 
> Are you meaning whether to abbreviate the word "command"? I don't think it's
> necessary to specify things to that level.

No, I was mostly asking about whether the thing in question should be called a
"command" or a "subcommand", as with the question below about headings. 
man-pages makes several specific recommendations about terminology for
consistency; this seems like a useful distinction to make there.

> > - What section should subcommands appear in?  I've seen both "COMMANDS" and
> > "SUBCOMMANDS".
> 
> Not sure. Do you have a recommendation and a justification?

I would recommend "SUBCOMMANDS", because we typically use "commands" to refer
to the top-level programs like "cp", "ls", and "git".  Let's avoid the
ambiguity.

> > - Within that section, what formatting should subcommands use for their
> > name, usage, description, and options?
> 
> I've added a little more detail on this in the man page.

I saw the details regarding the use of boldface and italics.  I was more
wondering about paragraphs and indentation.  I'd thought of using the
following, though the need for .RS/.RE bugs me:

.SH SUBCOMMANDS
.TP
\fBcommand subcommand1\fR
Description of subcommand1.
.IP
More description of subcommand1.
.TP
\fBcommand subcommand2\fR [\fB-f\fR|\fB--flag\fR] \fIarg\fR
Description of subcommand2.
.IP
More description of subcommand2.
.RS
.TP
\fIarg\fR
Description of \fIarg\fR.
.TP
.BR -f | --flag
Description of \fB--flag\fR.
.RE

Does that look reasonable, or do you have another idea for how subcommands with
flags and arguments should format their descriptions?  Either way, this seems
like something worth providing guidance on, just as man-pages(7) currently
provides guidance suggesting the use of .TP in several places.

I can provide a patch for this.

> > - If programs don't ship separate manual pages for each subcommand, should
> > they ship symlinks for each subcommand to the main manpage?
> 
> I'm not sure what to recommend here. Can you give an example or two?

git(1) mentions its subcommands, but has separate manpages for git-diff(1),
git-commit(1), and so on, so "man git diff" works.  If git instead documented
all of its subcommands inline, should it ship a symlink git-diff.1.gz ->
git.1.gz?  (Or a manpage containing just a .so line?)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
