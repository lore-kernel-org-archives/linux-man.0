From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] fmemopen.3:
Date: Thu, 11 Aug 2016 06:15:51 +1200
Message-ID: <153c0320-eec1-e6a7-eff6-0cb524fae8e7@gmail.com>
References: <trinity-da881baa-d26a-44b7-8330-067caefe6495-1470823527004@3capp-gmx-bs71>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <trinity-da881baa-d26a-44b7-8330-067caefe6495-1470823527004@3capp-gmx-bs71>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralfg1-hi6Y0CQ0nG0@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ralf,

On 08/10/2016 10:05 PM, ralfg1-hi6Y0CQ0nG0@public.gmane.org wrote:
> fmemopen(3), release 4.07 of the Linux /man-pages/ project
> The manpage suggests to use buf itself as IO-buffer:
> setbuffer(stream,buf,size);.  It seems strange at least. In versions glibc 2.24
> it also results in incorrect behavior, see
> http://stackoverflow.com/questions/38854163/using-rewind-on-a-file-opened-with-fmemopen.
> Thus I believe, the suggested code is invalid and I suggest to delete the
> corresponding sentence from the manpage. Should be cross-checked by some glibc
> developer.
> Best regards

Thanks for the patch. Rich Felker already reported this issue to me, and I've
already made the same change to the page.

Cheers,

Michael


> Ralfg1.
> -------------------------------------------------------------------------------------------------------------
> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
> index b17b6af..5836603 100644
> --- a/man3/fmemopen.3
> +++ b/man3/fmemopen.3
> @@ -137,13 +137,6 @@ Disabling buffering with the following call
>   may be useful to detect errors at the time of an output operation:
>
>       setbuf(stream, NULL);
> -
> -Alternatively, the caller can explicitly set
> -.I buf
> -as the stdio stream buffer, at the same time informing stdio
> -of the buffer's size, using:
> -
> -    setbuffer(stream, buf, size);
>   .\"
>   .\" See http://sourceware.org/bugzilla/show_bug.cgi?id=1995
>   .\" and
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
