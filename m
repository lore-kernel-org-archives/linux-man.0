From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nextafter.3: Reformat thread-safety information
Date: Tue, 23 Sep 2014 06:24:21 +0200
Message-ID: <5420F5F5.7090003@gmail.com>
References: <1411373542-16712-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411373542-16712-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my attributes_reformat_2
branch.

Cheers,

Michael

On 09/22/2014 10:12 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/nextafter.3 | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/nextafter.3 b/man3/nextafter.3
> index 5548908..bee37d7 100644
> --- a/man3/nextafter.3
> +++ b/man3/nextafter.3
> @@ -177,16 +177,24 @@ These functions do not set
>  .\" FIXME . Is it intentional that these functions do not set errno?
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6799
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw28 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR nextafter (),
>  .BR nextafterf (),
> +.br
>  .BR nextafterl (),
>  .BR nexttoward (),
> +.br
>  .BR nexttowardf (),
> -and
>  .BR nexttowardl ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  This function is defined in IEC 559 (and the appendix with
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
