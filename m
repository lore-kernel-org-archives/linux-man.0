From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/4] crypt.3: ffix: added missing formatting
Date: Sun,  3 Sep 2017 19:16:34 +0300
Message-ID: <1504455396-760-3-git-send-email-konstantin@shemyak.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
---
 man3/crypt.3 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 749a636..1bd8509 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -233,7 +233,8 @@ based on SHA-256 and SHA-512.
 .PP
 "\fIsalt\fP" stands for the up to 16 characters
 following "$\fIid\fP$" in the salt.
-The encrypted part of the password string is the actual computed password.
+The "\fIencrypted\fP"
+part of the password string is the actual computed password.
 The size of this string is fixed:
 .TS
 l l.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
