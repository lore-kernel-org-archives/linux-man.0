From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Thu, 28 Mar 2013 10:39:27 +0100
Message-ID: <CAKgNAki00AnF6zuQD7wwwbGEAH_A1M2iQ4irvCXnd36=ikfmYw@mail.gmail.com>
References: <20130326170626.GA11360@rei.suse.cz> <CAKgNAkgUN7y8j2Gp8sG6hvHMJ=YBV3FGWg=EYj5X1Fg+njNysA@mail.gmail.com>
 <20130328093501.GA5788@rei.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130328093501.GA5788-J5syqNJeCN7twjQa/ONI9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Mar 28, 2013 at 10:35 AM,  <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
>> > This patch adds two missing manual pages.
>> >
>> > I've tried to format them in accordance with
>> > Linux man-pages project. If these are acked
>> > I'll reformat the rest of the io_* system call
>> > wrappers man pages to match.
>>
>> So, here's what I'm not clear on. AFAIK, the io_setup() wrapper (and
>> the other io_*() wrappers) is provided in libaio, right? And libaio is
>> a completely separate package from glibc, right?
>>
>> The man-pages project documents the Linux syscall and glibc APIs, so
>> if my understanding above is correct, then these io_*(3) pages belong
>> in the libaio package, not in in man-pages. Could you or Jeff clarify?
>
> You are 100% right and we both got it the first time you said this. I've
> simply CCed you so that you can have a quick look at the pages and say
> if they have all the information they should have before they got
> included into libaio.

Ahh -- sorry, I misunderstood. I thought you were proposing to include
them into man-pages.

I'll go back and look at the pages and make a few comments.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
