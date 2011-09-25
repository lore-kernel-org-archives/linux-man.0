From: Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH] man ptrace: add extended description of various ptrace quirks
Date: Sun, 25 Sep 2011 08:10:58 +0200
Message-ID: <CAKgNAkipqzQRt1AGDvgMZ7mRiMjqASP6+z-GuHUPEhdS4Jh_KQ@mail.gmail.com>
References: <CAK1hOcPFXMoYsP6N6Hx5Qz3J4xj31TmSj7xo6SRVPegNCbhx7g@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK1hOcPFXMoYsP6N6Hx5Qz3J4xj31TmSj7xo6SRVPegNCbhx7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Jan Kratochvil <jan.kratochvil@redhat.com>, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Denys,

On Thu, Jul 21, 2011 at 1:09 PM, Denys Vlasenko
<vda.linux@googlemail.com> wrote:
> Hi Michael,
>
> Please apply attached patch which updates ptrace manpage.
> (I'm not sending it inline, google web mail might mangle it. Sorry).

Thanks. This is a fantastic piece of work! I'm working on the patch
now; it'll probably take me a few days before I have done with it.
I'll send you the new version for review when I'm done.

> Changes include:
>
> s/parent/tracer/g, s/child/tracee/g - ptrace interface now
> is sufficiently cleaned up to not treat tracing process as parent.
>
> Deleted several outright false statements:
> - pid 1 can be traced

=46or changes like this, it's useful to record when the change occurred=
,
rather than just deleting the old text. I'm taking it that the change
occurred in 2.6.26, with commit
00cd5c37afd5f431ac186dd131705048c0a11fdb. Right?

> - tracer is not shown as parent in ps output

Was this a change triggered by a kernel revision? If so, which kernel v=
ersion?

> - PTRACE_ATTACH is not "the same behavior as if tracee had done
> =A0a PTRACE_TRACEME": PTRACE_ATTACH delivers a SIGSTOP.

Again, was this a change triggered by a kernel revision? If so, which
kernel version?

> - SIGSTOP _can_ be injected.

Again, was this a change triggered by a kernel revision? If so, which
kernel version?

> - Removed mentions of SunOS and Solaris as irrelevant.

Yes, seems fair enough to me.

> - Added a few more known bugs.

Thanks.

> Added a large block of text in DESCRIPTION which doesn't focus
> on mechanical description of each flag and operation, but rather
> tries to describe a bigger picture. The targeted audience is
> a person which is reasonably knowledgeable in Unix but did not
> spend years working with ptrace, and thus may be unaware of its quirk=
s.
> This text went through several iterations of review by Oleg Nesterov
> and Tejun Heo.

Really, really good that you added that. Thank you.

> This block of text intentionally uses as little markup as possible,
> otherwise future modifications to it will be very hard to make.

Sorry, here I have to disagree ;-). Maintaining consistency across the
almost 1000 pages in man-pages is important for many reasons:
* Reader comfort; all man pages should look fairly consistent.
* Some scripts rely on consistent formatting to produce nicely rendered=
 output
* Some global edits and replaces, and checking scripts, are more
likely to work well when formatting is consistent
* Consistent formatting probably also is helpful for downstream transla=
tions.

So, for these reasons, mark-up really should be applied. I'll do that
now, and if you need assistance with mark-up for future revisions, I'm
very happy to help out.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
