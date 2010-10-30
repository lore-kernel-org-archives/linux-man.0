From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: subpage_prot() man page
Date: Sat, 30 Oct 2010 07:17:52 +0200
Message-ID: <AANLkTi=Rrg3OSYYV-g=oYp-eu-RDfdNb5v0CcFVeSyM4@mail.gmail.com>
References: <AANLkTi=GZ5hxhbG7Frak-Hb+PC8=4uXcnBEgpcbCrmPG@mail.gmail.com> <20101026230144.GA30272@brick.ozlabs.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101026230144.GA30272-oklZEfemRj05kJ7NmlRacFaTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Paul,

On Wed, Oct 27, 2010 at 1:01 AM, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> wrot=
e:
> On Sun, Oct 10, 2010 at 07:53:35AM +0200, Michael Kerrisk wrote:
>
>> Paul, would you be willing to review this page for the system call
>> that you added?
>
> Thanks for doing this. =A0It looks fine, with just a couple of small
> comments:

Thanks for checking this over.

>> .SH RETURN VALUE
>> On success,
>> .BR subpage_prot ()
>> returns 0.
>> Otherwise, one of the negated =A0error codes specified below is retu=
rned.
>
> Actually, by the time it gets back out to userland, it follows the
> usual convention for error codes on PowerPC: for an error, the
> positive error code is returned (in r3) with the CR0.SO bit (bit 3 in
> the condition code register) set to indicate error. =A0CR0.S0 is clea=
red
> if there is no error.
>
> So I would just remove the word "negated".

Done.

>> .\" Perhaps we don't need to document this implementation detail:
>> .\"
>> .\" Implicit in this is that the regions of the address space that a=
re
>> .\" protected are switched to use 4k hardware pages rather than 64k
>> .\" hardware pages (on machines with hardware 64k page support).
>> .\" In fact the whole process is switched to use 4k hardware pages w=
hen the
>> .\" subpage_prot system call is used, but this could be improved in =
future
>> .\" to switch only the affected segments.
>
> I'm pretty sure we now only switch the affected segment, not the whol=
e
> process.


Okay -- so I added the text:

[[
Implicit in this is that the regions of the address space that are
protected are switched to use 4-kB hardware pages rather than 64-kB
hardware pages (on machines with hardware 64-kB page support).
]]

but dropped the rest of the text above.

Changes will be in man0-pages-3.30.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
