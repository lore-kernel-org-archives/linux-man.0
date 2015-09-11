From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fgetgrent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 11 Sep 2015 12:06:01 +0200
Message-ID: <55F2A789.30605@gmail.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1440411596-2566-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/24/2015 12:19 PM, Zeng Linggang wrote:
> The marking matches glibc marking.
> marking of function in glibc is:
> - fgetgrent: MT-Unsafe race:fgrent
> 
> ps: We think race:fgrent in glibc maybe hard for users to understand,
> and have sent a patch to the GNU libc community for changing it to
> race:fgetgrent, however, something about the copyright impeded the progress.
> Here we mark it "race:fgetgrent", so there is a little different.

Applied!  Thanks, Zeng Linggang.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fgetgrent.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/fgetgrent.3 b/man3/fgetgrent.3
> index 57665dd..aa08e0f 100644
> --- a/man3/fgetgrent.3
> +++ b/man3/fgetgrent.3
> @@ -90,6 +90,25 @@ is set to indicate the cause.
>  Insufficient memory to allocate
>  .I group
>  structure.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR fgetgrent ()
> +.\" FIXME: the following marking is different from which in glibc manual,
> +.\" marking in glibc manual is,
> +.\" fgetgrent: MT-Unsafe race:fgrent
> +.\" We think race:fgrent in glibc maybe hard for users to understand,
> +.\" and have sent a patch to the GNU libc community for changing it to
> +.\" race:fgetgrent, however, something about the copyright impeded the progress.
> +T}	Thread safety	MT-Unsafe race:fgetgrent
> +.TE
> +
>  .SH CONFORMING TO
>  SVr4.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
