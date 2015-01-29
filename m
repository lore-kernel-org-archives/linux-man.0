From: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH V4 1/1] tzset.3: Add Environment section
Date: Thu, 29 Jan 2015 11:27:07 -0500
Message-ID: <54CA5F5B.7070405@gmx.com>
References: <54BAFE98.2090402@gmx.com> <54BC126E.1080904@gmx.com> <54C4F9E7.6090104@gmail.com> <54C97A2D.2050908@gmx.com> <54C9CA11.207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C9CA11.207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

FILES section was overly verbose and included
environment variables.  Added ENVIRONMENT section,
removing ENV VARS from the FILES section.

As stated in commit 2c7f200
/usr/share/zoneinfo/localtime
is not used, nor recommended by glibc.

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---
 man3/tzset.3 | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 81fbabe..a9b088d 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -182,28 +182,27 @@ Here's an example, once more for New Zealand:
 
     TZ=":Pacific/Auckland"
 .fi
+.SH ENVIRONMENT
+.TP
+.B TZ
+If this variable is set its value takes precedence over the system
+configured timezone.
+.TP
+.B TZDIR
+If this variable is set its value takes precedence over the system
+configured timezone database directory path.
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
