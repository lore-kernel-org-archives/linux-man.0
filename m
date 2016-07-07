From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 121211] Please provide conventions for documenting subcommands
 in man-pages(7)
Date: Thu, 07 Jul 2016 11:23:33 +0000
Message-ID: <bug-121211-11311-XwZo55yB6w@https.bugzilla.kernel.org/>
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

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Josh

> Many programs now provide subcommands, such as git, systemctl, git-remote,
> git-hub, and apt.  These programs follow various different inconsistent
> conventions for documenting these subcommands in their manpages.  I'm about
> to write such a program with subcommands myself.  I'd love to see some
> standard conventions documented in man-pages(7).

I generally would love to see more consistency in man pages across all projects
of course. The thing is, man-pages(7) was primarily driven from the desire to
document best practice for the Linux man-pages project, which produces only a
handful of (relatively short) man pages in Sections 1 and 8. As such, I'm
cautious about making too many prescriptions there about pages in Sections 1
and 8. I have made a few changes though in man-pages(7) just now (see Git).

> Note that some programs will want to document all their subcommands in
> separate manpages, and others will want a single all-encompassing manpage. 
> I don't think man-pages(7) should mandate one or the other approach there,
> just establish standards that work either way.
> 
> In particular:
> 
> - Should the SYNOPSIS section document the usage of every subcommand (see
> git-remote for an example), or use a placeholders for subcommands and their
> options (see systemctl, git, or git-hub for examples)?

It seems either approach works. Not sure that anything needs to be said in
man-pages about this?

> - If the SYNOPSIS just uses placeholders, what placeholder should it use for
> subcommands?  "<command>" or "<subcommand>" or "<cmd>" or "<subcmd>"?  (Or
> similar with square brackets if optional.)

Are you meaning whether to abbreviate the word "command"? I don't think it's
necessary to specify things to that level.

> - What section should subcommands appear in?  I've seen both "COMMANDS" and
> "SUBCOMMANDS".

Not sure. Do you have a recommendation and a justification?

> - Within that section, what formatting should subcommands use for their
> name, usage, description, and options?

I've added a little more detail on this in the man page.

> - If programs don't ship separate manual pages for each subcommand, should
> they ship symlinks for each subcommand to the main manpage?

I'm not sure what to recommend here. Can you give an example or two?

> - How does this work with programs that have multiple levels of subcommand? 
> (For instance, consider git-remote, which itself has subcommands.  Or
> consider a third-party git extension, like git-hub, which itself has
> subcommands.)

I'm not sure I even want to get into that level of detail. (There's much worse
issues affecting many existing man pages, including general inconsistencies in
single pages, spelling, and grammar.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
