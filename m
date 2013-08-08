From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ilogb.3: tfix
Date: Thu, 08 Aug 2013 10:25:31 +0200
Message-ID: <520355FB.9010603@gmail.com>
References: <1375780370-11239-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375780370-11239-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/06/13 11:12, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Hello Haitao,

> ---
>  man3/ilogb.3 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/ilogb.3 b/man3/ilogb.3
> index 481099b..f024500 100644
> --- a/man3/ilogb.3
> +++ b/man3/ilogb.3
> @@ -72,7 +72,10 @@ These functions return the exponent part of their argument
>  as a signed integer.
>  When no error occurs, these functions
>  are equivalent to the corresponding
> -.BR logb (3)
> +.BR logb (3),
> +.BR logbf (3),
> +and
> +.BR logbl (3)
>  functions, cast to
>  .IR int .
>  .SH RETURN VALUE

To my eye, the existing text is okay. So I've not applied this.

Cheers,

Michael


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
