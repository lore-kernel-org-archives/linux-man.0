From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] syscall(2): add endian details with 64-bit splitting
Date: Fri, 10 Mar 2017 19:16:00 -0800
Message-ID: <20170311031600.717-1-vapier@gentoo.org>
References: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, wharms-fPG8STNUNVg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Architectures that split 64-bit values across registers pairs usually do
so according to their C ABI calling convention (which means endianness).
Add some notes to that effect, and change the readahead example to show
a little endian example (since that is way more common than big endian).

Also start a new list of syscalls that this issue does not apply to.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/syscall.2 | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index fcb0a7e21248..80f83fd1aaac 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -102,13 +102,14 @@ Thus, using
 instead of the wrapper provided by glibc,
 the
 .BR readahead ()
-system call would be invoked as follows on the ARM architecture with the EABI:
+system call would be invoked as follows on the ARM architecture with the EABI
+in little endian mode:
 
 .in +4n
 .nf
 syscall(SYS_readahead, fd, 0,
-        (unsigned int) (offset >> 32),
         (unsigned int) (offset & 0xFFFFFFFF),
+        (unsigned int) (offset >> 32),
         count);
 .fi
 .in
@@ -124,6 +125,8 @@ register pair.
 That means inserting a dummy value into
 .I r1
 (the second argument of 0).
+Care also must be taken so that the split follows endian conventions
+(according to the C ABI for the platform).
 
 Similar issues can occur on MIPS with the O32 ABI,
 on PowerPC with the 32-bit ABI, and on Xtensa.
@@ -140,6 +143,11 @@ The affected system calls are
 .BR sync_file_range (2),
 and
 .BR truncate64 (2).
+
+This does not affect syscalls that manually split and assemble 64-bit values
+such as
+.BR _llseek (2).
+Welcome to the wonderful world of historical baggage.
 .SS Architecture calling conventions
 Every architecture has its own way of invoking and passing arguments to the
 kernel.
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
