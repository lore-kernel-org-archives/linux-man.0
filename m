From: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Subject: [patch] CPU_SET.3: clarify language about "available" cpus
Date: Thu, 4 Nov 2010 14:00:43 -0400
Message-ID: <4CD2F4CB.7020807@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The CPU_SET.3 man page uses the adjective "available" when explaining what
the argument to CPU_SET() means.  This is confusing, since "available"
isn't well-defined.  The kernel has a set of adjectives (possible, present,
online, and active) that qualify cpus, but normally none of these are what
the cpu_set_t bit index means: it's just "which cpu", using the kernel's
internal numbering system, even if that cpu isn't possible or present.

This change removes the word "available" and adds a sentence warning that
cpu sets may not be contiguous due to dynamic cpu hotplug, etc.

--- man3/CPU_SET.3.orig 2010-11-04 13:53:13.714684000 -0400
+++ man3/CPU_SET.3      2010-11-04 13:54:59.972042000 -0400
@@ -124,11 +124,14 @@
 argument is specified, it should not produce side effects,
 since the above macros may evaluate the argument more than once.
 .PP
-The first available CPU on the system corresponds to a
+The first CPU on the system corresponds to a
 .I cpu
 value of 0, the next CPU corresponds to a
 .I cpu
 value of 1, and so on.
+No assumptions should be made about particular CPUs being
+available, or the set of CPUs being contiguous, since CPUs can
+be taken offline dynamically or be otherwise absent.
 The constant
 .B CPU_SETSIZE
 (currently 1024) specifies a value one greater than the maximum CPU


-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
