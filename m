From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: setcap effect on core-ing
Date: Mon, 19 Jan 2015 12:26:17 +0100
Message-ID: <54BCE9D9.7030905@gmail.com>
References: <1420918763071.7646@biochem.wustl.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420918763071.7646-FlrxmZY35Ulwzw07of529odd74u8MsAO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "McConnaughey, Bill" <mcconnau-FlrxmZY35Ulwzw07of529odd74u8MsAO@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Bill,

On 01/10/2015 08:39 PM, McConnaughey, Bill wrote:
> I stumbled on this: when I do setcap on my exe, it will no longer make a core 
> unless I put in
> 
> prctl( PR_SET_DUMPABLE, 1 );
> 
> 
> Appropriate places to remark on this might be:
> 
> 
> man 5 core
>    in the paragraph starting "the process is executing a set-user-ID ..."
> 
> man 2 prctl
>    in the paragraph for PR_SET_DUMPABLE
> 
> man 8 setcap

Thanks for the report. I've add some text to both of these pages.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
