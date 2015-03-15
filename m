From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/6] inotify.7: tfix
Date: Sun, 15 Mar 2015 02:13:00 +0100
Message-ID: <1426381982-10434-4-git-send-email-saulery@free.fr>
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
 man7/inotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 1f433b6..3742bb8 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -84,7 +84,7 @@ the state of a set of filesystem objects.
 However, robust applications should allow for the fact that bugs
 in the monitoring logic or races of the kind described below
 may leave the cache inconsistent with the filesystem state.
-It is probably wise to to do some consistency checking,
+It is probably wise to do some consistency checking,
 and rebuild the cache when inconsistencies are detected.
 .SS Reading events from an inotify file descriptor
 To determine what events have occurred, an application
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
