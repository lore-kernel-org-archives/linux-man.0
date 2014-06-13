From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recv.2: tfix
Date: Fri, 13 Jun 2014 14:28:44 +0200
Message-ID: <CAKgNAkg24011j4z61SoVWK=ZZHq_cSf-KD2xDU=TyQA3NNGMgA@mail.gmail.com>
References: <CALhU9tm5JFXVrXFqTw=PaNQ42PmUSa+v7WfNMR+RAX4DAOkg0Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tm5JFXVrXFqTw=PaNQ42PmUSa+v7WfNMR+RAX4DAOkg0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thank you Akihiro,

By chance someone else recently sent a chance to fix the same error.

Best regards,

Michael


On Fri, Jun 13, 2014 at 2:21 PM, Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ---
>  man2/recv.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/recv.2 b/man2/recv.2
> index 6815fd7..3b82bbd 100644
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
> --
> 1.9.1
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
