From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwnam.3: ffix
Date: Mon, 15 Sep 2014 11:14:42 +0200
Message-ID: <5416AE02.2030709@gmail.com>
References: <1410753457-21041-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410753457-21041-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in the attributes_reformat_2 branch.

Cheers,

Michael


On 09/15/2014 05:57 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fenv.3     | 2 +-
>  man3/getpwnam.3 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/fenv.3 b/man3/fenv.3
> index 6884202..6db7c86 100644
> --- a/man3/fenv.3
> +++ b/man3/fenv.3
> @@ -270,7 +270,7 @@ For an explanation of the terms used in this section, see
>  .TS
>  allbox;
>  lb lb lb
> -lw38 l l.
> +lw37 l l.
>  Interface	Attribute	Value
>  T{
>  .BR feclearexcept (),
> diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
> index f14a637..512ca9e 100644
> --- a/man3/getpwnam.3
> +++ b/man3/getpwnam.3
> @@ -219,7 +219,7 @@ For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
>  allbox;
> -lbw22 lb lb
> +lbw26 lb lb
>  l l l.
>  Interface	Attribute	Value
>  T{
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
