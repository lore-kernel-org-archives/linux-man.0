From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for regex.3
Date: Tue, 07 Jan 2014 00:47:39 +1300
Message-ID: <52CA97DB.6020309@gmail.com>
References: <20140106132435.31301ebf@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140106132435.31301ebf-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/14 22:24, Yuri Kozlov wrote:
> Hello.

Thanks. I applied.

Cheers,

Michael


> --- man-pages-git/man3/regex.3  2013-10-12 09:11:41.585233073 +0400
> +++ /tmp/regex.3        2014-01-06 13:22:08.015053318 +0400
> @@ -146,7 +146,7 @@
>  The match-beginning-of-line operator always fails to match (but see the
>  compilation flag
>  .B REG_NEWLINE
> -above)
> +above).
>  This flag may be used when different portions of a string are passed to
>  .BR regexec ()
>  and the beginning of the string should not be interpreted as the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
