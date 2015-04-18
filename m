From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wordexp.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Sat, 18 Apr 2015 20:36:41 +0200
Message-ID: <5532A439.1030701@gmail.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429160978-15236-7-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-7-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/16/2015 07:09 AM, Zeng Linggang wrote:
> The markings match glibc markings.

Thanks, Zeng. Applied.

Cheers,

Michael


> wordexp:  MT-Unsafe race:utent const:env env sig:ALRM timer locale
> 
> wordfree: MT-Safe
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wordexp.3 | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/man3/wordexp.3 b/man3/wordexp.3
> index 4d352cb..a38c931 100644
> --- a/man3/wordexp.3
> +++ b/man3/wordexp.3
> @@ -184,6 +184,40 @@ unmatched quotes.
>  and
>  .BR wordfree ()
>  are provided in glibc since version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw30
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR wordexp ()
> +T}	Thread safety	T{
> +MT-Unsafe race:utent const:env
> +.br
> +env sig:ALRM timer locale
> +T}
> +T{
> +.BR wordfree ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
> +In the above table,
> +.I utent
> +in
> +.I race:utent
> +signifies that if any of the functions
> +.BR setutent (3),
> +.BR getutent (3),
> +or
> +.BR endutent (3)
> +are used in parallel in different threads of a program,
> +then data races could occur.
> +.BR wordexp (3)
> +calls those functions,
> +so we use race:utent to remind users.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH EXAMPLE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
