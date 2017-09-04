From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/3] crypt.3: clarified that ending of the salt string with '$' is optional
Date: Mon,  4 Sep 2017 21:53:52 +0300
Message-ID: <1504551233-26383-3-git-send-email-konstantin@shemyak.com>
References: <1504551233-26383-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504551233-26383-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In crypt/sha512-crypt.c::__sha512_crypt_r() and the similar sha256 function,
the length of the actually used salt is calculated as:

  salt_len = MIN (strcspn (salt, "$"), SALT_LEN_MAX);

Thus the trailing '$' is optional in the salt string. One can check that
crypt("key", "$5$salt")
yields the same result as
crypt("key", "$5$salt$").

Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
---
 man3/crypt.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 749a636..58fd33f 100644
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
