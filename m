From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/6] ld.so.8: document Debian's /etc/ld.so.nohwcap extension
Date: Thu, 20 Oct 2011 02:14:24 -0500
Message-ID: <20111020071424.GD11485@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

To avoid trouble when the generic version of libc has been upgraded
but some machine-specific versions have not, Ben Collins came up with
this hack to temporarily disable the feature of choosing which library
to load based on hardware capabilities.  It is just an internal
feature, but let's document it anyway to avoid people being confused
if Debian's custom ld.so(8) manpage gets replaced with an up-to-date
copy from man-pages.

Text from Aurelian Jarno's update to the Debian glibc package, r1812
(ld.so.8: Update the manpage, 2006-10-01).

Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Incidentally, is there some upstream-supported way to do this
(override LD_HWCAP_MASK using a file on the filesystem)?  How do other
distros address this problem (e.g., ABI mismatches between out-of-date
hwcap libs and the updated libnss) during upgrades?

 man8/ld.so.8 |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 6b5799b..a5ecc4b 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -382,6 +382,11 @@ libraries and an ordered list of candidate libraries.
 File containing a whitespace separated list of ELF shared libraries to
 be loaded before the program.
 .TP
+.I /etc/ld.so.nohwcap
+(Debian only, since glibc 2.2.93-1)
+When this file is present the dynamic linker will load the non-optimized version
+of a library, even if the CPU supports the optimized version.
+.TP
 .B lib*.so*
 shared libraries
 .PD
-- 
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
