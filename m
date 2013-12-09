From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for catopen.3
Date: Sun, 08 Dec 2013 21:20:50 -0800
Message-ID: <52A55332.6020205@gmail.com>
References: <20131116090205.4f68c6b5@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131116090205.4f68c6b5-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/15/13 21:02, Yuri Kozlov wrote:
> Hello.

Thanks. Applied.

Cheers,

Michael


> --- man-pages/man3/catopen.3    2013-10-12 09:15:00.453223138 +0400
> +++ /tmp/catopen.3      2013-11-16 09:00:57.569348344 +0400
> @@ -52,7 +52,7 @@
>  specifies the name of the message catalog to be opened.
>  If
>  .I name
> -specifies and absolute path (i.e., contains a \(aq/\(aq),
> +specifies an absolute path (i.e., contains a \(aq/\(aq),
>  then
>  .I name
>  specifies a pathname for the message catalog.
> 



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
