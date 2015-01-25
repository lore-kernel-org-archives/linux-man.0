From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: Add git commit references
Date: Sun, 25 Jan 2015 20:37:13 +0100
Message-ID: <54C545E9.1010504@gmail.com>
References: <alpine.DEB.2.11.1501231255420.15389@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1501231255420.15389-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Vince,

On 01/23/2015 06:58 PM, Vince Weaver wrote:
> 
> I noticed you were adding git commit references to the various
> Linux version markers.
> 
> This adds git commit references for all Linux kernel version
> notes in perf_event_open.2

Thanks for this. It's really helpful! I've applied this patch, but 
see the comment below about two pieces that I backed out of the patch.

> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 27885f3..e91ef21 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
[...]

> +Refreshing an event group leader refreshes all siblings,
> +and refreshing with a parameter of 0 enables infinite refresh.
> +This behavior is unsupported and should not be relied on.
> +.\" See https://lkml.org/lkml/2011/5/24/337

The piece above really should be a separate patch. I've backed this piece 
of the patch out. Could you send me another patch with this change and a
suitable commit message.

[...]

> -In older Linux 2.6 versions,
> -refreshing an event group leader refreshed all siblings,
> -and refreshing with a parameter of 0 enabled infinite refresh.
> -This behavior is unsupported and should not be relied on.

The piece above really should be a separate patch (assuming it was 
intentional). I've backed this piece of your patch out. Assuming
you intended this change, could you send me another patch with this
change and a suitable commit message. I'd prefer to keep this
historical info in the page, with a statement about when (which
kernel version) it ceased to be true. But if that's too troublesome,
I will also just take a patch that deletes the text.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
