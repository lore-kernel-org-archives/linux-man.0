From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] wait.2: Add paragraph break before errno note in RETURN VALUE
 section.
Date: Wed, 24 Sep 2014 11:55:37 -0400
Message-ID: <5422E979.8030606@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The text "Each of these calls sets errno to an appropriate
value in the case of an error." is not only for waitid.

This patch adds a paragraph break to move the errno note
to a new paragraph where it makes sense, as it applies to
all the wait* functions.

Tested against upstream master.

diff --git a/man2/wait.2 b/man2/wait.2
index 224055f..4d5fc77 100644
--- a/man2/wait.2
+++ b/man2/wait.2
@@ -378,6 +378,7 @@ on error, \-1 is returned.
 .\" returns the PID of the child.  Either this is a bug, or it is intended
 .\" behavior that needs to be documented.  See my Jan 2009 LKML mail
 .\" "waitid() return value strangeness when infop is NULL".
+.PP
 Each of these calls sets
 .I errno
 to an appropriate value in the case of an error.
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
