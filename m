From: Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org>
Subject: getrandom(2): return type mismatch for getrandom()
Date: Sat, 9 Sep 2017 13:42:50 +0200
Message-ID: <a1b295b6-1e5d-6e5b-20db-fb5f3b09a72c@esse.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-CH
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The getrandom(2) page claims that getrandom() returns int.  It actually
returns ssize_t according to sysdeps/unix/sysv/linux/getrandom.c in
glibc and drivers/char/random.c in Linux.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
