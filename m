From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace(2): note SPARC deviation wrt get/set regs
Date: Mon, 23 Apr 2012 06:56:14 +1200
Message-ID: <CAKgNAkgntJqu4UkeusJV-oak6ksM6_Y4z3GeYTfg0JD2tQ4jww@mail.gmail.com>
References: <1256454909-22861-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1256454909-22861-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Adding some ptrace-knowledgeable people to CC]

Mike,

You long ago sent the patch below, but I didn't respond. I'm just
pulling up a few old ptrace pieces now for review.

Your patch below relates to PTRACE_GETREGS, PTRACE_GETFPREGS,
PTRACE_SETREGS, PTRACE_SETFPREGS. (The patch below no longer is
current, but is easy to fix)

Looking at arch/sparc/kernel/ptrace_32.c, I think I see what the point
of the patch is. However, the text is a bit cryptic. Would it not be
better to say something like

[[
Note that SPARC systems have the meaning of \fIdata\fP and \fIaddr\fP r=
eversed;
that is, \fIdata\fP is ignored and the registers are copied to [from]
\fIaddr\fP.
]]

Cheers,

Michael


---------- Forwarded message ----------
=46rom: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Date: Sun, Oct 25, 2009 at 8:15 PM
Subject: [PATCH] ptrace(2): note SPARC deviation wrt get/set regs
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


Unfortunately the SPARC ptrace port handles the addr/data args the oppo=
site
of every other arch. =A0It expects the struct to be in addr and the dat=
a is
ignored.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
=A0man2/ptrace.2 | =A0 =A04 ++++
=A01 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 68601df..7cce955 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -168,6 +168,8 @@ respectively, to location \fIdata\fP in the parent.
=A0See \fI<sys/user.h>\fP for information on
=A0the format of this data.
=A0(\fIaddr\fP is ignored.)
+
+Note that SPARC systems have the meaning of \fIdata\fP and \fIaddr\fP =
reversed.
=A0.TP
=A0.BR PTRACE_GETSIGINFO " (since Linux 2.3.99-pre6)"
=A0Retrieve information about the signal that caused the stop.
@@ -184,6 +186,8 @@ As for
=A0some general
=A0purpose register modifications may be disallowed.
=A0(\fIaddr\fP is ignored.)
+
+Note that SPARC systems have the meaning of \fIdata\fP and \fIaddr\fP =
reversed.
=A0.TP
=A0.BR PTRACE_SETSIGINFO " (since Linux 2.3.99-pre6)"
=A0Set signal information.
--
1.6.5.1



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
