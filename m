From: Abhay Sachan <sachan.abhay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: [patch] getxattr.2 : Fix RETURN VALUE description
Date: Sun, 6 Apr 2014 14:05:03 +0530
Message-ID: <CAFfPn7g0aAoteFp7s_FkFaY0TmzZgx-Y0kmeG5oE_1qe_jSweQ@mail.gmail.com>
References: <CAFfPn7jvbk=V8b1yYq5mvB9dy_aZrL=-ngYz8FDnDiAgK4KO5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFfPn7jvbk=V8b1yYq5mvB9dy_aZrL=-ngYz8FDnDiAgK4KO5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The manpage for getxattr() says : "On success, a positive number
is returned indicating the size of the extended attribute value."

But in case the value length is zero, we should return the size as
zero (as is done by ext4, xfs). Thus "positive" number kind looks
misleading. So it should be changed to "nonnegative".

--Abhay

diff --git a/man2/getxattr.2 b/man2/getxattr.2
index adc7617..c343c34 100644
--- a/man2/getxattr.2
+++ b/man2/getxattr.2
@@ -98,7 +98,7 @@ The interface is designed to allow guessing of initial buffer
 sizes, and to enlarge buffers when the return value indicates
 that the buffer provided was too small.
 .SH RETURN VALUE
-On success, a positive number is returned indicating the size of the
+On success, a nonnegative number is returned indicating the size of the
 extended attribute value.
 On failure, \-1 is returned and
 .I errno
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
