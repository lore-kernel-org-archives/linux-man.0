From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Typos in man2/swapon.2 man2/truncate.2
Date: Sun, 28 Nov 2010 22:30:09 +0100
Message-ID: <AANLkTind_ARPRgAjh0JZUNy48w2BCCL0VosqP-p=DZDz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here is a patch.

Denis


diff --git a/man2/swapon.2 b/man2/swapon.2
index a849b6c..a4b34f5 100644
--- a/man2/swapon.2
+++ b/man2/swapon.2
@@ -74,7 +74,7 @@ If the
 flag is specified in the
 .BR swapon ()
 .I swapflags
-argumument, freed swap pages will be discarded before they are reused,
+argument, freed swap pages will be discarded before they are reused,
 if the swap device supports the discard or trim operation.
 (This may improve performance on some Solid State Devices,
 but often it does not.)
diff --git a/man2/truncate.2 b/man2/truncate.2
index 1324017..fb388b2 100644
--- a/man2/truncate.2
+++ b/man2/truncate.2
@@ -239,7 +239,7 @@ and
 .BR ftruncate64 ()
 system calls that handle large files.
 However, these details can be ignored by applications using glibc, whose
-wrapper functions transparently employ the more recent system calla
+wrapper functions transparently employ the more recent system calls
 where they are available.
 .SH BUGS
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
