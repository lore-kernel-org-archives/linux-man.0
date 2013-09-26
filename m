From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cproj.3: wfix
Date: Thu, 26 Sep 2013 15:16:31 +0200
Message-ID: <524433AF.40802@gmail.com>
References: <1379474162-6939-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379474162-6939-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 18.09.2013 05:16, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks. Applied.

Cheers,

Michael


> ---
>  man3/cproj.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/cproj.3 b/man3/cproj.3
> index 8f70462..9c88dd4 100644
> --- a/man3/cproj.3
> +++ b/man3/cproj.3
> @@ -18,7 +18,7 @@ cproj, cprojf, cprojl \- project into Riemann Sphere
>  .sp
>  Link with \fI\-lm\fP.
>  .SH DESCRIPTION
> -This function projects a point in the plane onto the surface of a
> +These functions project a point in the plane onto the surface of a
>  Riemann Sphere, the one-point compactification of the complex plane.
>  Each finite point
>  .I z
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
http://blog.man7.org/2013/09/linuxunix-system-programming-course.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
