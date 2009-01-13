From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: waitid() return value strangeness when infop is NULL
Date: Wed, 14 Jan 2009 11:38:18 +1300
Message-ID: <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Resend with right LKML address.]

Hello Roland,

Vegard sent me a report of a possible bug in the waitid(2) man page,
but on closer examination, the issue seems to be in the waitid()
system call.

POSIX.1 says of waitid():

  RETURN VALUE
      If WNOHANG was specified and there are no children to wait for,
      0 shall be returned. If waitid() returns due to the  change  of
      state  of  one of its children, 0 shall be returned. Otherwise,
      -1 shall be returned and errno set to indicate the error.

The Linux waitid() follows this behavior, as long as infop is not
NULL, which is what POSIX requires:

      The  application shall ensure that the infop argument points to
      a siginfo_t structure.

However, Linux's waitid() does permit infop to be NULL.  But in this
case, a successful call returns the PID of the waited-for child.
Thinking about it, I suppose there is a rationale for doing this,
since otherwise the caller of waitid() has no way of obtaining the PID
of the waited-for child.  Anyway, this behavior should either be
documented, or "fixed" (i.e., change waitid() to return 0 on success
even if infop is NULL).  So, some questions:

a) Is it intentional to support the infop==NULL case for waitid() --
rather than simply giving an error return?

b) If so, what is the rationale for supporting this feature?

c) If the the answer a) is "yes", is it intentional for
waitid(idtype,id,NULL,options) to return the PID of the child, rather
than returning 0?

I'll post a test program in a follow-up message.

Cheers,

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
