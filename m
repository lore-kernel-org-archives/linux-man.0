From: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: add PTRACE_O_SUSPEND_SECCOMP flag
Date: Thu, 18 Jun 2015 15:31:22 -0600
Message-ID: <20150618213122.GC11501@hopstrocity>
References: <1434562933-2995-1-git-send-email-tycho@tycho.ws>
 <CAGXu5j+OucgCTOOwd80sHHqjqcAAF6+NR+dVovN8OtpwNmicDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5j+OucgCTOOwd80sHHqjqcAAF6+NR+dVovN8OtpwNmicDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2015 at 12:27:48PM -0700, Kees Cook wrote:
>
> This should probably also mention the CAP_SYS_ADMIN requirement.
> Otherwise, it looks good!

Good point, attached is an updated patch.

Tycho

--KsGdsel6WgEHnImy
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ptrace.2-add-PTRACE_O_SUSPEND_SECCOMP-flag.patch"

>From ab790f8441c4d6f5691078b5b124b0f14c7a69df Mon Sep 17 00:00:00 2001
From: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Date: Wed, 17 Jun 2015 11:17:32 -0600
Subject: [PATCH] ptrace.2: add PTRACE_O_SUSPEND_SECCOMP flag

I'm assuming (although I don't know) that this will make it into 4.2; the
"since" message may need to be updated. The commit e9e3ae0b that implements
this feature is in seccomp/tip now, though.

v2: add note about security checks

Signed-off-by: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
CC: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
CC: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
CC: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/ptrace.2 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index b7c514f..2bd40c6 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -42,6 +42,8 @@
 .\" 2011-09, major update by Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
 .\" 2015-01, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 .\"    Added PTRACE_O_TRACESECCOMP, PTRACE_EVENT_SECCOMP
+.\" 2015-06, Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
+.\"    Added PTRACE_O_SUSPEND_SECCOMP
 .\"
 .TH PTRACE 2 2015-02-21 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -592,6 +594,18 @@ The seccomp event message data (from the
 .BR SECCOMP_RET_DATA
 portion of the seccomp filter rule) can be retrieved with
 .BR PTRACE_GETEVENTMSG .
+.TP
+.BR PTRACE_O_SUSPEND_SECCOMP " (since Linux 4.2)"
+Suspend the tracee's seccomp protections. This applies regardless of mode, and
+can be used when the tracee has not yet installed seccomp filters. That is, a
+valid usecase is to suspend a tracee's seccomp protections before they are
+installed by the tracee, let the tracee install the filters, and then clear
+this flag when the filters should be resumed. Setting this option requires that
+the tracer have
+.BR CAP_SYS_ADMIN ,
+not have any seccomp protections installed, and not have
+.BR PTRACE_O_SUSPEND_SECCOMP
+set on itself.
 .RE
 .TP
 .BR PTRACE_GETEVENTMSG " (since Linux 2.5.46)"
-- 
2.1.4


--KsGdsel6WgEHnImy--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
