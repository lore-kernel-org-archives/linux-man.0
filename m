From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sendfile.2: Document more return values
Date: Fri, 11 Dec 2015 19:55:18 +0100
Message-ID: <566B1C16.7020104@gmail.com>
References: <1449820983-17810-1-git-send-email-laurent.georget@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449820983-17810-1-git-send-email-laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Laurent,

On 12/11/2015 09:03 AM, Laurent Georget wrote:
> Signed-off-by: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>

Would you be willing to resubmit this with a commit message that notes how
you determined that each of these errors can occur? (E.g., testing,
reference to kernel source file, etc.)

Thanks,

Michael


> Some return values are not documented in sendfile.2, this patch adds some
> details.
> ---
>  man2/sendfile.2 | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/sendfile.2 b/man2/sendfile.2
> index 93cf7e1..b56365e 100644
> --- a/man2/sendfile.2
> +++ b/man2/sendfile.2
> @@ -136,7 +136,10 @@ Bad address.
>  Descriptor is not valid or locked, or an
>  .BR mmap (2)-like
>  operation is not available for
> -.IR in_fd .
> +.IR in_fd ,
> +or
> +.I count
> +is negative.
>  .TP
>  .B EINVAL
>  .I out_fd
> @@ -153,6 +156,20 @@ Unspecified error while reading from
>  .B ENOMEM
>  Insufficient memory to read from
>  .IR in_fd .
> +.TP
> +.B EOVERFLOW
> +.I count
> +is too large, the operation would result in exceeding the maximum size of either
> +the input file or the output file.
> +.TP
> +.B EPERM
> +Permissions are insufficient for reading from the input file or writing to the
> +output file.
> +.TP
> +.B ESPIPE
> +.I offset
> +is not NULL but the input file is not
> +.BR seek (2)-able.
>  .SH VERSIONS
>  .BR sendfile ()
>  first appeared in Linux 2.2.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
