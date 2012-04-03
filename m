From: Jak <jak-Cyn6bMzNSQ8@public.gmane.org>
Subject: Changed type of ai_addrlen in struct addrinfo
Date: Tue, 03 Apr 2012 19:37:39 +0100
Message-ID: <4F7B4373.1060504@gmx.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

<http://man7.org/linux/man-pages/man3/getaddrinfo.3.html> says that 
struct addrinfo contains:

         size_t    ai_addrlen;

However, in the GNU C Library, the type was changed on 2000-04-01 from 
size_t to socklen_t, as ChangeLog.11 in the glibc source shows:

         * resolv/netdb.h
         [...]
         (struct addrinfo): Use socklen_t for ai_addrlen element.

Please could the manpage be updated?

Thanks,
Jak.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
