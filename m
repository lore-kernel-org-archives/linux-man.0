From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] wait4.2: Add a note that these functions are deprecated
Date: Sun, 23 Sep 2012 16:34:36 +0200
Message-ID: <CAKgNAkiHYrerfCDab8UFrFZbqd=jEBXScLjM2j7LHAJHLnNhmg@mail.gmail.com>
References: <20120918210116.GA22808@bunk.dyndns.info> <CAKgNAkiiNGhVRi-ddBA2t8tdZMRq_rrJWEAumVyXikZCzCW1UA@mail.gmail.com>
 <20120923142425.GC13319@bunk.dyndns.info>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120923142425.GC13319-c9qLp6CXzmZPEsXTsnYjsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Adrian,

On Sun, Sep 23, 2012 at 4:24 PM, Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Sep 23, 2012 at 04:02:27PM +0200, Michael Kerrisk (man-pages) wrote:
>> Adrian,
>
> Hi Michael,
>
>> I think the idea of your patch is good, but I prefer to use a word
>> other than "deprecated". The problem is that "deprecated" implies a
>> standards body or a vendor made a formal statement about this. It's
>> true that LSB 2.1 says that wait3() is deprecated
>> (http://refspecs.linuxbase.org/LSB_2.1.0/LSB-generic/LSB-generic/baselib-wait3-3.html),
>> but wait4() is currently still part of LSB. So, I applied a slightly
>>
>> modified version of your test:
>>
>> [[
>> These functions are nonstandard; use
>>
>> .BR waitpid (2)
>> or
>> .BR waitid (2)
>> in new programs.
>> ]]
>>
>> Seem okay?
>
> the wait3() function is not "nonstandard, since as the URL you gave
> correctly states it is part of SuSv2 (and also of SuSv1).

Yep, but marked LEGACY in SUSv2, and removed altogether in SUSv3. So,
not part of contemporary standard. (BTW, I did also add text under
CONFORMING TO to note those details.) So, I think I'll leave the text
as I gave already, unless you have a better alternative to propose.

Cheers,

Michael


>> On Tue, Sep 18, 2012 at 11:01 PM, Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > ---
>> >  man2/wait4.2 |    7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/man2/wait4.2 b/man2/wait4.2
>> > index 68e49ad..3548396 100644
>> > --- a/man2/wait4.2
>> > +++ b/man2/wait4.2
>> > @@ -31,7 +31,7 @@
>> >  .\"    Rewrote much of this page, and removed much duplicated text,
>> >  .\"            replacing with pointers to wait.2
>> >  .\"
>> > -.TH WAIT4 2  2010-09-20 "Linux" "Linux Programmer's Manual"
>> > +.TH WAIT4 2  2012-09-18 "Linux" "Linux Programmer's Manual"
>> >  .SH NAME
>> >  wait3, wait4 \- wait for process to change state, BSD style
>> >  .SH SYNOPSIS
>> > @@ -150,10 +150,15 @@ On Linux,
>> >  is a library function implemented on top of the
>> >  .BR wait4 ()
>> >  system call.
>> > +
>> > +These functions are deprecated (not in POSIX.1-2001), use
>> > +.BR waitpid (2)
>> > +in new programs.
>> >  .SH "SEE ALSO"
>> >  .BR fork (2),
>> >  .BR getrusage (2),
>> >  .BR sigaction (2),
>> >  .BR signal (2),
>> >  .BR wait (2),
>> > +.BR waitpid (2),
>> >  .BR signal (7)
>> > --
>> > 1.7.10.4



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
