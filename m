From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [man-pages PATCH 4/5] s390_sthyi.2: some minor additions
Date: Sun, 14 Jan 2018 19:56:39 +0100
Message-ID: <20180114185639.GA23817@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

* man2/s390_sthyi.2 (.SH DESCRIPTION): Document the size of the
resp_buffer when function_code is 0.
(.SH NOTES): Document various aspects of the current implementation (the
lifted requirement for the response buffer alignment, the usage of
hardware STHYI instruction whether available, the presence of in-kernel
cache), add description for the documentation URL.
---
 man2/s390_sthyi.2 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man2/s390_sthyi.2 b/man2/s390_sthyi.2
index 8c33041..1ab2314 100644
--- a/man2/s390_sthyi.2
+++ b/man2/s390_sthyi.2
@@ -53,6 +53,9 @@ capacity information.
 The
 .I resp_buffer
 argument specifies the address of a response buffer.
+When the
+.I function_code
+is 0, it has to be one page (4K) in size.
 If the system call returns 0,
 the response buffer will be filled with CPU capacity information.
 Otherwise, the response buffer's content is unchanged.
@@ -126,6 +129,16 @@ to call it.
 .PP
 For details of the STHYI instruction, see
 .UR https://www.ibm.com\:/support\:/knowledgecenter\:/SSB27U_6.3.0\:/com.ibm.zvm.v630.hcpb4\:/hcpb4sth.htm
+the documentation page
 .UE .
+.PP
+The in-kernel implementation of the function code 0 doesn't require the response
+buffer to be aligned to a page boundary (in contrast to the STHYI instruction
+requirement).
+.PP
+The in-kernel implementation uses STHYI function whether available.
+.PP
+The kernel caches the response (for one second, currently), so the subsequent
+calls to the system call within may return previously cached values instead.
 .SH SEE ALSO
 .BR syscall (2)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
