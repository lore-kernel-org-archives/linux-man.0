From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] if_nametoindex.3: add possible errno for if_nametoindex()
Date: Tue, 9 May 2017 21:19:55 +0200
Message-ID: <650c332c-2775-e9fe-aba8-3d8ad433e690@gmail.com>
References: <44e09423-9043-26c1-b6e3-7a6eea5be7ff@taghos.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <44e09423-9043-26c1-b6e3-7a6eea5be7ff-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/09/2017 04:45 PM, Douglas Caetano dos Santos wrote:
> Checked against glibc and kernel code: when given name isn't a valid interface,
> kernel returns ENODEV and glibc just forwards it.

Thanks, Douglas. Applied.

Cheers,

Michael


> Signed-off-by: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
> ---
>  man3/if_nametoindex.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/if_nametoindex.3 b/man3/if_nametoindex.3
> index 9689cdbd7..cfe49bc91 100644
> --- a/man3/if_nametoindex.3
> +++ b/man3/if_nametoindex.3
> @@ -67,6 +67,14 @@ on error, NULL is returned and
>  .I errno
>  is set appropriately.
>  .SH ERRORS
> +.BR if_nametoindex ()
> +may fail and set
> +.I errno
> +if:
> +.TP
> +.B ENODEV
> +No interface found with given name.
> +.PP
>  .BR if_indextoname ()
>  may fail and set
>  .I errno
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
