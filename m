From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] crypt(3): use real dashes in regex
Date: Thu, 17 Apr 2014 13:48:38 -0400
Message-ID: <1397756918-16350-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I don't think rendering the dashes in the regex expression as the en
style makes sense.  This is a literal regex, so use literal dashes.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/crypt.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 9baa80a..453bcec 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -65,7 +65,7 @@ is a user's typed password.
 .PP
 .I salt
 is a two-character string chosen from the set
-[\fBa\fP\(en\fBzA\fP\(en\fBZ0\fP\(en\fB9./\fP].
+[\fBa\-zA\-Z0\-9./\fP].
 This string is used to
 perturb the algorithm in one of 4096 different ways.
 .PP
@@ -241,7 +241,7 @@ SHA-512 | 86 characters
 .TE
 
 The characters in "\fIsalt\fP" and "\fIencrypted\fP" are drawn from the set
-[\fBa\fP\(en\fBzA\fP\(en\fBZ0\fP\(en\fB9./\fP].
+[\fBa-zA-Z0-9./\fP].
 In the MD5 and SHA implementations the entire
 .I key
 is significant (instead of only the first
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
