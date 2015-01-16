From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: printf.3: ffix
Date: Fri, 16 Jan 2015 07:45:58 +0100
Message-ID: <54B8B3A6.2090903@gmail.com>
References: <CALhU9tktSoyhnm3w0MbPt8j1+jBh-8oTDhPtJENVTUb0Jh8K8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tktSoyhnm3w0MbPt8j1+jBh-8oTDhPtJENVTUb0Jh8K8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:22 PM, Akihiro Motoki wrote:
> diff --git a/man3/printf.3 b/man3/printf.3
> index c6fe88c..e03453b 100644
> --- a/man3/printf.3
> +++ b/man3/printf.3
> @@ -804,7 +804,7 @@ or
>  The number of characters written so far is stored into the integer
>  pointed to by the corresponding argument.
>  That argument shall be an
> -.I "int\ *",
> +.IR "int\ *" ,
>  or variant whose size matches the (optionally)
>  supplied integer length modifier.
>  No argument is converted.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
