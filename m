From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] regex.3: ATTRIBUTES: Note functions that are thread safe
 with exceptions
Date: Mon, 28 Jul 2014 12:26:21 +0200
Message-ID: <53D6254D.2040305@gmail.com>
References: <1406520014-21207-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406520014-21207-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied (in my local branch). (And changelog amended
as per your follow-up mail).

Cheers,

Michael



On 07/28/2014 06:00 AM, Peng Haitao wrote:
> The functions regcomp() and regexec() are thread safe with exceptions.
> The functions regerror and regfree() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/regex.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/regex.3 b/man3/regex.3
> index bee47b1..32b6b56 100644
> --- a/man3/regex.3
> +++ b/man3/regex.3
> @@ -301,6 +301,25 @@ The regex routines ran out of memory.
>  .TP
>  .B REG_ESUBREG
>  Invalid back reference to a subexpression.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw20 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR regcomp (),
> +.BR regexec ()
> +T}	Thread safety	MT-Safe locale
> +T{
> +.BR regerror ()
> +T}	Thread safety	MT-Safe env
> +T{
> +.BR regfree ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  POSIX.1-2001.
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
