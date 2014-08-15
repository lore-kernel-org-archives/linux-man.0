From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] core.5: fix memory leak in example
Date: Fri, 15 Aug 2014 20:56:53 +0200
Message-ID: <53EE57F5.3060209@gmail.com>
References: <1406973777-3078-1-git-send-email-rahulbedarkar89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406973777-3078-1-git-send-email-rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/02/2014 12:02 PM, Rahul Bedarkar wrote:
> close opened file at the end

Thanks, Rahul. Applied.

Cheers,

Michael




> Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man5/core.5 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man5/core.5 b/man5/core.5
> index 074add6..f2c3e36 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -422,6 +422,7 @@ main(int argc, char *argv[])
>          tot += nread;
>      fprintf(fp, "Total bytes in core dump: %d\\n", tot);
>  
> +    fclose(fp);
>      exit(EXIT_SUCCESS);
>  }
>  .fi
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
