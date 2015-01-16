From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: rename.2: remove unnecessary period
Date: Fri, 16 Jan 2015 07:45:34 +0100
Message-ID: <54B8B38E.8070502@gmail.com>
References: <CALhU9tm7-Ni8btnL6ZZOjhLYKkfAvn2eMVhZ1fnt8eMfp=vvvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tm7-Ni8btnL6ZZOjhLYKkfAvn2eMVhZ1fnt8eMfp=vvvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:22 PM, Akihiro Motoki wrote:
> diff --git a/man2/rename.2 b/man2/rename.2
> index bd37428..d30cf8b 100644
> --- a/man2/rename.2
> +++ b/man2/rename.2
> @@ -186,7 +186,7 @@ argument is a bit mask consisting of zero or more
> of the following flags:
>  .TP
>  .B RENAME_NOREPLACE
>  Don't overwrite
> -.IR newpath .
> +.I newpath
>  of the rename.
>  Return an error if
>  .IR newpath
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
