From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] typo and formatting fix in console_ioctl.4
Date: Wed, 31 Jul 2013 05:22:12 +0900
Message-ID: <CALhU9t=2j59Xao34NW9Sc38SCDV4m__dZtHY1M0vHLC=XO6U9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

typo and formatting fix in console_ioctl.4

diff --git a/manual/LDP_man-pages/original/man4/console_ioctl.4
b/manual/LDP_man-pages/original/man4/console_ioctl.4
index 5cb3e2f..6918b24 100644
--- a/manual/LDP_man-pages/original/man4/console_ioctl.4
+++ b/manual/LDP_man-pages/original/man4/console_ioctl.4
@@ -213,7 +213,7 @@ and
 .I charheight
 are filled with
 the respective data for the currently loaded font, and the
-.I hardata
+.I chardata
 array contains the font data if the initial value of
 .I charcount
 indicated enough space was available; otherwise the
@@ -241,7 +241,6 @@ This call also invalidates the Unicode mapping.
 .B PIO_FONTX
 Sets screen font and associated rendering information.
 .I argp
