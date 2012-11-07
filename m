From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Additions to mmap manpage
Date: Wed, 7 Nov 2012 12:30:04 +0100
Message-ID: <20121107113003.GA17161@rei.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
I've spend some time working on LTP mmap testcases. Here are updates for
mmap manual page that adds some missing information. Feel free to reword
the texts if needed. 

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-mmap.2-Add-EOVERFLOW-to-ERRORS.patch"

>From e656978560e317b95a8315b9556690e8c03917f2 Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Wed, 7 Nov 2012 11:52:55 +0100
Subject: [PATCH 1/2] mmap.2: Add EOVERFLOW to ERRORS.

The overflow could be triggered on 32 bit arch
with large file extension (i.e. 64 bit off_t)
if number of pages used for len plus number of
pages used for offset would overflow 32 bit
unsigned long.

In this case we would hit this line from do_mmap_pgoff:

...
	/* offset overflow? */
	if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
		return -EOVERFLOW;
...

Note that if the offset is too big (would overflow
unsigned long in number of pages itself) you would hit
EINVAL first.

The code to trigger this condition could be
seen in LTP git repo in:

open_posix_testsuite/conformance/interfaces/mmap/31-1.c

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/mmap.2 |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 042b833..29fcc3d 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -470,6 +470,11 @@ was mounted no-exec.
 was set but the object specified by
 .I fd
 is open for writing.
+.TP
+.B EOVERFLOW
+happens on 32 bit architecture together with large file extension (i.e. using
+64 bit off_t) when number of pages used for length plus number of pages used
+for offset would overflow unsigned long (32 bits)
 .LP
 Use of a mapped region can result in these signals:
 .TP
-- 
1.7.8.6


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-mmap.2-Add-note-about-partial-page-in-BUGS.patch"

>From 24dda667d02a128274133a60f8985bb061fe056c Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Wed, 7 Nov 2012 12:20:19 +0100
Subject: [PATCH 2/2] mmap.2: Add note about partial page in BUGS

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/mmap.2 |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 29fcc3d..5d2f7ee 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -573,6 +573,15 @@ Since kernel 2.6.12,
 fails with the error
 .B EINVAL
 for this case.
+
+POSIX specifies that system shall always zero fill any partial page at the end
+of the object and that system will newer write any modification of object
+beyond its end. On Linux when you write data to such partial page after the end
+of the object the data stays in page cache even after you closed and unmaped
+the file and although the data are newer written to the file itself subsequent
+mappings may see the modified content. In some cases this could be fixed by
+calling msync before the unmap takes place, this however doesn't work on tmpfs
+(for example when using shm ipc interface).
 .SH EXAMPLE
 .\" FIXME . Add an example here that uses an anonymous shared region for
 .\" IPC between parent and child.
-- 
1.7.8.6


--0OAP2g/MAC+5xKAE--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
