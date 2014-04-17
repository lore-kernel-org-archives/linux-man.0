From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] crypt(3): use real dashes in regex
Date: Thu, 17 Apr 2014 22:09:34 +0200
Message-ID: <CAKgNAkji6aA3Jo0PL2uq_fJewtS+cvOrX7AbO53j15xY-kCS8g@mail.gmail.com>
References: <1397756918-16350-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkh4yU=nnEVoWA0g36bQovg6csR-ik54Z0FT3Q53Hrn8-g@mail.gmail.com> <3245891.ebzCqChYRm@vapier>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3245891.ebzCqChYRm@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 17, 2014 at 9:55 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Thu 17 Apr 2014 21:22:31 Michael Kerrisk wrote:
>> On Thu, Apr 17, 2014 at 7:48 PM, Mike Frysinger wrote:
>> > I don't think rendering the dashes in the regex expression as the en
>> > style makes sense.  This is a literal regex, so use literal dashes.
>>
>> I agree, but it looks like your patch is inconsistent. But you use
>> '\-' in one part of the patch (right), and just '-' in the other part.
>> How come?
>
> i wrote the two hunks on different days.  iiuc, they should all be \-.

:-) Okay -- I'll fix.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
