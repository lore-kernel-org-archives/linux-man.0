From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] key_setsecret.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 27 May 2015 18:12:58 +0800
Message-ID: <1432721584-11342-4-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think key_decryptsession(), key_setsecret(),
key_encryptsession(), key_gendes() and key_secretkey_is_set() are
thread-safe. But, there are not markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/key_setsecret.3 | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/man3/key_setsecret.3 b/man3/key_setsecret.3
index 426af3c..7c201ae 100644
--- a/man3/key_setsecret.3
+++ b/man3/key_setsecret.3
@@ -58,6 +58,27 @@ can be used to determine whether a key has been
 set for the effective UID of the calling process.
 .SH RETURN VALUE
 These functions return 1 on success and 0 on failure.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR key_decryptsession (),
+.br
+.BR key_encryptsession (),
+.br
+.BR key_gendes (),
+.br
+.BR key_setsecret (),
+.br
+.BR key_secretkey_is_set ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH NOTES
 Note that we talk about two types of encryption here.
 One is asymmetric using a public and secret key.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
