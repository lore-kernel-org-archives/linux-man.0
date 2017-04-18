From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Describe accepted characters for hostname
Date: Tue, 18 Apr 2017 13:54:42 +0300
Message-ID: <17d13448-3659-9e7e-7e7d-745a2780cfa1@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Perhaps this is helpful. The HOSTALIASES section looks outdated given that
getaddrinfo(3) should be used but I'm not sure what should be done with it.

The referenced mailaddr(7) might also benefit from a review but I'm out of
cycles for that currently.

---
 man7/hostname.7 | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/man7/hostname.7 b/man7/hostname.7
index bc181a9..2c960c6 100644
--- a/man7/hostname.7
+++ b/man7/hostname.7
@@ -44,6 +44,21 @@ Hostnames are domains, where a domain is a hierarchical, dot-separated
 list of subdomains; for example, the machine monet, in the "berkeley"
 subdomain of the "edu" domain would be represented as "monet.berkeley.edu".
 
+Each element of the hostname must be from 1 to 63 characters long and the
+entire hostname, including the dots, can be at most 253 characters long.
+Valid characters for hostnames are
+.BR ASCII (7)
+letters from
+.I a
+to
+.IR z ,
+the digits from
+.I 0
+to
+.IR 9 ,
+and the hyphen (\-).
+A hostname may not start with a hyphen.
+
 Hostnames are often used with network client and server programs,
 which must generally translate the name to an address for use.
 (This task is generally performed by either
@@ -83,10 +98,20 @@ The search path can be changed from the default
 by a system-wide configuration file (see
 .BR resolver (5)).
 .SH SEE ALSO
+.BR getaddrinfo (3),
 .BR gethostbyname (3),
 .BR resolver (5),
 .BR mailaddr (7),
 .BR named (8)
+
+.UR http://www.ietf.org\:/rfc\:/rfc1123.txt
+IETF RFC\ 1123
+.UE
+
+.UR http://www.ietf.org\:/rfc\:/rfc1178.txt
+IETF RFC\ 1178
+.UE
+
 .\" .SH HISTORY
 .\" Hostname appeared in
 .\" 4.2BSD.

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
