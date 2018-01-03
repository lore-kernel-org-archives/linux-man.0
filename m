From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] copy_file_ranges can file with EFBIG
Date: Wed, 3 Jan 2018 14:02:25 +0100
Message-ID: <026501d5-2def-769f-ae52-36d7d60e533c@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------C3F4E730BF6D29C793F3488C"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------C3F4E730BF6D29C793F3488C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


--------------C3F4E730BF6D29C793F3488C
Content-Type: text/x-patch;
 name="0001-copy_file_range.2-EFBIG-errors-are-possible-similar-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-copy_file_range.2-EFBIG-errors-are-possible-similar-.pa";
 filename*1="tch"

>From f668acc7396854f2d4c264c92ea233f37b2bbbfb Mon Sep 17 00:00:00 2001
From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Wed, 3 Jan 2018 14:00:35 +0100
Subject: [PATCH] copy_file_range.2: EFBIG errors are possible, similar to
 write(2)

Signed-off-by: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/copy_file_range.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/copy_file_range.2 b/man2/copy_file_range.2
index 6e50ea6ec..31c31cd81 100644
--- a/man2/copy_file_range.2
+++ b/man2/copy_file_range.2
@@ -108,6 +108,11 @@ Requested range extends beyond the end of the source file; or the
 .I flags
 argument is not 0.
 .TP
+.B EFBIG
+An attempt was made to write a file that exceeds the implementation-defined
+maximum file size or the process's file size limit,
+or to write at a position past the maximum allowed offset.
+.TP
 .B EIO
 A low-level I/O error occurred while copying.
 .TP
-- 
2.13.6


--------------C3F4E730BF6D29C793F3488C--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
