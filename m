From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/6] ld.so.8: document $PLATFORM and $LIB expansion
Date: Thu, 20 Oct 2011 02:15:38 -0500
Message-ID: <20111020071538.GE11485@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Reinhard Tartler <siretart-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Wording based on a combination of a patch by Aurelien Jarno,
2007-11-18 (Debian glibc r2686) and comments by Michael Kerrisk
from man-pages-2.55~65 (Document $ORIGIN and rpath, 2007-05-26).

Fixes http://bugs.debian.org/444145

Requested-by: Reinhard Tartler <siretart-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man8/ld.so.8 |   78 ++++++++++++++++++++++++++++++++++-----------------------
 1 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index a5ecc4b..409876d 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -84,8 +84,28 @@ support files and programs
 .BR ldconfig (8)
 and
 .IR /etc/ld.so.conf .
-.SS $ORIGIN and rpath
-.PP
+.SH OPTIONS
+.TP
+.B \-\-list
+List all dependencies and how they are resolved.
+.TP
+.B \-\-verify
+Verify that program is dynamically linked and this dynamic linker can handle
+it.
+.TP
+.B \-\-library\-path PATH
+Override
+.B LD_LIBRARY_PATH
+environment variable setting (see below).
+.TP
+.B \-\-inhibit\-rpath LIST
+Ignore RPATH and RUNPATH information in object names in LIST.
+This option is ignored if
+.B ld.so
+is set-user-ID or set-group-ID.
+.SH RPATH TOKEN EXPANSION
+.TP
+.B ORIGIN
 .B ld.so
 understands the string
 .I $ORIGIN
@@ -106,38 +126,32 @@ This facilitates the creation of "turn-key" applications that
 do not need to be installed into special directories,
 but can instead be unpacked into any directory
 and still find their own shared libraries.
-.\" ld.so also understands $LIB, with the same meaning as $ORIGIN/lib,
-.\" it appears.
-.\"
-.\" There is also $PLATFORM.  This is a kind of wildcard
-.\" of directories related at AT_HWCAP.  To get an idea of the
-.\" places that $PLATFORM would match, look at the output of the
-.\" following:
-.\"
-.\" mkdir /tmp/d
-.\" LD_LIBRARY_PATH=/tmp/d strace -e open /bin/date 2>&1 | grep /tmp/d
-.\"
+.TP
+.B PLATFORM
+The string \fB$PLATFORM\fR (or equivalently \fB${PLATFORM}\fR) expands to
+the processor type of the current machine.
+This information is obtained from the kernel via the AT_HWCAP entry
+in the ELF aux vector.
+Please note that on some architectures the Linux kernel doesn't provide
+a platform string to the dynamic linker.
+
+To get an idea of the places that \fB$PLATFORM\fR would match,
+look at the output of the following:
+.in +4n
+.nf
+
+mkdir /tmp/d
+LD_LIBRARY_PATH=/tmp/d strace -e open /bin/date 2>&1 | grep /tmp/d
+
+.fi
+.in
+.TP
+.B LIB
+The string \fB$LIB\fR (or equivalently \fB${LIB}\fR) represents
+the system libraries directory, which is /lib for the native architecture
+on FHS compliant GNU/Linux systems.
 .\" ld.so lets names be abbreviated, so $O will work for $ORIGIN;
 .\" Don't do this!!
-.SH OPTIONS
-.TP
-.B \-\-list
-List all dependencies and how they are resolved.
-.TP
-.B \-\-verify
-Verify that program is dynamically linked and this dynamic linker can handle
-it.
-.TP
-.B \-\-library\-path PATH
-Override
-.B LD_LIBRARY_PATH
-environment variable setting (see below).
-.TP
-.B \-\-inhibit\-rpath LIST
-Ignore RPATH and RUNPATH information in object names in LIST.
-This option is ignored if
-.B ld.so
-is set-user-ID or set-group-ID.
 .SH ENVIRONMENT
 There are four important environment variables.
 .TP
-- 
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
