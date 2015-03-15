From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH 5/6] vfork.2: tfix
Date: Sun, 15 Mar 2015 02:13:01 +0100
Message-ID: <1426381982-10434-5-git-send-email-saulery@free.fr>
References: <1426381982-10434-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426381982-10434-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man2/vfork.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/vfork.2 b/man2/vfork.2
index 0354456..0f90b2a 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -203,7 +203,7 @@ can't be implemented on such systems.
 .BR vfork ()
 from the standard; the POSIX rationale for the
 .BR posix_spawn (3)
-function notes that that function,
+function notes that function,
 which provides functionality equivalent to
 .BR fork (2)+ exec (3),
 is designed to be implementable on systems that lack an MMU.)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
