From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [man-pages PATCH 3/5] s390_sthyi.2: wfix
Date: Sun, 14 Jan 2018 19:56:34 +0100
Message-ID: <20180114185634.GA23726@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/s390_sthyi.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/s390_sthyi.2 b/man2/s390_sthyi.2
index 21a0de6..8c33041 100644
--- a/man2/s390_sthyi.2
+++ b/man2/s390_sthyi.2
@@ -51,7 +51,7 @@ Return CP (Central Processor) and IFL (Integrated Facility for Linux)
 capacity information.
 .PP
 The
-.I resp_buffer 
+.I resp_buffer
 argument specifies the address of a response buffer.
 If the system call returns 0,
 the response buffer will be filled with CPU capacity information.
@@ -98,7 +98,7 @@ is set appropriately.
 .TP
 .B EFAULT
 The value specified in
-.I resp_buffer 
+.I resp_buffer
 or
 .I return_code
 is not a valid address.
@@ -113,7 +113,7 @@ Allocating memory for handling the CPU capacity information failed.
 .TP
 .B EOPNOTSUPP
 The value specified in
-.I function_code 
+.I function_code
 is not valid.
 .SH VERSIONS
 This system call is available since Linux 4.15.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
