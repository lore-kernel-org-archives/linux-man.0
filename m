From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for confstr.3
Date: Sun, 08 Dec 2013 21:31:28 -0800
Message-ID: <52A555B0.4070902@gmail.com>
References: <20131109124343.1dfb7e9b@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131109124343.1dfb7e9b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/09/13 00:43, Yuri Kozlov wrote:
> Hello.

Thanks. Applied.

Cheers,

Michael


> --- man-pages-git/man3/confstr.3        2013-03-23 18:21:19.545674858 +0400
> +++ /tmp/confstr.3      2013-11-09 12:37:12.972060495 +0400
> @@ -121,7 +121,7 @@
>  .SH ERRORS
>  .TP
>  .B EINVAL
> -If the value of
> +The value of
>  .I name
>  is invalid.
>  .SH CONFORMING TO
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
