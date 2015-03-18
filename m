From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: aio_return(3): misleading RETURN VALUE
Date: Wed, 18 Mar 2015 09:03:38 +0100
Message-ID: <5509315A.1040103@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I've just typed in the following commit message:

--
The man page was misleading and I must have had a bad moment 
mechanically coding what the man page says without thinking about it.
So I seem to have assumed that aio_return() might return EINVAL which 
can't be the case. In fact the error is returned in errno which isn't 
mentioned by the Linux man page for aio_return.
--

I suggest to use the same wording as in write(2) in the paragraph RETURN 
VALUE:

"On error, -1 is returned, and errno is set appropriately."

I've verified it by looking at the source for aio_return of glibc.

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
