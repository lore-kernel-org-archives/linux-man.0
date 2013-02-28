From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Add linux specific clock ids
Date: Thu, 28 Feb 2013 15:00:19 +0100
Message-ID: <CAKgNAkgh4y8xcoijt1XOQzz7UCZEAHK9q2G1OAifY-i=ALfQ=A@mail.gmail.com>
References: <20130220170123.GA4969@rei> <CAKgNAki91M-Nor=uGpLj-CdmQ0dmXQC7__MHcg6jhn8brkq3pQ@mail.gmail.com>
 <20130227115840.GB1445@rei>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130227115840.GB1445@rei>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Bohac <jbohac-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Feb 27, 2013 at 12:58 PM,  <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
>> Thanks for these patches. I've applied. Note that I do like to get
>> patches inline, for review purposes (and you can attach them also, if
>> you are worried about mailers breaking something).
>
> Ah, sorry, I've forgotten again.
>
>> Thanks also for including the commit hashes. I think the CLOCK_BOOTIME
>> has should however be 70a08cca1227dc31c784ec930099a4417a06e7d0 and I
>> amended accordingly.
>
> That depends, if I'm not misreading the code, the commit hash I've added
> (7fdd7f) made the clock available via the POSIX clock interface. Which
> is in my opinion the time where it became available to the userspace.
>
> On the other hand both of the commits are from the same rc so this does
> not make any difference for the availability of the clock id and either
> of them is fine.

Good point. I've added a reference to both commits into the source of the page.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
