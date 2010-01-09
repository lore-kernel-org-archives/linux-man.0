From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/9] tzset.3: Cleanup grammar/clarity
Date: Sat,  9 Jan 2010 17:45:29 -0600
Message-ID: <1263080737-2868-2-git-send-email-mfwitten@gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* A comma is added at the end of an introductory phrase.

* The preposition `to' is used to complete the idea of
  setting a variable's value.

* The conjunction `or' is introduced to separate alternative
  values for `daylight'.

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/tzset.3 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 10c6d3a..ad496f7 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -66,9 +66,9 @@ function initializes the \fItzname\fP variable from the
 environment variable.
 This function is automatically called by the
 other time conversion functions that depend on the timezone.
-In a System-V-like environment it will also set the variables \fItimezone\fP
-(seconds West of GMT) and \fIdaylight\fP (0 if this timezone does not
-have any daylight saving time rules, non-zero if there is a time during
+In a System-V-like environment, it will also set the variables \fItimezone\fP
+(to seconds West of GMT) and \fIdaylight\fP (to 0 if this timezone does not
+have any daylight saving time rules, or to non-zero if there is a time during
 the year when daylight saving time applies).
 .PP
 If the
-- 
1.6.6.102.gd6f8f

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
