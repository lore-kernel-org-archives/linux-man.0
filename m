From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned
 buffers
Date: Wed, 2 May 2012 11:18:37 +0200
Message-ID: <20120502091837.GC16976@quack.suse.cz>
References: <1335778207-6511-1-git-send-email-jack@suse.cz>
 <CAHGf_=qdE3yNw=htuRssfav2pECO1Q0+gWMRTuNROd_3tVrd6Q@mail.gmail.com>
 <CAHGf_=ojhwPUWJR0r+jVgjNd5h_sRrppzJntSpHzxyv+OuBueg@mail.gmail.com>
 <x49ehr4lyw1.fsf@segfault.boston.devel.redhat.com>
 <CAHGf_=rzcfo3OnwT-YsW2iZLchHs3eBKncobvbhTm7B5PE=L-w@mail.gmail.com>
 <x491un3nc7a.fsf@segfault.boston.devel.redhat.com>
 <CAPa8GCCgLUt1EDAy7-O-mo0qir6Bf5Pi3Va1EsQ3ZW5UU=+37g@mail.gmail.com>
 <20120502081705.GB16976@quack.suse.cz>
 <CAPa8GCCnvvaj0Do7sdrdfsvbcAf0zBe3ssXn45gMfDKCcvJWxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <CAPa8GCCnvvaj0Do7sdrdfsvbcAf0zBe3ssXn45gMfDKCcvJWxA@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Nick Piggin <npiggin@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Jeff Moyer <jmoyer@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, Michael Kerrisk <mtk.manpages@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org, linux-mm@kvack.org, mgorman@suse.de, Andrea Arcangeli <aarcange@redhat.com>, Woodman <lwoodman@redhat.com>
List-Id: linux-man@vger.kernel.org

On Wed 02-05-12 19:09:54, Nick Piggin wrote:
> On 2 May 2012 18:17, Jan Kara <jack@suse.cz> wrote:
> > On Wed 02-05-12 01:50:46, Nick Piggin wrote:
>=20
> >> KOSAKI-san is correct, I think.
> >>
> >> The race is something like this:
> >>
> >> DIO-read
> >> =A0 =A0 page =3D get_user_pages()
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fork()
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 COW(page)
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0touch(page)
> >> =A0 =A0 DMA(page)
> >> =A0 =A0 page_cache_release(page);
> >>
> >> So whether parent or child touches the page, determines who gets the
> >> actual DMA target, and who gets the copy.
> > =A0OK, this is roughly what I understood from original threads as wel=
l. So
> > if our buffer is page aligned and its size is page aligned, you would=
 hit
> > the corruption only if you do modify the buffer while IO to / from th=
at buffer
> > is in progress. And that would seem like a really bad programming pra=
ctice
> > anyway. So I still believe that having everything page size aligned w=
ill
> > effectively remove the problem although I agree it does not aim at th=
e core
> > of it.
>=20
> I see what you mean.
>=20
> I'm not sure, though. For most apps it's bad practice I think. If you g=
et into
> realm of sophisticated, performance critical IO/storage managers, it wo=
uld
> not surprise me if such concurrent buffer modifications could be allowe=
d.
> We allow exactly such a thing in our pagecache layer. Although probably
> those would be using shared mmaps for their buffer cache.
>=20
> I think it is safest to make a default policy of asking for IOs against=
 private
> cow-able mappings to be quiesced before fork, so there are no surprises
> or reliance on COW details in the mm. Do you think?
  Yes, I agree that (and MADV_DONTFORK) is probably the best thing to hav=
e
in documentation. Otherwise it's a bit too hairy...

								Honza
--=20
Jan Kara <jack@suse.cz>
SUSE Labs, CR

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter=
.ca/
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
