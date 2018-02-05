From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] ld.so.8: make lack of separator escaping explicit
Date: Mon,  5 Feb 2018 16:48:02 -0500
Message-ID: <20180205214802.18397-1-vapier@gentoo.org>
References: <20180205161357.8131-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205161357.8131-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Make it clear that the delimiters in LD_PRELOAD, LD_LIBRARY_PATH, and
LD_AUDIT cannot be escaped so people don't try various methods (such
as \:) to workaround it.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man8/ld.so.8 | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 64e1fb2afdc3..bd1457e1e7f5 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -271,7 +271,8 @@ This is useful when using a debugger.
 .B LD_LIBRARY_PATH
 A list of directories in which to search for
 ELF libraries at execution time.
-The items in the list are separated by either colons or semicolons.
+The items in the list are separated by either colons or semicolons,
+and there is no support for escaping either separator.
 Similar to the
 .B PATH
 environment variable.
@@ -310,7 +311,8 @@ as shell variables!)
 .B LD_PRELOAD
 A list of additional, user-specified, ELF shared
 objects to be loaded before all others.
-The items of the list can be separated by spaces or colons.
+The items of the list can be separated by spaces or colons,
+and there is no support for escaping either separator.
 This can be used to selectively override functions in other shared objects.
 The objects are searched for using the rules given under DESCRIPTION.
 .IP
@@ -352,7 +354,8 @@ many obsolete or only for internal use.
 A colon-separated list of user-specified, ELF shared objects
 to be loaded before all others in a separate linker namespace
 (i.e., one that does not intrude upon the normal symbol bindings that
-would occur in the process).
+would occur in the process)
+and there is no support for escaping the separator.
 These objects can be used to audit the operation of the dynamic linker.
 .IP
 .B LD_AUDIT
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
