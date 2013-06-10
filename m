From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small fix for fallocate.2
Date: Mon, 10 Jun 2013 10:01:24 +0200
Message-ID: <51B587D4.8090005@gmail.com>
References: <20130609121352.18a390a7@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130609121352.18a390a7-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/09/13 10:13, Yuri Kozlov wrote:
> Hello.

Thanks, Yuri. Applied.

Cheers,

Michael



> --- fallocate.2 2013-06-06 21:38:12.037409549 +0400
> +++ /tmp/fallocate.2    2013-06-09 12:12:52.935899273 +0400
> @@ -110,7 +110,7 @@
>  .BR FALLOC_FL_PUNCH_HOLE ;
>  if a file system doesn't support the operation, an error is returned.
>  .SH RETURN VALUE
> -On error,
> +On success,
>  .BR fallocate ()
>  returns zero.
>  On error, \-1 is returned and
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
