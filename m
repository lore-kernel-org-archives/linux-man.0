From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/4] crypt.3: Added description of previously undocumented 'rounds' parameter
Date: Sun,  3 Sep 2017 19:16:36 +0300
Message-ID: <1504455396-760-5-git-send-email-konstantin@shemyak.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
---
 man3/crypt.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 375ef93..b9cf973 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -249,6 +249,21 @@ In the MD5 and SHA implementations the entire
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
+This actual number is 1000 if the supplied number is less than 1000,
+999999999 if the supplied number is greater than 999999999, and
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
