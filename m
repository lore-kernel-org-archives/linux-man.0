From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Definition of orphaned process group missing
Date: Sun, 20 Sep 2009 05:41:29 +0200
Message-ID: <cfd18e0f0909192041q53b71c56tb52ca2ecdd889735@mail.gmail.com>
References: <20090908092906.GG15639@lenovo.private>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090908092906.GG15639-tjyxa8jfGxeYtgw7cXKeDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Georg,

On Tue, Sep 8, 2009 at 11:29 AM,  <gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org> wrote:
> Hi,
>
> setpgid(2) and exit(3) use the term 'orphaned process group', but they
> don't define it.
>
> And if I am not missing it, the term is not defined in a referenced man
> page, either.
>
> Suggested fix: add the defintion of 'orphaned process group' to the 'right'
> place(s) (man-page).

Thanks for your report. I made the following patches for man-pages- 3.23.

Cheers,

Michael

--- a/man2/setpgid.2
+++ b/man2/setpgid.2
@@ -293,6 +293,12 @@ signal followed by a
 .B SIGCONT
 signal will be sent to each process
 in the newly orphaned process group.
+.\" exit.3 refers to the following text:
+An orphaned process group is one in which the parent of
+every member of process group is either itself also a member
+of the process group or is a member of a process group
+in a different session (see also
+.BR credentials (7)).
 .SH "SEE ALSO"
 .BR getuid (2),
 .BR setsid (2),

--- a/man3/exit.3
+++ b/man3/exit.3
@@ -159,8 +159,12 @@ signal followed by a
 .B SIGCONT
 signal will be
 sent to each process in this process group.
+See
+.BR setpgid (2)
+for an explanation of orphaned process groups.
 .SH "SEE ALSO"
 .BR _exit (2),
+.BR setpgid (2),
 .BR wait (2),
 .BR atexit (3),
 .BR on_exit (3),

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
