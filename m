From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getline.3: fix memory leak in example
Date: Fri, 01 Aug 2014 21:56:47 +0200
Message-ID: <53DBF0FF.4010708@gmail.com>
References: <1406912855-8085-1-git-send-email-rahulbedarkar89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406912855-8085-1-git-send-email-rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/01/2014 07:07 PM, Rahul Bedarkar wrote:
> close opened file at the end

Applied. Thanks!

Cheers,

Michael


> Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/getline.3 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man3/getline.3 b/man3/getline.3
> index c0b77d3..4b9c452 100644
> --- a/man3/getline.3
> +++ b/man3/getline.3
> @@ -167,6 +167,7 @@ main(void)
>      }
>  
>      free(line);
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
