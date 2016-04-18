From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Mon, 18 Apr 2016 13:57:54 +0100
Message-ID: <5714D9D2.8050501@gmail.com>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
 <20160416045058.GS6588@vapier.lan>
 <20160416183013.352f4ba6.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160416183013.352f4ba6.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/16/2016 05:30 PM, Alexander Miller wrote:
> On Sat, 16 Apr 2016 00:50:58 -0400
> Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> 
>> imo, we should just drop all compression support.  distros already
>> handle this properly and pick whatever they want/need.
> 
> For distros this is useless, of course. I've never used it either.
> But I guess there are still people installing stuff from sources
> without using a package manager, and they might find it convenient.
> 
>>  if no one
>> is using this code, then it's just sucking up space.
> 
> I'm not concerned about the space, but code needs to be maintained.
> IMO, as long as it works, we can keep it; if it has issues we'd
> better remove it.
> 
> We can drop compression support or do it right - I'm fine with
> either option. We shouldn't keep the status quo, though.

I'm inclined to say drop it. Would you mind putting together a 
patch, Alex?

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
