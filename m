From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typo in fallocate.2
Date: Wed, 21 Sep 2011 23:57:20 +0200
Message-ID: <CAMqf4EHSHE8T+Rygzm89DCUnbooDgqrzWy-JHunjp3BP8z3xJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here is a trivial typo fix in man2/fallocate.2

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 45b8a21..6b37139 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -128,7 +128,7 @@ is not supported by the file system containing the
file referred to by
 .TP
 .B EPERM
 The file referred to by
-.fd
+.I fd
 is marked immutable (see
 .BR chattr (1).
 .TP

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
