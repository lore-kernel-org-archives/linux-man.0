From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: typo fixes in
Date: Tue, 8 May 2012 03:01:21 +0900
Message-ID: <CALhU9tnz7QAnqfCz-Td95wW9kVYFG=Rwgk76ChYcjBcOmKHQFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here are minor typo fixes (against man-pages 3.40 release).

Thanks in advance,
-- 
Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man3/posix_memalign.3 b/man3/posix_memalign.3
index 5d33cba..012860f 100644
--- a/man3/posix_memalign.3
+++ b/man3/posix_memalign.3
@@ -259,7 +259,7 @@ and then align the obtained value).
 .\" but not to
 .\" .IR realloc (3).
 The glibc implementation
-allows memory obtained from any of these these functions to be
+allows memory obtained from any of these functions to be
 reclaimed with
 .BR free (3).

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 8d69ba4..09dc018 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -363,7 +363,7 @@ to insert characters into the input queue of a
terminal other than
 the caller's controlling terminal.
 .IP *
 employ the obsolete
-.BR nfsservctl (2);
+.BR nfsservctl (2)
 system call;
 .IP *
 employ the obsolete
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
