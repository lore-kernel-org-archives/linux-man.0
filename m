From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setaliasent.3: ATTRIBUTES: Note functions that are/aren't
 thread-safe
Date: Fri, 12 Jun 2015 21:41:26 +0200
Message-ID: <557B35E6.8030406@gmail.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433988270-8599-10-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-10-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/2015 04:04 AM, Zeng Linggang wrote:
> After research, We think
> * setaliasent(),
> * endaliasent(),
> * getaliasent_r(),
> * getaliasbyname_r(),
> are thread-safe. And
> * getaliasent(),
> * getaliasbyname(),
> are not thread-safe. But, there are not
> markings of them in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/setaliasent.3 | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/man3/setaliasent.3 b/man3/setaliasent.3
> index d78fd43..c8dd7d3 100644
> --- a/man3/setaliasent.3
> +++ b/man3/setaliasent.3
> @@ -98,6 +98,26 @@ The default alias database is the file
>  This can be changed in the
>  .I /etc/nsswitch.conf
>  file.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw19 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR setaliasent (),
> +.BR endaliasent (),
> +.BR getaliasent_r (),
> +.BR getaliasbyname_r ()
> +T}	Thread safety	MT-Safe locale
> +T{
> +.BR getaliasent (),
> +.BR getaliasbyname ()
> +T}	Thread safety	MT-Unsafe
> +.TE
> +
>  .SH CONFORMING TO
>  These routines are glibc-specific.
>  The NeXT system has similar routines:
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
