From: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: filesystems.5 man page
Date: Wed, 23 Jun 2010 09:38:37 +0200
Message-ID: <4C21B9FD.60402@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

filesystems.5 man page does not mention ext4 filesystem, so I'm sending 
a patch which adds it.
Ivana

diff -up ./filesystems.5.pom ./filesystems.5
--- ./filesystems.5.pom    2010-02-26 05:46:53.000000000 +0100
+++ ./filesystems.5    2010-06-23 09:16:42.000000000 +0200
@@ -77,6 +77,11 @@ is a journaling version of the ext2 file
  It is easy to
  switch back and forth between ext2 and ext3.
  .TP
+.B ext4
+is the next generation of the ext filesystem series.  In addition to
+journaling, ext4 supports larger files and filesystems than ext3, and 
provides
+other modern features such as preallocation and an extent-based allocator.
+.TP
  .B Reiserfs
  is a journaling file system, designed by Hans Reiser,
  that was integrated into Linux in kernel 2.4.1.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
