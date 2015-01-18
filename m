From: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH[V2] 4/5] tzset.3: Add Environment section
Date: Sun, 18 Jan 2015 15:07:10 -0500
Message-ID: <54BC126E.1080904@gmx.com>
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

FILES section was overly verbose and included
environment variables.  Added ENVIRONMENT section,
removing ENV VARS from the FILES section.
Corrected Files section items.

As stated in the previous commit
/usr/share/zoneinfo/localtime
is not used, nor recommended by glibc.

Also not used is:
/usr/share/zoneinfo/posixrules

STEPS TO REPRODUCE NO posixrules:

TZ=EST+5EDT,M1.3.0/2,M10.5.0/2 date
Sun Jan 18 14:01:24 EDT 2015
TZ=EST+5EDT,M1.4.0/2,M10.5.0/2 date
Sun Jan 18 13:01:27 EST 2015

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---

The following changes since commit b58839b96d626e67da233d4bf7ba04d5dfcd0e66:

  syscalls.2: Remove some details for sync_file_range2() (2015-01-18 19:56:05 +0100)

are available in the git repository at:

  git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:jwpi/man-pages.git tzset

for you to fetch changes up to 2b0725c0b6f6788628567ea4d5cfc396898584a0:

  tzset.3: TZ filespec omitts the colon (2015-01-18 14:40:21 -0500)


 man3/tzset.3 | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 09fac15..b49c8ee 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -180,28 +180,26 @@ Here's an example, once more for New Zealand:
 
     TZ=":Pacific/Auckland"
 .fi
+.SH ENVIRONMENT
+.TP
+.B TZ
+.RB If \ TZ
+is set, its value takes precedence over the system configured timezone.
+.TP
+.B TZDIR
+.RB If \ TZDIR
+is set, its value takes precedence over the system configured timezone
+database directory path.
 .SH FILES
-Under glibc,
-the system timezone directory is determined using the
-.BR TZDIR
-the environment variable.
-If
-.BR TZDIR
-is not set, the default depends on the system setup, but is normally
-.IR /usr/share/zoneinfo .
-.LP
-This timezone directory contains the files
