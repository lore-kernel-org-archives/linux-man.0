From: saulery-GANU6spQydw@public.gmane.org
Subject: [patch] user_namespaces.7: Fix two groff warnings for escape character ignored
Date: Thu, 26 Feb 2015 09:23:41 +0100
Message-ID: <1424939021-3059-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man7/user_namespaces.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
index 4baf7aa..0e24d9a 100644
--- a/man7/user_namespaces.7
+++ b/man7/user_namespaces.7
@@ -439,12 +439,12 @@ maps to a range starting at 0 in the (nonexistent=
) parent namespace,
 and the length of the range is the largest 32-bit unsigned integer.
 (This deliberately leaves 4294967295 (the 32-bit signed \-1 value) unm=
apped.
 This is deliberate:
-.IR "(uid_t)\ -\1"
+.IR "(uid_t) -1"
 is used in several interfaces (e.g.,
 .BR setreuid (2))
 as a way to specify "no user ID".
 Leaving
-.IR "(uid_t)\ -\1"
+.IR "(uid_t) -1"
 unmapped and unusable guarantees that there will be no
 confusion when using these interfaces.
 .\"
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
