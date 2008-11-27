From: Nadia.Derbey-6ktuUTfB/bM@public.gmane.org
Subject: signal handling description for Michaels CLONE_NEWPID man page
Date: Thu, 27 Nov 2008 08:07:21 +0100
Message-ID: <20081127070806.626288939@bull.net>
References: <20081127070720.954560982@bull.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=pidns_signals.patch
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadia.Derbey-6ktuUTfB/bM@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

Here is the proposal for a description of signals handling in pid
namespaces.

This applies on top of your CLONE_NEWPID patch.

Regards,
Nadia

---
 man2/clone.2 |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

Index: man-pages-3.13/man2/clone.2
===================================================================
--- man-pages-3.13.orig/man2/clone.2	2008-11-24 09:34:30.000000000 +0100
+++ man-pages-3.13/man2/clone.2	2008-11-27 09:17:53.000000000 +0100
@@ -226,6 +226,29 @@ configuration option and requires that t
 .RB (CAP_SYS_ADMIN ).
 This flag can't be specified in conjunction with
 .BR CLONE_THREAD .
+
+.BR "Signals handling:"
+just like all the system calls that address a PID, signals can only be sent
+to a process whose PID belongs to the same namespace as the caller.
+
+There are ways signals can be sent across namespaces boundaries such that
+the sender does not have a valid pid in the receiver's pid namespace.
+In such cases, the sender pid will be seen by the receiver as a 0 value
+(this has an impact, for example, on the
+.BR siginfo_t
+structure contents - NOTE, this is still under development).
+
+The "init" process of a PID namespace has a particular status, since it
+is known both by its children as PID 1 and by its father's PID namespace
+as any other PID. Thus, the "init" process of a PID namespace can be sent
+any signal by a process that belongs to its ancestor's PID namespace (given
+that the sender has the appropriate permission). But the only signals that
+can be sent to the "init" process of a PID namespace from its own namespace
+are those for which it has explicitly installed signal handlers.
+More precisely, signals are sent successfully (i.e
+.BR kill (2)
+will not fail), but the "init" process will silently ignore unhandled signals.
+
 .TP
 .BR CLONE_PARENT " (since Linux 2.3.12)"
 If

-- 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
