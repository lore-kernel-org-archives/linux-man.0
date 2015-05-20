From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_setname_np.3: ATTRIBUTES: Note functions that
 are thread-safe
Date: Wed, 20 May 2015 16:16:17 +0200
Message-ID: <555C9731.3010906@gmail.com>
References: <1432116011-10181-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432116011-10181-9-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432116011-10181-9-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/2015 12:00 PM, Zeng Linggang wrote:
> After research, We think pthread_setname_np() and pthread_getname_np()
> are thread-safe. But, there are not markings of pthread_setname_np()
> and pthread_getname_np() in glibc document.
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>


Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael



> ---
>  man3/pthread_setname_np.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/pthread_setname_np.3 b/man3/pthread_setname_np.3
> index b9c0487..ef90fa1 100644
> --- a/man3/pthread_setname_np.3
> +++ b/man3/pthread_setname_np.3
> @@ -99,6 +99,20 @@ then the call may fail with one of the errors described in
>  .BR open (2).
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.12.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw21 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pthread_setname_np (),
> +.BR pthread_getname_np ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  These functions are nonstandard GNU extensions.
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
