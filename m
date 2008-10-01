From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 10995] Incorrect data being reported in /proc/pid/statm
Date: Wed,  1 Oct 2008 06:43:10 -0700 (PDT)
Message-ID: <20081001134310.3C13D11D109@picon.linux-foundation.org>
References: <bug-10995-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-10995-11311-V0hAGp6uBxO456/isadD/XN4h3HLQggn@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=10995





------- Comment #2 from mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2008-10-01 06:43 -------
(In reply to comment #0)
> If this field cannot be properly populated, the proc man page should at least
> be corrected to say it's always 0.

Mark,

What version of the man page are you looking at?  Nowadays the page says:

       /proc/[pid]/statm
              Provides information about memory usage,  measured
              in pages.  The columns are:

                  size       total program size
                             (same as VmSize in /proc/[pid]/status)
                  resident   resident set size
                             (same as VmRSS in /proc/[pid]/status)
                  share      shared pages (from shared mappings)
                  text       text (code)
                  lib        library (unused in Linux 2.6)
                  data       data + stack
                  dt         dirty pages (unused in Linux 2.6)

(The page was modified in version 3.01 of man-pages.)


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
