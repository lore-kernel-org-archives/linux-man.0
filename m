From: saulery-GANU6spQydw@public.gmane.org
Subject: filesystems.5: srcfix
Date: Tue,  3 Mar 2015 22:21:12 +0100
Message-ID: <1425417676-13816-2-git-send-email-saulery@free.fr>
References: <1425417676-13816-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425417676-13816-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Remove useless quotes

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/filesystems.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 19e16a0..17b2fce 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -111,7 +111,7 @@ filesystem support under Linux.
 is a journaling filesystem, developed by IBM,
 that was integrated into Linux in kernel 2.4.24.
 .TP
-.B "minix"
+.B minix
 is the filesystem used in the Minix operating system, the first to run
 under Linux.
 It has a number of shortcomings, including a 64MB partition size
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
