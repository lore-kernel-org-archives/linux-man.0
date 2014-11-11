From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fenv.3: tfix in thread-safety information
Date: Tue, 11 Nov 2014 09:14:08 +0100
Message-ID: <5461C550.3010107@gmail.com>
References: <1414744313-6972-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414744313-6972-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/31/2014 09:31 AM, Peng Haitao wrote:
> fegetexceptflag() should be modified to feraiseexcept().

Thanks, Haitao. Applied in the attributes_reformat_2 branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fenv.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/fenv.3 b/man3/fenv.3
> index 6db7c86..bea73f9 100644
> --- a/man3/fenv.3
> +++ b/man3/fenv.3
> @@ -270,12 +270,12 @@ For an explanation of the terms used in this section, see
>  .TS
>  allbox;
>  lb lb lb
> -lw37 l l.
> +lw35 l l.
>  Interface	Attribute	Value
>  T{
>  .BR feclearexcept (),
>  .BR fegetexceptflag (),
> -.BR fegetexceptflag (),
> +.BR feraiseexcept (),
>  .BR fesetexceptflag (),
>  .BR fetestexcept (),
>  .BR fegetround (),



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
