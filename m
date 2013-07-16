From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gets: note that glibc 2.16 has removed the definition
 of gets()
Date: Tue, 16 Jul 2013 08:22:19 +0200
Message-ID: <51E4E69B.7070208@gmail.com>
References: <1373647368-12099-1-git-send-email-shawnlandden@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373647368-12099-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Shawn

This isn't really correct. See the CONFORMING TO section in the man-page.

Cheers,

Michael


On 07/12/13 18:42, Shawn Landden wrote:
> ---
>  man3/gets.3 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/gets.3 b/man3/gets.3
> index 85747ef..bd65b9c 100644
> --- a/man3/gets.3
> +++ b/man3/gets.3
> @@ -162,7 +162,9 @@ it is extremely dangerous to use.
>  It has been used to break computer security.
>  Use
>  .BR fgets ()
> -instead.
> +instead. glibc 2.16 does not define
> +.BR gets ()
> +.
>  .PP
>  It is not advisable to mix calls to input functions from the
>  .I stdio
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
