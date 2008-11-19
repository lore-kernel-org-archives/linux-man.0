From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: CLONE_NEWUTS documentation
Date: Wed, 19 Nov 2008 14:11:52 -0500
Message-ID: <492464F8.8070101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Herbert Poetzl <herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org>, Andrey Savochkin <saw-3ImXcnM4P+0@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Serge, Eric,

Below is a patch to document the CLONE_NEWUTS flag that was
added in 2.6.19.

Could you please review and let me know of improvements
or inaccuracies?

By the way, does anyone know where the UTS name in the uname()
API comes from? My best guess is that it's from Unix Timesharing
System, but I don't know this for sure.

Cheers,

Michael

diff --git a/man2/clone.2 b/man2/clone.2
index 7212332..80f9caf 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -341,6 +340,33 @@ configuration option and that the process be privileged
 This flag can't be specified in conjunction with
 .BR CLONE_THREAD .
 .TP
+.BR CLONE_NEWUTS " (since Linux 2.6.19)"
+If
+.B CLONE_NEWUTS
+is set, then create the process in a new UTS namespace.
+If this flag is not set, then (as with
+.BR fork (2)),
+the process is created in the same UTS namespace as
+the calling process.
+This flag is intended for the implementation of control groups.
+
+A UTS namespace is the set of identifiers returned by
+.BR uname (2);
+among these, the domain name and the host name can be modified by
+.BR setdomainname (2)
+and
+.BR
+.BR sethostname (2),
+respectively.
+Changes made to these identifiers in one UTS namespace
+are visible to other processes in the same namespace,
+but are not visible to processes in other UTS namespaces.
+
+Use of this flag requires: a kernel configured with the
+.B CONFIG_UTS_NS
+configuration option and that the process be privileged
+.RB ( CAP_SYS_ADMIN ).
+.TP
 .BR CLONE_PARENT " (since Linux 2.3.12)"
 If
 .B CLONE_PARENT
@@ -723,15 +749,24 @@ but the kernel was not configured with the
 .B CONFIG_PID_NS
 option.
 .TP
+.B EINVAL
+.BR CLONE_NEWUTS
+was specified in
+.IR flags ,
+but the kernel was not configured with the
+.B CONFIG_UTS
+option.
+.TP
 .B ENOMEM
 Cannot allocate sufficient memory to allocate a task structure for the
 child, or to copy those parts of the caller's context that need to be
 copied.
 .TP
 .B EPERM
-.B CLONE_NEWNS
+.BR CLONE_NEWNS ,
+.BR CLONE_NEWPID ,
 or
-.B CLONE_NEWPID
+.BR CLONE_NEWUTS
 was specified by a non-root process (process without \fBCAP_SYS_ADMIN\fP).
 .TP
 .B EPERM


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
