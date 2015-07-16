From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] xdr.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 17 Jul 2015 00:04:52 +0200
Message-ID: <55A82A84.5070701@gmail.com>
References: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1435138119-30051-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435138119-30051-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/24/2015 11:28 AM, Zeng Linggang wrote:
> After research, We think
> xdr_array(), xdr_bool(),
> xdr_bytes(), xdr_char(),
> xdr_destroy(), xdr_double(),
> xdr_enum(), xdr_float(),
> xdr_free(), xdr_getpos(),
> xdr_inline(), xdr_int(),
> xdr_long(), xdrmem_create(),
> xdr_opaque(), xdr_pointer(),
> xdrrec_create(), xdrrec_eof(),
> xdrrec_endofrecord(),
> xdrrec_skiprecord(),
> xdr_reference(), xdr_setpos(),
> xdr_short(), xdrstdio_create(),
> xdr_string(), xdr_u_char(),
> xdr_u_int(), xdr_u_long(),
> xdr_u_short(), xdr_union(),
> xdr_vector(), xdr_void(),
> xdr_wrapstring(),
> are thread-safe. But, there are not
> markings of them in glibc document.


Thanks, Zeng Linggang. Applied. 

Cheers,

Michael



> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/xdr.3 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/man3/xdr.3 b/man3/xdr.3
> index 0e2d939..2b83694 100644
> --- a/man3/xdr.3
> +++ b/man3/xdr.3
> @@ -545,6 +545,68 @@ routines as arguments, and
>  .BR xdr_string (),
>  one of the most frequently used primitives, requires three.
>  Returns one if it succeeds, zero otherwise.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw31 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR xdr_array (),
> +.BR xdr_bool (),
> +.br
> +.BR xdr_bytes (),
> +.BR xdr_char (),
> +.br
> +.BR xdr_destroy (),
> +.BR xdr_double (),
> +.br
> +.BR xdr_enum (),
> +.BR xdr_float (),
> +.br
> +.BR xdr_free (),
> +.BR xdr_getpos (),
> +.br
> +.BR xdr_inline (),
> +.BR xdr_int (),
> +.br
> +.BR xdr_long (),
> +.BR xdrmem_create (),
> +.br
> +.BR xdr_opaque (),
> +.BR xdr_pointer (),
> +.br
> +.BR xdrrec_create (),
> +.BR xdrrec_eof (),
> +.br
> +.BR xdrrec_endofrecord (),
> +.br
> +.BR xdrrec_skiprecord (),
> +.br
> +.BR xdr_reference (),
> +.BR xdr_setpos (),
> +.br
> +.BR xdr_short (),
> +.BR xdrstdio_create (),
> +.br
> +.BR xdr_string (),
> +.BR xdr_u_char (),
> +.br
> +.BR xdr_u_int (),
> +.BR xdr_u_long (),
> +.br
> +.BR xdr_u_short (),
> +.BR xdr_union (),
> +.br
> +.BR xdr_vector (),
> +.BR xdr_void (),
> +.br
> +.BR xdr_wrapstring ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH SEE ALSO
>  .BR rpc (3)
>  .LP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
