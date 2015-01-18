From: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH[V2] 1/5] tzset.3: filespec omitted incorrect
Date: Sun, 18 Jan 2015 15:00:07 -0500
Message-ID: <54BC10C7.1030706@gmx.com>
References: <54BAFE98.2090402@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BAFE98.2090402-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Paragraph three of the DESCRIPTION section says
that when TZ is set, but empty, then UTC is used.

Later it says if the TZ filespec is omitted then
the file /usr/share/zoneinfo/localtime is used.
This is incorrect, it will use UTC in that case as
well.

Steps to reproduce:

cd /usr/share/zoneinfo/
cp Antarctica/South_Pole localtime
cd
date
Sun Jan 18 10:59:50 EST 2015
TZ=:Hongkong date
Sun Jan 18 23:59:56 HKT 2015
TZ=:/usr/share/zoneinfo/localtime date
Mon Jan 19 05:00:03 NZDT 2015
TZ=: date
Sun Jan 18 16:00:11 UTC 2015
TZ=":" date
Sun Jan 18 16:00:18 UTC 2015
TZ=':' date
Sun Jan 18 16:00:24 UTC 2015
TZ=:/ date
Sun Jan 18 16:00:34  2015
TZ=":/" date
Sun Jan 18 16:00:40  2015
TZ="" date
Sun Jan 18 16:00:45 UTC 2015

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---

The following changes since commit b58839b96d626e67da233d4bf7ba04d5dfcd0e66:

  syscalls.2: Remove some details for sync_file_range2() (2015-01-18 19:56:05 +0100)

are available in the git repository at:

  git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:jwpi/man-pages.git tzset

for you to fetch changes up to 2b0725c0b6f6788628567ea4d5cfc396898584a0:

  tzset.3: TZ filespec omitts the colon (2015-01-18 14:40:21 -0500)


 man3/tzset.3 | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index c1c98e1..36d2fd7 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -170,14 +170,8 @@ from a file:
 :[filespec]
 .RE
 .sp
-If the file specification \fIfilespec\fP is omitted, the timezone
-information is read from the file
-.I localtime
-in the system timezone directory, which nowadays usually is
-.IR /usr/share/zoneinfo .
-This file is in
-.BR tzfile (5)
-format.
+If the file specification \fIfilespec\fP is omitted, or its value cannot
+be interpreted, then Coordinated Universal Time (UTC) is used.
 If \fIfilespec\fP is given, it specifies another
 .BR tzfile (5)-format
 file to read the timezone information from.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
