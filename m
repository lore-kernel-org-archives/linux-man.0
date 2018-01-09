From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] recvmmsg.2, sendmmsg.2: point out that error handling
 is unreliable
Date: Tue, 09 Jan 2018 14:10:41 +0100
Message-ID: <1515503441.3260.37.camel@redhat.com>
References: <1509023167.2859.2.camel@redhat.com>
         <69ba335d-c0d4-d032-6d92-1467214653cb@gmail.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69ba335d-c0d4-d032-6d92-1467214653cb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 2018-01-09 at 00:39 +0100, Michael Kerrisk (man-pages) wrote:
> I am not sure that I understand that last sentence. Do you mean something
> like:
> 
>     The caller can retry the transmission, starting at first failed message,
>     but there is no guarantee that, if an error is returned, it will be the
>     same error as the one that was lost on the previous call.
> 
> ?
> 

Hello Michael,

yes, that's exactly what I meant. I'll update and re-send the patch.

Thanks,
Nikola
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
