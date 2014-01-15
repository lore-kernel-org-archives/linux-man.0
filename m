From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for recno.3
Date: Wed, 15 Jan 2014 17:17:14 +1300
Message-ID: <52D60BCA.5060208@gmail.com>
References: <20140114202727.2e922c9e@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140114202727.2e922c9e-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael


On 01/15/2014 05:27 AM, Yuri Kozlov wrote:
> Hello.
> 
> --- recno.3     2013-10-12 09:11:41.585233073 +0400
> +++ /tmp/recno.3        2014-01-14 20:26:13.867829543 +0400
> @@ -186,7 +186,7 @@
>  .I data
>  field of the key should be a pointer to a memory location of type
>  .IR recno_t ,
> -as defined in th
> +as defined in the
>  .I <db.h>
>  include file.
>  This type is normally the largest unsigned integral type available to
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
