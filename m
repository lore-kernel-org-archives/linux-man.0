From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] console_codes.4: Add missing escape sequence
Date: Tue, 03 Mar 2015 08:11:30 +0100
Message-ID: <54F55EA2.8020103@gmail.com>
References: <alpine.LNX.2.11.1502270231140.723@localhost> <54F01D8B.6090501@gmail.com> <alpine.LNX.2.11.1502271409270.274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.11.1502271409270.274@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scot Doyle <lkml14-enLWO88E2pdl57MIdRCFDg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/27/2015 03:32 PM, Scot Doyle wrote:
> On Fri, 27 Feb 2015, Michael Kerrisk (man-pages) wrote:
>> Hello Scott,
>>
>> On 02/27/2015 03:35 AM, Scot Doyle wrote:
>>> An undocumented escape sequence in drivers/tty/vt/vt.c brings the
>>> previously accessed virtual terminal to the foreground.
>>
>> Thanks. Applied. Looks like this sequence appeared with ~2.6.0 or so.
>> Do you know if this is so?
>>
>> Cheers,
>>
>> Michael
> 
> "git log -p -- drivers/char/vt.c" shows that it's included in the initial 
> 2005 git commit. Is there an easier way to view early kernel history than 
> digging through kernel tarballs?

Tarballs is what I use in such cases... (And what I did in this case...)

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
