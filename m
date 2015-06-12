From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] key_setsecret.3: ATTRIBUTES: Note functions that are
 thread-safe
Date: Fri, 12 Jun 2015 21:10:10 +0200
Message-ID: <557B2E92.4000007@gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432721584-11342-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2015 12:12 PM, Zeng Linggang wrote:
> After research, We think key_decryptsession(), key_setsecret(),
> key_encryptsession(), key_gendes() and key_secretkey_is_set() are
> thread-safe. But, there are not markings of them in glibc document.

Thanks, Zeng Linggang. Applied.

Cheers,

Michael

> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/key_setsecret.3 | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/man3/key_setsecret.3 b/man3/key_setsecret.3
> index 426af3c..7c201ae 100644
> --- a/man3/key_setsecret.3
> +++ b/man3/key_setsecret.3
> @@ -58,6 +58,27 @@ can be used to determine whether a key has been
>  set for the effective UID of the calling process.
>  .SH RETURN VALUE
>  These functions return 1 on success and 0 on failure.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR key_decryptsession (),
> +.br
> +.BR key_encryptsession (),
> +.br
> +.BR key_gendes (),
> +.br
> +.BR key_setsecret (),
> +.br
> +.BR key_secretkey_is_set ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH NOTES
>  Note that we talk about two types of encryption here.
>  One is asymmetric using a public and secret key.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
