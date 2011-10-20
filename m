From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/6] ld.so.8: document LD_ASSUME_KERNEL
Date: Thu, 20 Oct 2011 02:09:07 -0500
Message-ID: <20111020070907.GC11485@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom Aurelian Jarno's update to the Debian glibc package, r1812
(ld.so.8: Update the manpage, 2006-10-01).  Presumably the text is
originally from the Red Hat document "What is LD_ASSUME_KERNEL and
what does it affect?", by Eric Paris and copyright =C2=A9 Red Hat Inc,
2004.
---
Eric, is it ok to include this text in the (public domain) ld.so.8
manpage?

To be safe, I'm withholding my sign-off for now, but I'm hoping it
should be ok.

 man8/ld.so.8 |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 9fc96c9..6b5799b 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -190,6 +190,18 @@ for a.out binaries only.
 Old versions of ld\-linux.so.1 also supported
 .BR LD_ELF_PRELOAD .
 .TP
+.B LD_ASSUME_KERNEL
+(glibc since 2.2.3)
+Every DSO (Dynamic Shared Object, aka shared library) can tell the dyn=
amic linker in glibc which
+minimum OS ABI version is needed. The information about the minimum OS=
 ABI version is encoded in
+a ELF note section usually named .note.ABI-tag. This is used to determ=
ine which library to load
+when multiple version of the same library is installed on the system.
+
+The
+.B LD_ASSUME_KERNEL
+environment variable overrides the kernel version used by the dynamic =
linker to determine which
+library to load.
+.TP
 .B LD_AUDIT
 (glibc since 2.4)
 A colon-separated list of user-specified, ELF shared objects
--=20
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
