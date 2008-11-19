From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Current state of Network Namespaces (NETNS, CLONE_NEWNET)?
Date: Wed, 19 Nov 2008 16:49:05 -0500
Message-ID: <492489D1.5080502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrick McHardy <kaber-dcUjhNyLwpNeoWH0uzbU5w@public.gmane.org>, den-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, Daniel Lezcano <dlezcano-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sorry for the shotgun mail, but in the end,  it's
not clear who can best answer my question(s).

I'm currently trying to add documentation of all of
the undocumented CLONE_* flags.  One of these is
CLONE_NEWNET, and I could use (quite a lot of) help.  

My questions:

What is the current state of the network namespace 
implementation?  Is it complete?  

What objects are considered part of the network 
namespace, and therefore distinct for a new network 
namespace?

Is there any documentation for network namespaces 
already?

Are there any test programs for network namespaces?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
