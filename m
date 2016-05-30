From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Remove console(4) references
Date: Mon, 30 May 2016 07:57:34 +0300
Message-ID: <574BC83E.8050001@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

0f9e647 removed the obsolete console(4) page but we still have few
references to it. The patch below removes them or converts to refs
to concole_ioctl(4) where appropriate.

---
 man4/console_codes.4 | 1 -
 man4/console_ioctl.4 | 1 -
 man4/tty.4           | 2 +-
 man4/vcs.4           | 4 ++--
 man7/charsets.7      | 1 -
 5 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/man4/console_codes.4 b/man4/console_codes.4
index bd9b172..a39cdb8 100644
--- a/man4/console_codes.4
+++ b/man4/console_codes.4
@@ -649,6 +649,5 @@ An older version of this document implied that Linux recognizes the
 ECMA-48 control sequence for invisible text.
 It is ignored.
 .SH SEE ALSO
-.BR console (4),
 .BR console_ioctl (4),
 .BR charsets (7)
diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
index 70fb11d..ee7d926 100644
--- a/man4/console_ioctl.4
+++ b/man4/console_ioctl.4
@@ -850,7 +850,6 @@ Use POSIX functions.
 .BR fcntl (2),
 .BR ioperm (2),
 .BR termios (3),
-.BR console (4),
 .BR console_codes (4),
 .BR mt (4),
 .BR sd (4),
diff --git a/man4/tty.4 b/man4/tty.4
index 18e6a9c..5e3c5e7 100644
--- a/man4/tty.4
+++ b/man4/tty.4
@@ -77,7 +77,7 @@ to detach itself.
 .BR mknod (1),
 .BR ioctl (2),
 .BR termios (3),
-.BR console (4),
+.BR console_ioctl (4),
 .BR tty_ioctl (4),
 .BR ttyS (4),
 .BR agetty (8),
diff --git a/man4/vcs.4 b/man4/vcs.4
index 891c8f5..4646edd 100644
--- a/man4/vcs.4
+++ b/man4/vcs.4
@@ -73,7 +73,7 @@ argument.
 These devices replace the screendump
 .BR ioctl (2)
 operations of
-.BR console (4),
+.BR console_ioctl (4),
 so the system
 administrator can control access using filesystem permissions.
 .PP
@@ -170,7 +170,7 @@ main(void)
 }
 .fi
 .SH SEE ALSO
-.BR console (4),
+.BR console_ioctl (4),
 .BR tty (4),
 .BR ttyS (4),
 .BR gpm (8)
diff --git a/man7/charsets.7 b/man7/charsets.7
index 634c08e..214285a 100644
--- a/man7/charsets.7
+++ b/man7/charsets.7
@@ -329,7 +329,6 @@ This is not enough for Japanese, Chinese, and
 Korean, but it is enough for most other purposes.
 .SH SEE ALSO
 .BR iconv (1),
-.BR console (4),
 .BR ascii (7),
 .BR iso_8859-1 (7),
 .BR unicode (7),

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
