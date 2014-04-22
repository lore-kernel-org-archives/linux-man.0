From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] open.2: Update note about the alignment of the user buffer
 and the file offset for O_DIRECT flag
Date: Tue, 22 Apr 2014 19:21:19 +0200
Message-ID: <5356A50F.4010602@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030004000901040901050206"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, esandeen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------030004000901040901050206
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Michael,

the sentence in open(2) man page in notes for O_DIRECT flag:
"Under Linux 2.6, alignment to 512-byte boundaries suffices."

is not universally correct. The alignment is a property of the storage, 
for example, 4k-sector drives with no 512 byte sector emulation will be 
unable to perform 512-byte direct I/O.

The patch clarifies this sentence.

Thanks,

peter

--------------030004000901040901050206
Content-Type: text/x-patch;
 name="open.2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="open.2.patch"

diff --git a/man2/open.2 b/man2/open.2
index 389945f..c80686d 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1322,7 +1322,16 @@ operation in
 Under Linux 2.4, transfer sizes, and the alignment of the user buffer
 and the file offset must all be multiples of the logical block size
 of the filesystem.
-Under Linux 2.6, alignment to 512-byte boundaries suffices.
+Under Linux 2.6 and newer, alignment to the logical block size of the
+underlying storage (typically 512 bytes) suffices.
+Logical block size can be determined with
+.BR ioctl (2)
+.B BLKSSZGET
+system call or
+.BR blockdev (8)
+command with
+.B --getss
+parameter.
 .LP
 .B O_DIRECT
 I/Os should never be run concurrently with the

--------------030004000901040901050206--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
