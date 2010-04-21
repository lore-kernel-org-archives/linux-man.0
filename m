From: Jeff Mahovsky <Jeff.Mahovsky-hCDZnVt6e3JSwrhanM7KvQ@public.gmane.org>
Subject: stat(2) does not indicate behavior with NULL filename arg, man pages
 3.24
Date: Wed, 21 Apr 2010 12:00:10 -0700
Message-ID: <4BCF4B3A.8020909@dreamworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The stat(2) manpage does not indicate the behavior of the stat() 
function when the filename is a NULL pointer.  Does stat() return an 
error or is the behavior undefined?

Jeff Mahovsky
Dreamworks Animation

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
