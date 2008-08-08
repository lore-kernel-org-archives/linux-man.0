From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [manpages]: Version 2 of a udplite(7) manpage
Date: Fri, 8 Aug 2008 18:59:21 +0200
Message-ID: <cfd18e0f0808080959i13896ebfj9685892aaa02e678@mail.gmail.com>
References: <Pine.LNX.4.64.0806171344370.25191@shark.he.net>
	 <20080624133625.GA16424@gerrit.erg.abdn.ac.uk>
	 <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9@mail.gmail.com>
	 <20080630112751.GB5040@gerrit.erg.abdn.ac.uk>
	 <cfd18e0f0806300603g38cc4222r37996404390dfcbf@mail.gmail.com>
	 <cfd18e0f0807160810p7d40e3bbpe150d695aca8c5ea@mail.gmail.com>
	 <20080718110923.GA12919@gerrit.erg.abdn.ac.uk>
	 <20080723154017.GA14244@gerrit.erg.abdn.ac.uk>
	 <489AF9D1.4010403@gmail.com>
	 <57217.148.187.160.35.1218193536.squirrel@148.187.160.35>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57217.148.187.160.35.1218193536.squirrel-Uy33jJmzxvb8W20QDElj1A@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Restored linux-man to CC]

Hi Gerrit,

On Fri, Aug 8, 2008 at 1:05 PM,  <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org> wrote:
> Hi Michael,
>
>> I made one or two small edits.  The most notable
>> is that I changed PF_INET to AF_INET in the SYNOPSIS.  (As fas as POSIX.1
>> is concerned, the PF_* constants are obsolete, in favour of the AF_*
>> constants with the same value.)  I think we're good to go otherwise, and
>> I'll include this page in man-pages-3.07, unless you think some further
>> work still needs to be done.
>>
> I can't think of further work items at the moment.

Good.  udplite.7 will be in man-pages-3.07.  Thanks for writing it!

> Thank you for the AF/PF
> clarification, something which continues to confuse me (and likely others).
>
> Since I copied the example from udp(7), would it make sense to extend this
> update to that manpage as well? A quick check in tcp(7) and ip(7), raw(7),
> socket(7) showed that somehow the AF/PF ambiguity appears in other places
> as well (netlink(7) is likely not Posix).

Yes, it's been one of those nagging little tasks I've been meaning to
do for a while.  (My reluctance has been in part about whether I
should "erase history" -- the pseudo-distinction between AF_ and PF_
is longstanding, but has also been meaningless since the beginning.)
So, you're comment finally prompted me to do it.  In man-pages-3.07,
everything is now AF_*.

Thanks

Michael




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
