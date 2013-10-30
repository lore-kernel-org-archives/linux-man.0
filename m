From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] erfc.3: wfix
Date: Wed, 30 Oct 2013 14:44:16 +1300
Message-ID: <52706470.2000801@gmail.com>
References: <1383027059-31147-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383027059-31147-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

Thanks,

Michael



On 29.10.2013 19:10, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/erfc.3 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/erfc.3 b/man3/erfc.3
> index 800794d..7ea6eec 100644
> --- a/man3/erfc.3
> +++ b/man3/erfc.3
> @@ -135,7 +135,10 @@ also conforms to
>  SVr4, 4.3BSD.
>  .SH NOTES
>  The
> -.BR erfc ()
> +.BR erfc (),
> +.BR erfcf (),
> +and
> +.BR erfcl ()
>  functions are provided to avoid the loss accuracy that
>  would occur for the calculation 1-erf(x) for large values of
>  .IR x
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
