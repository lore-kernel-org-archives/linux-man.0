From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getspnam.3: ATTRIBUTES: Note functions that are/aren't
 thread-safe
Date: Fri, 11 Sep 2015 12:06:36 +0200
Message-ID: <55F2A7AC.2020402@gmail.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1440411596-2566-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/24/2015 12:19 PM, Zeng Linggang wrote:
> After research, We think
> * getspnam(),
> * getspent(),
> * setspent(),
> * endspent(),
> * getspent_r(),
> * fgetspent(),
> * sgetspent(),
> are not thread-safe. And
> * putspent(),
> * getspnam_r(),
> * sgetspent_r(),
> * lckpwdf(),
> * ulckpwdf(),
> * fgetspent_r(),
> are thread-safe. But, there are not
> markings of them in glibc document.

Applied!  Thanks, Zeng Linggang.

Cheers,

Michael

> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getspnam.3 | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/man3/getspnam.3 b/man3/getspnam.3
> index 43ee61c..9efd643 100644
> --- a/man3/getspnam.3
> +++ b/man3/getspnam.3
> @@ -246,6 +246,66 @@ The include file
>  defines the constant
>  .B _PATH_SHADOW
>  to the pathname of the shadow password file.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw25 lb lbw30
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getspnam ()
> +T}	Thread safety	T{
> +MT-Unsafe race:getspnam locale
> +T}
> +T{
> +.BR getspent ()
> +T}	Thread safety	T{
> +MT-Unsafe race:getspent
> +.br
> +race:spentbuf locale
> +T}
> +T{
> +.BR setspent (),
> +.BR endspent (),
> +.br
> +.BR getspent_r ()
> +T}	Thread safety	T{
> +MT-Unsafe race:getspent locale
> +T}
> +T{
> +.BR fgetspent ()
> +T}	Thread safety	MT-Unsafe race:fgetspent
> +T{
> +.BR sgetspent ()
> +T}	Thread safety	MT-Unsafe race:sgetspent
> +T{
> +.BR putspent (),
> +.BR getspnam_r (),
> +.br
> +.BR sgetspent_r ()
> +T}	Thread safety	MT-Safe locale
> +T{
> +.BR lckpwdf (),
> +.BR ulckpwdf (),
> +.br
> +.BR fgetspent_r ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
> +In the above table,
> +.I getspent
> +in
> +.I race:getspent
> +signifies that if any of the functions
> +.BR setspent (3),
> +.BR getspent (3),
> +.BR getspent_r (3),
> +or
> +.BR endspent (3)
> +are used in parallel in different threads of a program,
> +then data races could occur.
>  .SH CONFORMING TO
>  The shadow password database and its associated API are
>  not specified in POSIX.1.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
