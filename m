From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getservent.3: ATTRIBUTES: Note functions that aren't
 thread-safe
Date: Fri, 12 Jun 2015 21:26:59 +0200
Message-ID: <557B3283.8090805@gmail.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433326594-25001-6-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-6-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/03/2015 12:16 PM, Zeng Linggang wrote:
> The marking matches glibc marking.
> markings of functions in glibc are:
> - getservent:    MT-Unsafe race:servent race:serventbuf locale
> 
> - getservbyname: MT-Unsafe race:servbyname locale
> 
> - getservbyport: MT-Unsafe race:servbyport locale
> 
> - setservent:    MT-Unsafe race:servent locale
> - endservent:    MT-Unsafe race:servent locale


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getservent.3 | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/man3/getservent.3 b/man3/getservent.3
> index c229053..a475b2e 100644
> --- a/man3/getservent.3
> +++ b/man3/getservent.3
> @@ -154,6 +154,57 @@ error occurs or the end of the file is reached.
>  .TP
>  .I /etc/services
>  services database file
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw15 lb lbw25
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getservent ()
> +T}	Thread safety	T{
> +MT-Unsafe race:servent
> +.br
> +race:serventbuf locale
> +T}
> +T{
> +.BR getservbyname ()
> +T}	Thread safety	T{
> +MT-Unsafe race:servbyname
> +.br
> +locale
> +T}
> +T{
> +.BR getservbyport ()
> +T}	Thread safety	T{
> +MT-Unsafe race:servbyport
> +.br
> +locale
> +T}
> +T{
> +.BR setservent (),
> +.br
> +.BR endservent ()
> +T}	Thread safety	T{
> +MT-Unsafe race:servent
> +.br
> +locale
> +T}
> +.TE
> +
> +In the above table,
> +.I servent
> +in
> +.I race:servent
> +signifies that if any of the functions
> +.BR setservent (3),
> +.BR getservent (3),
> +or
> +.BR endservent (3)
> +are used in parallel in different threads of a program,
> +then data races could occur.
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
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
