From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 121211] New: Please provide conventions for documenting
 subcommands in man-pages(7)
Date: Thu, 30 Jun 2016 09:34:51 +0000
Message-ID: <bug-121211-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=121211

            Bug ID: 121211
           Summary: Please provide conventions for documenting subcommands
                    in man-pages(7)
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: josh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
        Regression: No

Many programs now provide subcommands, such as git, systemctl, git-remote,
git-hub, and apt.  These programs follow various different inconsistent
conventions for documenting these subcommands in their manpages.  I'm about to
write such a program with subcommands myself.  I'd love to see some standard
conventions documented in man-pages(7).

Note that some programs will want to document all their subcommands in separate
manpages, and others will want a single all-encompassing manpage.  I don't
think man-pages(7) should mandate one or the other approach there, just
establish standards that work either way.

In particular:

- Should the SYNOPSIS section document the usage of every subcommand (see
git-remote for an example), or use a placeholders for subcommands and their
options (see systemctl, git, or git-hub for examples)?

- If the SYNOPSIS just uses placeholders, what placeholder should it use for
subcommands?  "<command>" or "<subcommand>" or "<cmd>" or "<subcmd>"?  (Or
similar with square brackets if optional.)

- What section should subcommands appear in?  I've seen both "COMMANDS" and
"SUBCOMMANDS".

- Within that section, what formatting should subcommands use for their name,
usage, description, and options?

- If programs don't ship separate manual pages for each subcommand, should they
ship symlinks for each subcommand to the main manpage?

- How does this work with programs that have multiple levels of subcommand? 
(For instance, consider git-remote, which itself has subcommands.  Or consider
a third-party git extension, like git-hub, which itself has subcommands.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
