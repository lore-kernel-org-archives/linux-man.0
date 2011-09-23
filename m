From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] lseek.2, inet_pton.3, tzfile.5: tfix
Date: Thu, 22 Sep 2011 21:51:30 -0400
Message-ID: <1316742690-15258-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Signed-off-by: David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---

Hi Michael,

Please find attach a consistency fix: there were only five =E2=80=9Czer=
oes=E2=80=9D
but twenty four =E2=80=9Czeros=E2=80=9D in those manual pages.

Regards

David

 man2/lseek.2     |    6 +++---
 man3/inet_pton.3 |    2 +-
 man5/tzfile.5    |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/man2/lseek.2 b/man2/lseek.2
index 9e62bc6..a7c435c 100644
--- a/man2/lseek.2
+++ b/man2/lseek.2
@@ -126,12 +126,12 @@ This can be useful for applications such as file =
backup tools,
 which can save space when creating backups and preserve holes,
 if they have a mechanism for discovering holes.
=20
-For the purposes of these operations, a hole is a sequence of zeroes t=
hat
+For the purposes of these operations, a hole is a sequence of zeros th=
at
 (normally) has not been allocated in the underlying file storage.
 However, a file system is not obliged to report holes,
 so these operations are not a guaranteed mechanism for
 mapping the storage space actually allocated to a file.
-(Furthermore, a sequence of zeroes that actually has been written
+(Furthermore, a sequence of zeros that actually has been written
 to the underlying storage may not be reported as a hole.)
 In the simplest implementation,
 a file system can support the operations by making
@@ -145,7 +145,7 @@ return
 (i.e., even if the location referred to by
 .I offset
 is a hole,
-it can be considered to consist of data that is a sequence of zeroes).
+it can be considered to consist of data that is a sequence of zeros).
 .\" https://lkml.org/lkml/2011/4/22/79
 .\" http://lwn.net/Articles/440255/
 .\" http://blogs.oracle.com/bonwick/entry/seek_hole_and_seek_data
diff --git a/man3/inet_pton.3 b/man3/inet_pton.3
index dfc879f..a2054cb 100644
--- a/man3/inet_pton.3
+++ b/man3/inet_pton.3
@@ -93,7 +93,7 @@ For example, the loopback address
 .I 0:0:0:0:0:0:0:1
 can be abbreviated as
 .IR ::1 .
-The wildcard address, consisting of all zeroes, can be written as
+The wildcard address, consisting of all zeros, can be written as
 .IR :: .
 .IP 3.
 An alternate format is useful for expressing IPv4-mapped IPv6 addresse=
s.
diff --git a/man5/tzfile.5 b/man5/tzfile.5
index 51a1c8e..3b938dd 100644
--- a/man5/tzfile.5
+++ b/man5/tzfile.5
@@ -13,7 +13,7 @@ begin with the magic characters "TZif" to identify th=
en as
 timezone information files,
 followed by a character identifying the version of the file's format
 (as of 2005, either an ASCII NUL ('\\0') or a '2')
-followed by fifteen bytes containing zeroes reserved for future use,
+followed by fifteen bytes containing zeros reserved for future use,
 followed by six four-byte values of type
 .IR long ,
 written in a "standard" byte order
--=20
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
