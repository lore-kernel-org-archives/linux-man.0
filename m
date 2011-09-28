From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] madvise.2: add MADV_HUGEPAGE and MADV_NOHUGEPAGE
Date: Wed, 28 Sep 2011 03:59:25 +0200
Message-ID: <20110928015925.GB7768@redhat.com>
References: <CAFWqQMRFHJ2kWkJWB2dAg-Od9MzqL7LeC=CQvzy6t5aNqVY_zQ@mail.gmail.com>
 <CAKgNAkh55ZFMEU5nH0vS=jgW91GjDWx1Tf=gyRDUqNm4yqS1oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh55ZFMEU5nH0vS=jgW91GjDWx1Tf=gyRDUqNm4yqS1oA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

On Mon, Sep 19, 2011 at 07:26:49AM +0200, Michael Kerrisk wrote:
> Hello Doug,
>=20
> On Wed, Jul 27, 2011 at 10:14 PM, Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Document the MADV_HUGEPAGE and MADV_NOHUGEPAGE flags added to the
> > madvise() syscall in Linux kernels 2.6.38 and newer.
>=20
> Thanks. I've applied this for man-pages-3.34.
>=20
> Andrea, is there anything you think necessary to add/change?

Looking good!

> > Signed-off-by: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
> > ---
> > =A0man2/madvise.2 | =A0 34 ++++++++++++++++++++++++++++++++++
> > =A01 files changed, 34 insertions(+), 0 deletions(-)
> >
> > diff --git a/man2/madvise.2 b/man2/madvise.2
> > index 6a449c5..e099e94 100644
> > --- a/man2/madvise.2
> > +++ b/man2/madvise.2
> > @@ -209,6 +209,40 @@ KSM unmerges whatever pages it had merged in t=
he
> > address range specified by
> > =A0.IR addr
> > =A0and
> > =A0.IR length .
> > +.TP
> > +.BR MADV_HUGEPAGE " (since Linux 2.6.38)"
> > +Enables Transparent Huge Pages (THP) for pages in the range specif=
ied by
> > +.I addr
> > +and
> > +.IR length .

Maybe it should also be specified that most common kernels
configurations by default will behave like MADV_HUGEPAGE already, and
thus MADV_HUGEPAGE is normally not necessary and it's mostly meant for
embedded systems that may not enable by default in the kernel the
MADV_HUGEPAGE behavior. It can be used in order to selectively enable
THP through MADV_HUGEPAGE (only in some region). Whenever
MADV_HUGEPAGE is used, it should be always in regions of memory with
an access pattern that the developer knows in advance that won't risk
to increase the memory footprint of the application when transparent
hugepages are enabled.

> > +.BR MADV_NOHUGEPAGE " (since Linux 2.6.38)"
> > +Ensures that memory in the address range specified by
> > +.IR addr
> > +and
> > +.IR length
> > +will not be collapsed into huge pages.

Maybe it's more clear as "will not be backed by transparent
hugepages". The collapse is done by khugepaged only but the
transparent hugepages may be natively allocated during the page fault
without waiting them to be collapse later, if MADV_NOHUGEPAGE isn't
used.

This can be used to selectively disable THP for any app that is doing
some scattered memory access that may increase the memory footprint
of the application too much with THP enabled.

Generally those two MADV_*HUGEPAGE madvise are useful to deal with any
memory footprint issue that may arise depending on the kernel default.

=46or example that the NPTL thread stacks virtual area could be a good
candidate for MADV_NOHUGEPAGE usage, but that's not implemented yet I
think. As opposed qemu-kvm should do MADV_HUGEPAGE by default because
if somebody runs KVM on embedded there will be no memory waste in KVM
because of THP enabled for the guest physical memory (when the guest
reach peak load and touched all ram which happens eventually), so then
KVM will just run faster with no risk of increased memory footprint.

Not so easy to explain clearly though :) but if we manage express
these concepts too, it'll avoid the risk of people polluting apps with
these madvises when they're not needed 99% of the time (with a few
exceptions like qemu-kvm and maybe NPTL for the user thread stacks,
the latter has yet to be checked, KVM I'm positive it'll be fine).

But hey your previous patch already is looking good already.

Thanks a lot for helping document this!
Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
