From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/3] crypt.3: encryption is not done with SHA-xxx, but with a function based on SHA-xxx
Date: Mon,  4 Sep 2017 21:53:51 +0300
Message-ID: <1504551233-26383-2-git-send-email-konstantin@shemyak.com>
References: <1504551233-26383-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504551233-26383-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The encryption is done by glibc functions __shaxxx_crypt_r() in files
crypt/shaxxx-crypt.c. They implement a nontrivial algorithm to construct
the inputs for the hashing functions and to apply them iteratively.

Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
---
 man3/crypt.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 9edd63a..749a636 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -227,9 +227,9 @@ _
 .TE
 .RE
 .PP
-So $5$\fIsalt\fP$\fIencrypted\fP is an SHA-256 encoded
-password and $6$\fIsalt\fP$\fIencrypted\fP is an
-SHA-512 encoded one.
+So $5$\fIsalt\fP$\fIencrypted\fP and $6$\fIsalt\fP$\fIencrypted\fP
+contain the password encrypted correspondingly with a function
+based on SHA-256 and SHA-512.
 .PP
 "\fIsalt\fP" stands for the up to 16 characters
 following "$\fIid\fP$" in the salt.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
