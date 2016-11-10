From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Thu, 10 Nov 2016 12:29:34 +0100
Message-ID: <94110a82-30ca-3be2-d010-0f6ee04d4c3b@gmail.com>
References: <20160426165847.5804.qmail@ns.horizon.com>
 <8a990d27-1fc2-8358-f9d3-c9474d6d8616@gmail.com>
 <1478766102.2642.12.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478766102.2642.12.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Nikos,

On 11/10/2016 09:21 AM, Nikos Mavrogiannopoulos wrote:
> On Wed, 2016-11-09 at 16:26 +0100, Michael Kerrisk (man-pages) wrote:
>> Hello Nikos,
>>
>> This was the mail from George that I just referred to in my 
>> other mail. Is there anything that needs to be covered here?
>> Some specific comments below.
> 
> Hi Michael,
>  I think George and I disagree on what the text would recommend. I'm
> against keeping the existing text which implies (wrongly IMHO) that
> /dev/random should be used for generating keys.
> 
> I attach my reply at the time (I had agreed on George updating the
> manpage and discussing it further - since that didn't happen I'm back
> with an updated proposal).

Was that reply to George offlist? It didn't land in my mailbox, at 
least.

Anyway, thanks for the context. See coming replies re your 
latest patch.

Cheers,

Michael

Message-ID: <1462178545.15353.37.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
To: George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Date: Mon, 02 May 2016 10:42:25 +0200
In-Reply-To: <20160426165847.5804.qmail-HzZAx2gCgqrSUeElwK9/Pw@public.gmane.org>
References: <20160426165847.5804.qmail-HzZAx2gCgqrSUeElwK9/Pw@public.gmane.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2016-04-26 at 12:58 -0400, George Spelvin wrote:

> > If that's about documenting a design goal I'd prefer to move it out
> > of
> > the main text for 2 reasons. (a) There is no practical crypto
> > system
> > using one time pads, thus mentioning it in the main body only
> > creates
> > confusion (b), one time pad is such a theoretical construction that
> > any
> > real algorithm wouldn't implement it.
> The original (removed by your patch) line was:
> -high quality randomness such as one-time pad or key generation.
> It's not the words "one-time pad" I'm attached to, but the specific
> examples of when "high-quality randomness" is required.  A big point
> is
> to teach people *how* to use it, and without those examples, when
> would
> anyone think "my application wants low-quality randomness"?
> 
> You're right that a one-time pad is impractical, but it's still
> a common and familiar pedagogical example, and more importantly
> something that a person wondering which to use can see that their
> application is NOT.
> 
> Your proposed patch *also* deleted the other usage example at the
> end:
> 
> -should be used for everything except long-lived GPG/SSL/SSH keys.
> which really reduces the value of the man page as a guide to people
> who aren't crypto experts.

Well I think that since it contradicts how SSL and SSH keys are
generated in practice it may not be a good example to show. If you
change "should be" to "is intended to be" I may be more sympathetic to
the cause. But then it should also be added "by a user-interacting
application" since the fact that /dev/random has indefinite delays it
makes it unsuitable to generate SSL or SSH keys in an unattended
matter.




> > > The bit about early boot is actually not as much of an issue as
> > > you
> > > think.
> > > 
> > > Even /dev/urandom will stall early on boot until a minimum
> > > initial seed
> > > (128 bits at present) has been acumulated.  (grep for
> > > "urandom_init_wait")
> > 
> > No it will not. We notice often the keys for sshd being generated
> > *before* the kernel logs that the random pool has been
> > initialized.
> H'm... observation definitely trumps theoretical predictions based on
> reading the code.
[...]
> The driver wakes up the sleeping readers *before* printing
> the message.  Is it possible that syslog is just losing the race?

Could be. But then could you point me to the code you are referring to.
I'm certainly interested to figure the issue.


