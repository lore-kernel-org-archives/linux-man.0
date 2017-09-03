From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/4] crypt.3: wfix: clarified that ending of the salt string with '$' is optional
Date: Sun,  3 Sep 2017 19:16:35 +0300
Message-ID: <1504455396-760-4-git-send-email-konstantin@shemyak.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
---
 man3/crypt.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 1bd8509..375ef93 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -195,15 +195,15 @@ encryption algorithms.
 If
 .I salt
 is a character string starting with the characters "$\fIid\fP$"
-followed by a string terminated by "$":
+followed by a string optionally terminated by "$",
+then the result has the form:
 .RS
 .PP
 $\fIid\fP$\fIsalt\fP$\fIencrypted\fP
 .PP
 .RE
-then instead of using the DES machine,
 .I id
-identifies the encryption method used and this then determines how the rest
+identifies the encryption method used instead of DES and this then determines how the rest
 of the password string is interpreted.
 The following values of
 .I id
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
