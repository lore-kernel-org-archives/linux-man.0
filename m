From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sigaction(2): return value and errno
Date: Thu, 18 Apr 2013 11:50:00 -0700
Message-ID: <CAN8TOE84SyH8UTamQoyffv5iSknRbQK4g4GABpW7htfbx1gffg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The following text doesn't seem complete to me, in the Linux
sigaction(2) man-page (from release 3.35, 2011-09-08; but it's similar
in the most recent release):

<quote>
RETURN VALUE
       sigaction() returns 0 on success and -1 on error.

ERRORS
       EFAULT act or oldact points to memory which is not a valid part
of the process address space.

       EINVAL An invalid signal was specified.  This will also be
generated if an attempt is made to change the action for SIGKILL or
SIGSTOP, which cannot be caught or ignored.
</quote>

The RETURN VALUE section doesn't specify how the errors (EFAULT and
EINVAL) can be observed by the programmer, which seems to leave the
ERRORS section incomplete. Typically the error-checking is done with
errno (see the wording of, for example, of read(2): "On error, -1 is
returned, and errno is set appropriately.") Should the man page be
updated to include this boilerplate wording, that errno will be set
appropriately? Assuming this is the actual behavior of sigaction(), I
would recommend:

"On success, 0 is returned. On error, -1 is returned, and errno is set
appropriately."

Thanks,
Brian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
