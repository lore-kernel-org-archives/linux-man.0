From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/3] crypt.3: added description of previously undocumented 'rounds' parameter
Date: Mon,  4 Sep 2017 21:53:53 +0300
Message-ID: <1504551233-26383-4-git-send-email-konstantin@shemyak.com>
References: <1504551233-26383-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504551233-26383-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Files crypt/sha{256,512}-crypt.c in the glibc source define macros:

/* Default number of rounds if not explicitly specified.  */
#define ROUNDS_DEFAULT 5000
/* Minimum number of rounds.  */
#define ROUNDS_MIN 1000
/* Maximum number of rounds.  */
#define ROUNDS_MAX 999999999

And the main encryption function __sha512_crypt_r() sets:

rounds = MAX (ROUNDS_MIN, MIN (srounds, ROUNDS_MAX));

One can check that for example

crypt("key", "$5$rounds=1$salt")

returns string

$5$rounds=1000$salt$PWLKU7MTJ0s5M/mjBPcqnMsorm3qKyoBctxmZ1mNwn2

This parameter has been introduced in glibc 2.7.

Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
---
 man3/crypt.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 58fd33f..bfdac22 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -248,6 +248,21 @@ In the MD5 and SHA implementations the entire
 .I key
 is significant (instead of only the first
 8 bytes in DES).
+.PP
+SHA-256 and SHA-512 implementations support user-supplied number of
+hashing rounds, defaulting to 5000.
+If the "$\fIid\fP$" characters in the salt are
+followed by "rounds=\fIxxx\fP$" and \fIxxx\fP is an integer, then the
+result has the form
+.RS
+.PP
+$\fIid\fP$\fIrounds=yyy\fP$\fIsalt\fP$\fIencrypted\fP
+.PP
+.RE
+where \fIyyy\fP is the actual number of hashing rounds used.
+The number actually used is 1000 if the supplied number is less than
+1000, 999999999 if the supplied number is greater than 999999999, and
+equal to the supplied number otherwise.
 .SH SEE ALSO
 .BR login (1),
 .BR passwd (1),
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
