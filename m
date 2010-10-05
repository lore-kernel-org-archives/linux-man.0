From: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Subject: getifaddrs: Prevent possible NULL pointer access
Date: Tue, 5 Oct 2010 14:57:23 +0200
Message-ID: <201010051457.23610.thomas.jarosch@intra2net.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_zCyqMYfRqft8X3F"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Boundary-00=_zCyqMYfRqft8X3F
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

the example code for getifaddrs() contains a possible NULL pointer access.
Attached is a patch against man-pages 3.22 from Fedora 12.

Best regards,
Thomas Jarosch

--Boundary-00=_zCyqMYfRqft8X3F
Content-Type: text/x-patch;
  charset="UTF-8";
  name="man-pages-getifaddrs-prevent-NULL-access.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="man-pages-getifaddrs-prevent-NULL-access.patch"

diff -u -r -p man-pages-3.22/man3/getifaddrs.3 man-pages.prevent_NULL/man3/getifaddrs.3
--- man-pages-3.22/man3/getifaddrs.3	2009-07-25 08:53:32.000000000 +0200
+++ man-pages.prevent_NULL/man3/getifaddrs.3	2010-10-05 14:13:25.536917362 +0200
@@ -245,6 +245,9 @@ main(int argc, char *argv[])
        can free list later */
 
     for (ifa = ifaddr; ifa != NULL; ifa = ifa\->ifa_next) {
+        if (ifa\->ifa_addr == NULL)
+            continue;
+
         family = ifa\->ifa_addr\->sa_family;
 
         /* Display interface name and family (including symbolic

--Boundary-00=_zCyqMYfRqft8X3F--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
