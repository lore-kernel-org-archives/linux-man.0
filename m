From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getxattr.2 : Fix RETURN VALUE description
Date: Sun, 06 Apr 2014 10:40:59 +0200
Message-ID: <5341131B.4040405@gmail.com>
References: <CAFfPn7jvbk=V8b1yYq5mvB9dy_aZrL=-ngYz8FDnDiAgK4KO5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFfPn7jvbk=V8b1yYq5mvB9dy_aZrL=-ngYz8FDnDiAgK4KO5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhay Sachan <sachan.abhay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/05/2014 11:25 PM, Abhay Sachan wrote:
> Hi,
> 
> The manpage for getxattr() says : "On success, a positive number
> is returned indicating the size of the extended attribute value."
> 
> But in case the value length is zero, we should return the size as
> zero (as is done by ext4, xfs). Thus "positive" number kind looks
> misleading. So it should be changed to "nonnegative".

Thanks, Abhay. Applied.

Cheers,

Michael

> diff --git a/man2/getxattr.2 b/man2/getxattr.2
> index adc7617..c343c34 100644
> --- a/man2/getxattr.2
> +++ b/man2/getxattr.2
> @@ -98,7 +98,7 @@ The interface is designed to allow guessing of initial buffer
>  sizes, and to enlarge buffers when the return value indicates
>  that the buffer provided was too small.
>  .SH RETURN VALUE
> -On success, a positive number is returned indicating the size of the
> +On success, a nonnegative number is returned indicating the size of the
>  extended attribute value.
>  On failure, \-1 is returned and
>  .I errno
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
