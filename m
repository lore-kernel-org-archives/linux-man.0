From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] canonicalize_file_name.3: ATTRIBUTES: Note function that
 is thread-safe
Date: Wed, 04 Feb 2015 07:11:01 +0100
Message-ID: <54D1B7F5.3000202@gmail.com>
References: <1423026221-10877-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423026221-10877-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2015 06:03 AM, Ma Shimiao wrote:
> The functions canonicalize_file_name() in glibc is thread safe.
> It's marking matches glibc marking.

Applied.  Thanks, Ma Shimiao.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/canonicalize_file_name.3 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man3/canonicalize_file_name.3 b/man3/canonicalize_file_name.3
> index b126e26..a0a3541 100644
> --- a/man3/canonicalize_file_name.3
> +++ b/man3/canonicalize_file_name.3
> @@ -70,6 +70,18 @@ to indicate the error.
>  .SH ERRORS
>  See
>  .BR realpath (3).
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see 
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw24 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR canonicalize_file_name ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  This function is a GNU extension.
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
