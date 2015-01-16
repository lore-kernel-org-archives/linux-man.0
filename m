From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clone.2: ffix
Date: Fri, 16 Jan 2015 07:41:45 +0100
Message-ID: <54B8B2A9.8030806@gmail.com>
References: <CALhU9tnqxnG56rMosUUKo2Ab-vma7JFOWi_dKtfDmzXBxkkfJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tnqxnG56rMosUUKo2Ab-vma7JFOWi_dKtfDmzXBxkkfJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:20 PM, Akihiro Motoki wrote:
> diff --git a/man2/clone.2 b/man2/clone.2
> index 2d4fd1a..ec6b1f9 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -417,7 +417,7 @@ or
>  .BR clone ()
>  in Linux 2.6.23,
>  the current
> -.BR clone()
> +.BR clone ()
>  semantics were merged in Linux 3.5,
>  and the final pieces to make the user namespaces completely usable were
>  merged in Linux 3.8.)
> @@ -1012,7 +1012,8 @@ does not have a mapping in the parent namespace (see
>  .TP
>  .BR EPERM " (since Linux 3.9)"
>  .\" commit 3151527ee007b73a0ebd296010f1c0454a919c7d
> -.B CLONE_NEWUSER was specified in
> +.B CLONE_NEWUSER
> +was specified in
>  .I flags
>  and the caller is in a chroot environment
>  .\" FIXME What is the rationale for this restriction?
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
