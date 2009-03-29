From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Mon, 30 Mar 2009 11:00:23 +1300
Message-ID: <cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc@mail.gmail.com>
References: <200903172346.32372.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200903172346.32372.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

(Roland may be able to help out here.)

On Wed, Mar 18, 2009 at 4:46 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> the ptrace(2) page doesnt say anything about the data field (ignored =
or
> otherwise). =A0it seems to be ignored, but i didnt trace the kernel
> exhaustively. =A0the examples found via google shows that it's ignore=
d. =A0strace
> usage seems odd (it passes in an irrelevant pointer), which would ind=
icate
> it's ignored as well ...

It's true that this looks like a defect in the man page.  But I'm not
sure what the fix is.

In the kernel source file kernel/ptrace.c, function ptrace_resume() we
have the line

            child->exit_code =3D data;

which seems to be executed by the PRACE_SYSCALL code path.  That
implies that data is treated as a signal number (like PTRACE_CONT).

That seems consistent with the following in the strace.c source file
of strace(1):


                         if (ptrace(PTRACE_SYSCALL, pid, (char *) 1,
                                   WSTOPSIG(status)) < 0) {
                                perror("trace: ptrace(PTRACE_SYSCALL, .=
=2E.)");
                                cleanup();
                                return -1;
                        }

Did I misunderstand something?  Your thoughts?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
