From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man3/crypt.3: Correct note on key portion significance
Date: Tue, 11 May 2010 03:35:50 +0200
Message-ID: <20100511013550.GD16800@machine.or.cz>
References: <20100418171718.GB25938@zuul.luon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100418171718.GB25938-9b3RgGIKRfocWVvVuXF20w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Moreaux <marcelm-MO7g/Hy4xaE@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As Marcel Moreaux notes:

> The Linux manpage for crypt()[1] contains the following statement as the
> last sentence of the NOTES section:
> 
>     In the SHA implementation the entire key is significant (instead of
>     only the first 8 bytes in MD5).
> 
> It should probably say "DES" where it says "MD5" (and maybe "MD5/SHA"
> where it says "SHA"), because in MD5 password hashing, the entire key is
> significant, not just the first 8 bytes.

This patch fixes the wording.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

---

diff --git a/man3/crypt.3 b/man3/crypt.3
index 1139792..aeaf873 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -217,10 +217,10 @@ SHA-512 | 86 characters
 
 The characters in "\fIsalt\fP" and "\fIencrypted\fP" are drawn from the set
 [\fBa\fP\(en\fBzA\fP\(en\fBZ0\fP\(en\fB9./\fP].
-In the SHA implementation the entire
+In the MD5 and SHA implementations the entire
 .I key
 is significant (instead of only the first
-8 bytes in MD5).
+8 bytes in DES).
 .SH "SEE ALSO"
 .BR login (1),
 .BR passwd (1),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
