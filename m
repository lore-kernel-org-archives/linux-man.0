From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: State of the German translation
Date: Fri, 14 Mar 2008 05:32:37 +0100
Message-ID: <cfd18e0f0803132132s21caf295t7296fbbf8e7ec693@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kobras <kobras-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Alain PORTAL <alain.portal-GANU6spQydw@public.gmane.org>, Christophe Blaess <Christophe-toGIwtK+L2VQFI55V6+gNQ@public.gmane.org>, manpages-de-IAPFreCvJWNplYP5HaJjSx2eb7JE58TQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steffen Wendzel <cdp_doomed-hi6Y0CQ0nG0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Was: Re: Bug#470277: manpage of accept(2) has type int (3rd parameter)=
]

[CCed linux-man, previous and current French translators, and German
maintainers -- Es tut mir Leid, die Liste auf English zu schreiben...]

Hi Daniel,

On Thu, Mar 13, 2008 at 9:07 PM, Daniel Kobras <kobras-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Hi Michael!
>
> On Mon, Mar 10, 2008 at 05:32:58PM +0100, Michael Kerrisk wrote:
> > On Mon, Mar 10, 2008 at 5:23 PM, Steffen Wendzel <cdp_doomed-qku9eb0svtY@public.gmane.org=
t> wrote:
> > > 2.78-1 was the manpages-dev version. As I already told, the relat=
ed
> > > package isn't manpages-dev, it is manpages-de-dev.
> >
> > Ahhh -- okay.  It;s a shame the the DE version still has this.  It =
was
> > fixed in the English pages years ago.
>
> It's a shame indeed. From my view, the core of the problem (apart fro=
m
> the usual lack of manpower) is the absence of an adequate tool to han=
dle
> translations: We don't know that we're missing significant updates un=
til
> we manually cross-check the German translation to the current English
> original. Which is so tedious that it's rarely done. Do you happen to
> know how other translations of the manpages project handle this probl=
em?

Here's the info I know about translations:

http://www.kernel.org/doc/man-pages/translations.html
(No one has sent me info on the state of the German translation, so
I've not created an entry on this page.)

Andries Brouwer (the previous maintainer) has an out-of-date page here:

http://www.win.tue.nl/~aeb/linux/man/index.html

Bottom line: the only translation I know that is full and up to date
is the French translation, but it serves as an excellent example of
what is possible.  Note the following:

* The state of that translation is down to *one* person, Alain Portal,
who built on the earlier work of Christophe Blaess.

* The French translation focuses on translating just the pages from
the man-pages package -- http://www.kernel.org/doc/man-pages/ .  There
are 830+ pages there, and I believe only about 4 or 5 English pages
remain untranslated.  As far as I'm aware, every translated page is up
to date -- Alain can confirm.  (Alain also translates a handful of
other pages that are not in man-pages, but I know little about that.)

* Since man-pages-2.03 or so, when he took over the translation
project (mid-2005), Alain's approach has been to translate each
English release. Back then he had to play catch up, since the French
pages were at version 1.57.  (See
http://linux-man-pages.blogspot.com/2007/12/man-pages-fr-2740-est-sorti=
=2Ehtml
)  In other words, there are corresponding English and French versions
of man-pages 1.58 through to 2.76.  (My current release is 2.79, so
Alain is just three releases behind me -- qu'est-ce que c'est pass=E9,
Alain? -- and lately he stays pretty close.)

* One thing that helps Alain -- aside from his extraordinary energy
and commitment -- is that he uses my changelogs:

http://www.kernel.org/doc/man-pages/changelog.html

The changelogs are detailed and fairly accurate.  In general the only
things that don't get logged against individual pages are spelling
fixes, grammar fixes, and minor formatting fixes, all of which don't
matter too much to translators.  Still, Alain keeps me honest by doing
diffs against my successive releases, and he occasionally catches me
out.

* Alain started in a better position than most other translators,
because the French translation was reasonably complete already.
However, it was far from easy.  When he took over, I believe that not
all of the pages in man-pages-fr-1.57 were actually completely up to
date with respect to the English man-pages-1.57.  So I assume he did a
lot of checking of the existing pages at some point.  (He can perhaps
confirm.)  Also, there has been a lot of churn over the 90 or so
releases that Alain has translated.  Something like 85 new pages
between 2.00 and 2.76, and many many changes to existing pages,
including some major global clean ups of formatting and layout, all of
which Alain has replicated.

=3D=3D

My advice, for what it's worth, on how to bring manpages-de up to
date: do what Alain did.  (When Alain started out with his approach, I
thought it was wrong, that it would create too much work for him to
ever be able to catch up with me.  I was wrong.)

* Separate out the pages that don't come from the upstream man-pages
package into a different -de package.  (This mostly means some section
1 and 8 pages that are in manpages-de.)

* Pick a recent version of the English man-pages package -- lets say
it's version XY.  Aim to bring the German pages current with that
version.  Break the effort down into parcels of (say) 10 English
pages, which are handed out to volunteers.  Find at least 10
volunteers.  Each volunteer takes a parcel, reviews the current German
page against its English equivalent, and either

  + brings it up to date with that version
  + writes a translation of the page, if there is no translation yet; o=
r adds
    the page to a list of to-be-translated pages that some other volunt=
eers
    deal with.

And keep going until all the parcels and translations are done.

* Once manpages-de is up to date with man-pages-XY, which I suppose
will take a while, then use my changelogs to make one for one
translations of man-pages-XY+1, man-pages-XY+2, etc., until you've
caught up with whatever release is current.  Find some volunteers(s)
who have the time to follow my changelog and apply the changes in each
subsequent release in a timely fashion.

=3D=3D

Is that a lot of work?  Hell yes.  But Alain has single-handedly shown
what's possible.

Cheers,

Michael

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
