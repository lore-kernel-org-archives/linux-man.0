From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: locale.1: format fix
Date: Tue, 27 Jan 2015 01:21:17 +0900
Message-ID: <CALhU9tktwchejfJ9XgdKrjoUW=XMGbLyc0CPmChPqpNnprwgrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man1/locale.1 b/original/man1/locale.1
index ef240be..650a36e 100644
--- a/man1/locale.1
+++ b/man1/locale.1
@@ -65,7 +65,7 @@ metadata about each locale to be included in the output.
 Display the available charmaps (character set description files).
 .PP
 The
-.I locale
+.B locale
 command can also be provided with one or more arguments,
 which are the names of locale keywords (for example,
 .IR date_fmt ,
@@ -108,7 +108,7 @@ so that the output has the format:
     \fIkeyword\fP="\fIvalue\fP"
 .PP
 The
-.I locale
+.B locale
 command also knows about the following options:
 .TP
 .BR \-v ", " \-\-verbose

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
