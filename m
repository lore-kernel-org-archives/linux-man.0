From: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] ptrace.2: add PTRACE_O_SUSPEND_SECCOMP flag
Date: Wed, 17 Jun 2015 11:42:13 -0600
Message-ID: <1434562933-2995-1-git-send-email-tycho@tycho.ws>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

I'm assuming (although I don't know) that this will make it into 4.2; the
"since" message may need to be updated. The commit e9e3ae0b that implements
this feature is in seccomp/tip now, though.

Signed-off-by: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
CC: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
CC: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
CC: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/ptrace.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index b7c514f..5dfec3b 100644
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
@@ -592,6 +594,13 @@ The seccomp event message data (from the
 .BR SECCOMP_RET_DATA
 portion of the seccomp filter rule) can be retrieved with
 .BR PTRACE_GETEVENTMSG .
+.TP
+.BR PTRACE_O_SUSPEND_SECCOMP " (since Linux 4.2)"
+Suspend the tracee's seccomp protections. This applies regardless of mode, and
+can be used when the tracee has not yet installed seccomp filters. That is, a
+valid usecase is to suspend a tracee's seccomp protections before they are
+installed by the tracee, let the tracee install the filters, and then clear
+this flag when the filters should be resumed.
 .RE
 .TP
 .BR PTRACE_GETEVENTMSG " (since Linux 2.5.46)"
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
