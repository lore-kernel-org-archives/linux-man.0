From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fanotify_mark.2: tfix fixed
Date: Sun, 08 Jun 2014 21:16:54 +0200
Message-ID: <5394B6A6.1040508@gmail.com>
References: <20140608184751.4837450e@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140608184751.4837450e-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael

On 06/08/2014 04:47 PM, Yuri Kozlov wrote:
> Hello.
> 
> Sorry, corrected version:
> 
> --- a/man2/fanotify_mark.2
> +++ b/man2/fanotify_mark.2
> @@ -326,7 +326,7 @@ event.
>  If
>  .BR fanotify_mark (2)
>  is called with
> -.B FAN_MARK_FLUSH,
> +.BR FAN_MARK_FLUSH ,
>  .I flags
>  is not checked for invalid values.
>  .SH SEE ALSO
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
