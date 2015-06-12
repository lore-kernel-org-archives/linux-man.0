From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getrpcent.3: ATTRIBUTES: Note functions that are/aren't
 thread-safe
Date: Fri, 12 Jun 2015 21:39:32 +0200
Message-ID: <557B3574.2000101@gmail.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433988270-8599-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/2015 04:04 AM, Zeng Linggang wrote:
> After research, We think
> * setrpcent(),
> * endrpcent(),
> are thread-safe. And
> * getrpcent(),
> * getrpcbyname(),
> * getrpcbynumber(),
> are not thread-safe. But, there are not
> markings of them in glibc document.

Thanks, Zeng Linggang. Applied.

Cheers,

Michael

> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getrpcent.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/getrpcent.3 b/man3/getrpcent.3
> index ef4311f..8bf9e51 100644
> --- a/man3/getrpcent.3
> +++ b/man3/getrpcent.3
> @@ -99,6 +99,25 @@ NULL is returned on EOF or error.
>  .TP
>  .I /etc/rpc
>  RPC program number database.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw17 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getrpcent (),
> +.BR getrpcbyname (),
> +.BR getrpcbynumber ()
> +T}	Thread safety	MT-Unsafe
> +T{
> +.BR setrpcent (),
> +.BR endrpcent ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on the BSDs, Solaris, and many other systems.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