> > > How about something more like (draft, not final edit):
> > > 
> > >  A read from the \fI/dev/urandom\fP device will not block
> > >  waiting for more entropy.
> > > +If the estimated fresh entropy is not sufficient, a
> > > \fI/dev/urandom\fP
> > > +will produce output anyway, relying on the cryptographic
> > > primitives
> > > in
> > > +the driver's pseudo-random number generator to ensure that the
> > > output,
> > > +although correlated with previous output in an information
> > > theoretic
> > > +sense (it exceeds the unicity distance), is secure for all
> > > practical
> > > +purposes.
> > 
> > What is the purpose of this text? To whom does it target?
> To replace the text
> 
> -If there is not sufficient entropy, a pseudorandom number generator
> is used
> -to create the requested bytes.
> 
> or
> 
> +If the estimated fresh entropy is not sufficient, a pseudorandom
> number generator is
> +used to create the requested bytes.
> 
> with something that doesn't imply a mode switch.
> 
> I labelled it "draft" because I wasn't really thrilled with the
> wording,
> myself, but I thought it gave the general idea and wasn't worth
> massaging
> into editorial perfection since it was due to get torn apart anyway.
> 
> Can you think of better wording?  I'm all for keeping it simple, but
> not at the expense of seriously misleading people.

Well by using academic language in a manpage you will certainly mislead
:) since the audience cannot follow. I think the language of the text
should be targeted to the audience, i.e., administrators, developers.
Mentioning information-theoretic correlation will only scare people as
they will believe there is some actual correlation.

Note, that we live with this kind of information theoretic correlation
for our cryptosystems and pretty much for about everything. However it
is not mentioned in any crypto manpage because it will be misunderstood
by the reader (as information-theoretic correlation is far from being
correlation in the everyday sense, and in practice it is not, however
that is not apparent to someone without clear theoretic knowledge).

An internal analysis of the device can be done separately in a
published paper in some reviewed conference/journal (ideally).


> > I wouldn't like to get into such details about the device in the
> > manpage,
> > but if you would like a section studying the theoretical properties
> > of
> > /dev/urandom I'd again suggest to keep it separate and elaborate.
> > What
> > is on the text above is certainly not complete analysis and is
> > certainly
> > not targetting administrators and developers who would like to
> > understand
> > what this device does.
> A reorganization might indeed be a good way forward; I was examining 
> your changes without stepping back and considering the whole forest.
> Shall I take a stab at it?

Please do, I'd be grateful.



> > > I don't like the bit about "use /dev/random or getrandom(2)";
> > > while
> > > getrandom(2) should be mentioned in "see also", the equivalent is
> > > "getrandom(..., GRND_RANDOM)".   It's the flag, no the syscall.
> > It is the syscall. According the description in getrandom(2):
> > "If the pool has not yet been initialized, then the call blocks,
> > unless GRND_RANDOM is specified in flags."
> 1. You have a buggy man page.  The corrected one says "If the pool
> has
>    not yet been initialized, then the call blocks, unless
> GRND_NONBLOCK
>    is specified in flags."
> 
> 2. I stand by what I wrote above.  Without the GRND_RANDOM flag,
>    getrandom() access the nonblocking pool (/dev/urandom).

I misunderstood what you wrote. My point was that getrandom() will
block if the generator is not seeded (see my first point above).

> > > I strongly dislike the deletion of the "as a general rule"
> > > advice.
> > > Specific recommendations are very valuable.
> > 
> > This advice despite being present for so long, is widely ignored as
> > /dev/urandom is used unconditionally by all software generating
> > keys
> > (SSH/SSL), gnupg being the exception.
> No, it's not being ignored.  The advice isn't "use /dev/random for
> SSH keys", but "*don't* use /dev/random for anything *except* SSH
> keys".  The "(and maybe not even then)" part is implicit, but much
> less of a concern.
> 
> The audience is not the authors of ssh, libssl, or gnupg; they know
> what they're doing.  The audience is everyone *else*, and I think
> specific examples really help there.

Could be, but note that an advice that goes against what the experts do
is not really a good advice. I'd be concrete here any say:
 /dev/urandom is intended to be used by non-interactive applications
generating long term keys which cannot afford unpredictable delays.
Examples are SSL, or SSH keys.
 /dev/random is intended to be used by interactive applications, that
can afford long delays, generating long term keys with very high
requirements on the random data quality. A prominent example is gnupg.

regards,
Nikos

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
