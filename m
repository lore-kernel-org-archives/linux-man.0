From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] clock.3: CLOCKS_PER_SEC = 1000000 is required by XSI, not POSIX
Date: Sat,  7 Mar 2015 16:15:30 +0100
Message-ID: <1425741330-24586-2-git-send-email-saulery@free.fr>
References: <CANjopZEYmC6kdGR6AN2cxEFXSqabmA0jQkjzSouZOSXwxVHDRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANjopZEYmC6kdGR6AN2cxEFXSqabmA0jQkjzSouZOSXwxVHDRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: 728213-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Debian Bug #728213 reported by Tanaka Akira <akr-Z4CJNWi2dO8@public.gmane.org>

See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D728213

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man3/clock.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/clock.3 b/man3/clock.3
index 5787367..3d99b14 100644
--- a/man3/clock.3
+++ b/man3/clock.3
@@ -49,7 +49,7 @@ be represented, the function returns the value
 .IR (clock_t)\ \-1 .
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001.
-POSIX requires that
+XSI requires that
 .B CLOCKS_PER_SEC
 equals 1000000 independent
 of the actual resolution.
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
