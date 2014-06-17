From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] man2/syscalls.2: Add prlimit64.
Date: Tue, 17 Jun 2014 10:41:55 -0400
Message-ID: <53A053B3.1000704@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

While trying to reconcile the new features in glibc with the
documented entries in the linux kernel man pages I noticed that
glibc exports prlimit64 for use by 32-bit applications (as does
the linux kernel), but that prlimit64 was not defined in the
syscalls list or in the prlimit-related page.

This is not the complete fix for this, but I don't have the time
to explain why and when prlimit64 should be used (or how it should
be used safely). Therefore I'm just patching the syscalls.2 list
to show that prlimit64 exists and was added in 2.6.36 (verified
with git by checking out the tags before and after).

Unless you've purposely excluded prlimit64 to avoid telling users
about it because it's complicated, please apply.

Patch against master.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man2/syscalls.2 b/man2/syscalls.2
index a2f0eac..75a1f59 100644
--- a/man2/syscalls.2
+++ b/man2/syscalls.2
@@ -406,6 +406,7 @@ renamed "pread64" in 2.6
 T}
 \fBpreadv\fP(2)        2.6.30
 \fBprlimit\fP(2)       2.6.36
+\fBprlimit64\fP(2)     2.6.36
 \fBprocess_vm_readv\fP(2)      3.2
 \fBprocess_vm_writev\fP(2)     3.2
 \fBpselect6\fP(2)      2.6.16
---
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
