From: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Subject: [PATCH v2] man2 : syscall.2 : add notes
Date: Wed, 27 Mar 2013 17:25:57 +0900
Message-ID: <1364372757-8989-1-git-send-email-ch0.han@lge.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364361092-5948-1-git-send-email-ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gunho.lee-Hm3cg6mZ9cc@public.gmane.org, Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Add notes that caution users when passing arguments to syscall.2.

Signed-off-by: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
---
Previous v1, it had fault information, the author, signed-off email address. So, I resend the corrected patch and please ignore the previous v1 patch. Thanks.
 man2/syscall.2 |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 0675943..2c823b6 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -79,6 +79,15 @@ and an error code is stored in
 .BR syscall ()
 first appeared in
 4BSD.
+
+On some architecture arguments should be passed with an appropriate way.
+The glibc wrapper function, described in
+.BR syscalls (2),
+copies arguments to the right registers denpend on the architecture but
+.BR syscall (2)
+needs arguments following ABI, which its architecture describes, to be passed manually by a user.
+For example, on ARM architecture, a long long type of argument is considered to be 8-byte aligned and to be split into two 4-byte arguments.
+
 .SH EXAMPLE
 .nf
 #define _GNU_SOURCE
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
