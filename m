From: Sergey Polovko <sergey-r6a5ZGF03PZBDLzU/O5InQ@public.gmane.org>
Subject: (unknown)
Date: Sun, 15 Jan 2017 22:56:18 +0300
Message-ID: <6306751484510178@web25g.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

It seems that unix(7) and recv(2) man pages have different information about using MSG_TRUNC flag with UNIX domain sockets. 
Unix(7) man page says that this flag is not supported by UNIX domain sockets but actually it does. I wrote a simple program to 
check usage of this flag. Recv(2) man pages says that it supports since linux 3.4. Unfortunately I have no such old kernel near me
but on 3.11, 3.13, 3.18 and 4.4 that I have this flag works with AF_UNIX sockets.

Could you please fix that?

Thanks,
Sergey Polovko
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
