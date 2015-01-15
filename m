From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: printf.3: ffix
Date: Fri, 16 Jan 2015 02:22:43 +0900
Message-ID: <CALhU9tktSoyhnm3w0MbPt8j1+jBh-8oTDhPtJENVTUb0Jh8K8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man3/printf.3 b/man3/printf.3
index c6fe88c..e03453b 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -804,7 +804,7 @@ or
 The number of characters written so far is stored into the integer
 pointed to by the corresponding argument.
 That argument shall be an
-.I "int\ *",
+.IR "int\ *" ,
 or variant whose size matches the (optionally)
 supplied integer length modifier.
 No argument is converted.

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
