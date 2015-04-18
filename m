From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] futex.2: use known types
Date: Sat, 18 Apr 2015 20:44:17 +0200
Message-ID: <5532A601.8060406@gmail.com>
References: <1428949085-5394-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428949085-5394-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich.

On 04/13/2015 08:18 PM, Heinrich Schuchardt wrote:
> Type u32 is not exposed to the user.
> Refer to uint32_t instead which is defined in ISO/IEC 9899:1999.

Yes, probably better. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/futex.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index baf356d..9fd8a51 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -30,7 +30,7 @@ futex \- fast user-space locking
>  .sp
>  .BI "int futex(int *" uaddr ", int " futex_op ", int " val ,
>  .BI "          const struct timespec *" timeout , \
> -" \fR  /* or: \fBu32 \fIval2\fP */ 
> +" \fR  /* or: \fBuint32_t \fIval2\fP */
>  .BI "          int *" uaddr2 ", int " val3 );
>  .fi
>  
> @@ -141,7 +141,7 @@ is determined by the operation.
>  For these operations, the kernel casts the
>  .I timeout
>  value to
> -.IR u32 ,
> +.IR uint32_t ,
>  and in the remainder of this page, this argument is referred to as
>  .I val2
>  when interpreted in this fashion.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
