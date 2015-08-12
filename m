From: Orion Poplawski <orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org>
Subject: Changes for getaddrinfio()
Date: Wed, 12 Aug 2015 10:08:31 -0600
Message-ID: <55CB6F7F.3020409@cora.nwra.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

See https://sourceware.org/bugzilla/show_bug.cgi?id=18529

The declarations needed to expose getaddrinfo() have changed.  New
requirements are:

  _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 7bf815a..427f062 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -70,7 +70,7 @@ Feature Test Macro Requirements for glibc (see
 .BR freeaddrinfo (),
 .BR gai_strerror ():
 .RS 4
-_POSIX_C_SOURCE\ >=\ 1 || _XOPEN_SOURCE || _POSIX_SOURCE
+_POSIX_C_SOURCE\ >=\ 200112L || _XOPEN_SOURCE >= 600
 .RE
 .ad b
 .SH DESCRIPTION
diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index 0dc1d29..1fe8585 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -27,7 +27,7 @@ Feature Test Macro Requirements for glibc (see
 .in
 .sp
 .BR getnameinfo ():
-_POSIX_C_SOURCE\ >=\ 1 || _XOPEN_SOURCE || _POSIX_SOURCE
+_POSIX_C_SOURCE\ >=\ 200112L || _XOPEN_SOURCE >= 600
 .ad b
 .SH DESCRIPTION
 The


-- 
Orion Poplawski
Technical Manager                     303-415-9701 x222
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion-CfuHcwXVrUc@public.gmane.org
Boulder, CO 80301                   http://www.nwra.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
