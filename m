From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Typo] Man page 2 "readlink" example's code.
Date: Sat, 26 Oct 2013 11:01:08 +1300
Message-ID: <526AEA24.7020107@gmail.com>
References: <CAGMNOR8oQRKk-OXARtOuafcKiVPerDOXsF_ZhB_0sUN-=GTo_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGMNOR8oQRKk-OXARtOuafcKiVPerDOXsF_ZhB_0sUN-=GTo_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yuanhang zheng <zhengyhn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 14.10.2013 20:25, yuanhang zheng wrote:
> Hi,
>     I have found a typo in the `man 2 readlink` man page. In the "Example" section,
> 
>     if (r < 0) {
>         perror("lstat");
>         exit(EXIT_FAILURE);
>     }
> 
> here ``perror("lstat");`` should be ``perror("readlink");``.
> 
> Although this is just a small mistake, I think it will confuse the reader. Please fix it. Thanks.
> 
> Best wish,
> Yuanhang Zheng.

Thank you. Fixed now.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
