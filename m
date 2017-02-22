From: DJ Delorie <dj-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] nftw(): clarify dangling symlinks case
Date: Tue, 21 Feb 2017 20:06:01 -0500
Message-ID: <xnshn7hw5i.fsf@greed.delorie.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, codonell-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org


In the event that nftw() encounters a symbolic link which refers to a
nonexisting file, the "struct stat" info will not have been filled in
if FTW_PHYS is not specified (because stat() is used instead of
lstat()).  This patch clarifies the documentation and corrects the
sample code to reflect this.

Reported to Fedora in https://bugzilla.redhat.com/show_bug.cgi?id=1422736

patch is against today's git

diff --git a/man3/ftw.3 b/man3/ftw.3
index b421c00..7b54621 100644
--- a/man3/ftw.3
+++ b/man3/ftw.3
@@ -165,7 +165,9 @@ is a symbolic link, and \fBFTW_PHYS\fP was set in \fIflags\fP.
 .B FTW_SLN
 .I fpath
 is a symbolic link pointing to a nonexistent file.
-(This occurs only if \fBFTW_PHYS\fP is not set.)
+(This occurs only if \fBFTW_PHYS\fP is not set, and the data
+.I sb
+points to during this callback will not be defined.)
 .PP
 The fourth argument that
 .BR nftw ()
@@ -421,13 +423,17 @@ static int
 display_info(const char *fpath, const struct stat *sb,
              int tflag, struct FTW *ftwbuf)
 {
-    printf("%\-3s %2d %7jd   %\-40s %d %s\\n",
-        (tflag == FTW_D) ?   "d"   : (tflag == FTW_DNR) ? "dnr" :
-        (tflag == FTW_DP) ?  "dp"  : (tflag == FTW_F) ?   "f" :
-        (tflag == FTW_NS) ?  "ns"  : (tflag == FTW_SL) ?  "sl" :
-        (tflag == FTW_SLN) ? "sln" : "???",
-        ftwbuf\->level, (intmax_t) sb\->st_size,
-        fpath, ftwbuf\->base, fpath + ftwbuf\->base);
+    if (tflag == FTW_SLN)
+        printf("sln %2d \-------   %-40s %d %s\n",
+            ftwbuf\->level, fpath, ftwbuf\->base, fpath + ftwbuf\->base);
+    else
+        printf("%\-3s %2d %7jd   %\-40s %d %s\\n",
+            (tflag == FTW_D) ?   "d"   : (tflag == FTW_DNR) ? "dnr" :
+            (tflag == FTW_DP) ?  "dp"  : (tflag == FTW_F) ?   "f" :
+            (tflag == FTW_NS) ?  "ns"  : (tflag == FTW_SL) ?  "sl" :
+            "???",
+            ftwbuf\->level, (intmax_t) sb\->st_size,
+            fpath, ftwbuf\->base, fpath + ftwbuf\->base);
     return 0;           /* To tell nftw() to continue */
 }
 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
