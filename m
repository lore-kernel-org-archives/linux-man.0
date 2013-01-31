From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Thu, 31 Jan 2013 01:50:49 +0100
Message-ID: <CAKgNAkiQsWWWTfLWeixN5+GcwkfP6UX+AYdL4HY6beq7rdpUxw@mail.gmail.com>
References: <1695270.M7m4ekngnN@storm>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1695270.M7m4ekngnN@storm>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thomas,

Could you supply some explanation of why you think this patch is required?

Thanks,

Michael

On Tue, Jan 29, 2013 at 5:24 PM, Thomas Jarosch
<thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org> wrote:
>
> Signed-off-by: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
> ---
>  man3/fclose.3 | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/man3/fclose.3 b/man3/fclose.3
> index 1bdf0a5..6945e89 100644
> --- a/man3/fclose.3
> +++ b/man3/fclose.3
> @@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for example, with
>  .BR sync (2)
>  or
>  .BR fsync (2).
> +Also it's undefined behavior to call
> +.BR fclose ()
> +with a NULL pointer.
> +
>  .SH "SEE ALSO"
>  .BR close (2),
>  .BR fcloseall (3),
> --
> 1.7.11.7
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
