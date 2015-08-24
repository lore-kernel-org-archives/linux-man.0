From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fgetgrent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 24 Aug 2015 18:19:51 +0800
Message-ID: <1440411596-2566-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
marking of function in glibc is:
- fgetgrent: MT-Unsafe race:fgrent

ps: We think race:fgrent in glibc maybe hard for users to understand,
and have sent a patch to the GNU libc community for changing it to
race:fgetgrent, however, something about the copyright impeded the progress.
Here we mark it "race:fgetgrent", so there is a little different.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fgetgrent.3 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/man3/fgetgrent.3 b/man3/fgetgrent.3
index 57665dd..aa08e0f 100644
--- a/man3/fgetgrent.3
+++ b/man3/fgetgrent.3
@@ -90,6 +90,25 @@ is set to indicate the cause.
 Insufficient memory to allocate
 .I group
 structure.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fgetgrent ()
+.\" FIXME: the following marking is different from which in glibc manual,
+.\" marking in glibc manual is,
+.\" fgetgrent: MT-Unsafe race:fgrent
+.\" We think race:fgrent in glibc maybe hard for users to understand,
+.\" and have sent a patch to the GNU libc community for changing it to
+.\" race:fgetgrent, however, something about the copyright impeded the progress.
+T}	Thread safety	MT-Unsafe race:fgetgrent
+.TE
+
 .SH CONFORMING TO
 SVr4.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
