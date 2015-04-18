From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] glob.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Sat, 18 Apr 2015 20:36:31 +0200
Message-ID: <5532A42F.4010404@gmail.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/16/2015 07:09 AM, Zeng Linggang wrote:
> The markings match glibc markings.


Thanks, Zeng. Applied.

Cheers,

Michael


> glob:     MT-Unsafe race:utent env sig:ALRM timer local
> 
> globfree: MT-Safe
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/glob.3 | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/man3/glob.3 b/man3/glob.3
> index 857dff0..65fc6a8 100644
> --- a/man3/glob.3
> +++ b/man3/glob.3
> @@ -273,6 +273,40 @@ for a read error, and
>  .TP
>  .B GLOB_NOMATCH
>  for no found matches.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw24
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR glob ()
> +T}	Thread safety	T{
> +MT-Unsafe race:utent env
> +.br
> +sig:ALRM timer locale
> +T}
> +T{
> +.BR globfree ()
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
> +.BR glob (3)
> +calls those functions,
> +so we use race:utent to remind users.
>  .SH CONFORMING TO
>  POSIX.2, POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
