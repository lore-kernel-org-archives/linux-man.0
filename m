From: Chris Mayo <aklhfex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] capabilities.7: NOTES: add last kernel versions for obsolete
 options
Date: Sun, 16 Nov 2014 17:03:38 +0000
Message-ID: <5468D8EA.9070102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


CONFIG_SECURITY_CAPABILITIES option removed by:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/security?id=5915eb53861c5776cfec33ca4fcc1fd20d66dd27

CONFIG_SECURITY_FILE_CAPABILITIES option removed in Linux 2.6.33 as already mentioned in DESCRIPTION

Signed-off-by: Chris Mayo <aklhfex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/capabilities.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index a1adcb5..bc461a4 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1124,7 +1124,7 @@ is based on the withdrawn POSIX.1e draft standard; see
 .UR http://wt.tuxomania.net\:/publications\:/posix.1e/
 .UE .
 .SH NOTES
-Since kernel 2.5.27, capabilities are an optional kernel component,
+From kernel 2.5.27 to kernel 2.6.26, capabilities are an optional kernel component,
 and can be enabled/disabled via the
 .B CONFIG_SECURITY_CAPABILITIES
 kernel configuration option.
@@ -1161,7 +1161,7 @@ It can be found at
 .UR http://www.kernel.org\:/pub\:/linux\:/libs\:/security\:/linux-privs
 .UE .
 
-Before kernel 2.6.24, and since kernel 2.6.24 if
+Before kernel 2.6.24, and from kernel 2.6.24 to kernel 2.6.32 if
 file capabilities are not enabled, a thread with the
 .B CAP_SETPCAP
 capability can manipulate the capabilities of threads other than itself.
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
