From: Emil Mikulic <emikulic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: stat(2) off by one
Date: Thu, 25 Nov 2010 11:58:41 +1100
Message-ID: <AANLkTim=JUmVVv+kfh-MX4H_zsitAgnOHiooxFRuYBNn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As seen on http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html:

       EOVERFLOW
              (stat()) path refers to a file whose size cannot be
represented in the
              type off_t.  This can occur when an application compiled
on a 32-bit
              platform without -D_FILE_OFFSET_BITS=64 calls stat() on
a file whose
              size exceeds (2<<31)-1 bits.

I believe 2<<31 should read 1<<31 (which equals 2^31).

I've tested this on an Ubuntu 10.04 system and the largest file I can
successfully stat [without the #define] is 2147483647 bytes.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
