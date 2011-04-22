From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] console_codes(4): Add ESC [ 3 J
Date: Fri, 22 Apr 2011 15:41:25 +0200
Message-ID: <1303479685-12475-1-git-send-email-ppisar@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Linux is going
(http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dco=
mmit;h=3Df8df13e0a901fe55631fed66562369b4dba40f8b)
to implement \E[3J to allow scrambling content of console including
scroll-back buffer (http://thread.gmane.org/gmane.linux.kernel/1125792)=
=2E

This is useful at terminal lock to disallow attacker to scroll visible
window back and to see sensitive data. Other \E[J sequences do not
blank history. Terminal reset (\Ec) or DECSRC are not suitable for
extension too beacuse they reset font, keyboard locks, unicode mode
etc. that are needed after unlocking session.

\E[3J is superset of \E[2J. IOW it clears visible screen too.

Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man4/console_codes.4 |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/man4/console_codes.4 b/man4/console_codes.4
index 2a806b7..62f2247 100644
--- a/man4/console_codes.4
+++ b/man4/console_codes.4
@@ -188,6 +188,8 @@ H	CUP	Move cursor to the indicated row, column (ori=
gin at 1,1).
 J	ED	Erase display (default: from cursor to end of display).
 		ESC [ 1 J: erase from start to cursor.
 		ESC [ 2 J: erase whole display.
+		ESC [ 3 J: erase whole display including scroll-back
+		buffer.
 K	EL	Erase line (default: from cursor to end of line).
 		ESC [ 1 K: erase from start of line to cursor.
 		ESC [ 2 K: erase whole line.
--=20
1.7.4.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
