From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: recv.2: fix variable name
Date: Tue, 06 Jan 2015 08:04:39 +0100
Message-ID: <54AB8907.3000102@gmail.com>
References: <CALhU9t=42DQgs34oj=VV8wPhhNFwRbnamDVfuDxS+iGDMR7z7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9t=42DQgs34oj=VV8wPhhNFwRbnamDVfuDxS+iGDMR7z7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael


On 01/04/2015 10:26 PM, Akihiro Motoki wrote:
> diff --git a/man2/recv.2 b/man2/recv.2
> index e673a12..a3470cf 100644
> --- a/man2/recv.2
> +++ b/man2/recv.2
> @@ -330,7 +330,7 @@ The caller should set
>  .I msg_namelen
>  to the size of this buffer before this call;
>  upon return from a successful call,
> -.I msg_name
> +.I msg_namelen
>  will contain the length of the returned address.
>  If the application does not need to know the source address,
>  .I msg_name
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
