From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] access.2: explain how access() check treats capabilities
Date: Wed, 10 Sep 2014 15:01:08 +0200
Message-ID: <1410354068-6100-1-git-send-email-dvlasenk@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

We have users who are terribly confused why their binaries
with CAP_DAC_OVERRIDE capability see EACCESS from access() calls,
but are able to read the file.

The reason is access() isn't the "can I read/write/execute this file?"
question, it is the "(assuming that I'm a setuid binary,) can *the user
who invoked me* read/write/execute this file?" question.

That's why it uses real UIDs as documented, and why it ignores
capabilities when capability-endored binaries are run by non-root
(this patch adds this information).

To make users more likely to notice this less-known detail,
the patch expands the explanation with rationale for this logic
into a separate paragraph.

Signed-off-by: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 man2/access.2 | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/man2/access.2 b/man2/access.2
index bfd85cd..73495ad 100644
--- a/man2/access.2
+++ b/man2/access.2
@@ -102,9 +102,22 @@ The check is done using the calling process's
 UID and GID, rather than the effective IDs as is done when
 actually attempting an operation (e.g.,
 .BR open (2))
-on the file.
-This allows set-user-ID programs to
-easily determine the invoking user's authority.
+on the file. Similarly, for root user, the check uses the set of
+permitted capabilities rather than the set of effective
+capabilities; and for non-root user, the check uses an empty set
+of capabilities.
+
+This allows set-user-ID programs and capability-endowed programs
+to easily determine the invoking user's authority. In other words:
+.BR access ()
+does not answer the "can I read/write/execute this file?" question.
+It answers a bit different question: "(assuming I'm a setuid binary,)
+can
+.I the user who invoked me
+read/write/execute this file?",
+with the intent to make it possible for setuid programs to not
+allow malicious users make them read files which users shouldn't be
+able to read.
 
 If the calling process is privileged (i.e., its real UID is zero),
 then an
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
