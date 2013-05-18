From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small fix for uri.7
Date: Sat, 18 May 2013 20:51:51 +0200
Message-ID: <5197CDC7.1050302@gmail.com>
References: <20130514185250.2dde706c@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130514185250.2dde706c-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/14/13 16:52, Yuri Kozlov wrote:
> Hello.
> 
> --- uri.7       2013-05-14 18:49:15.582908969 +0400
> +++ uri-new.7   2013-05-14 18:50:06.158906925 +0400
> @@ -268,7 +268,7 @@
>  .PP
>  This represents a file or directory accessible locally.
>  As a special case,
> -.I host
> +.I ip_server
>  can be the string "localhost" or the empty
>  string; this is interpreted as "the machine from which the URL is
>  being interpreted".

Thanks, Yuri. Applied.

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
