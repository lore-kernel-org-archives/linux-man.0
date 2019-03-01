From: Ingo Schwarze <schwarze@usta.de>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Fri, 1 Mar 2019 11:31:18 +0100
Message-ID: <20190301103118.GA82562@athene.usta.de>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
	<20190227123429.GA60888@athene.usta.de>
	<2448e778-01df-6074-2599-97e3025f74ca@gmail.com>
	<20190227152146.GE60888@athene.usta.de>
	<CAKgNAkioBzcx_qGMzmorZt_+GBZ4-PBkNAcJGZshA+i1LijXCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkioBzcx_qGMzmorZt_+GBZ4-PBkNAcJGZshA+i1LijXCQ@mail.gmail.com>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, groff@gnu.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Michael Kerrisk (man-pages) wrote on Fri, Mar 01, 2019 at 10:49:41AM +0100:

> Just to be clear, I'm not against mdoc in any way. (I consider it
> unfortunate that man markup isn't at all semantic.)
> 
> It's just that the project that I inherited had > 95% pages in man
> format, and the existence of a handful of pages in mdoc format was
> painful when (in the early days) I was trying to do various automated
> global automated edits to get greater consistency of formatting across
> pages.

Sure.  Consistent style eases maintenance.

> I wouldn't have been unhappy if all of the pages had instead
> been in mdoc format, but that was not the history.

The reason probably is that nothing (except bitrot) happens without
somebody doing the work.

Both the original UC California CSRG BSD project and the modern
*BSD projects deriving from it have always been adamant about
following the original UNIX tradition that manual pages are crucial,
are the format of choice for documentation.  Cynthia Livingston
spent substantial work in 1990/1991 on converting the whole corpus
to mdoc(7), and Jason McIntyre did additional conversions in OpenBSD
starting in 2003.  Illumos declared mdoc(7) the new default language
for new documentation around 2014, iirc.

It might have contributed to nobody porting up that work to GNU
land and to Linux land because in spite of the existence of the
Linux man pages project, the situation with respect to documentation
wasn't (and isn't) quite as clear in those lands as it is in BSD
land.

Given that the problem has been solved almost exhaustively for the
BSDs nearly 30 years ago, my focus hasn't been on writing tools to
support man(7) to mdoc(7) conversions either - so that is still
manual work even today; chaining doclifter with docbook2mdoc, as a
potential idea, has been around for many years, but has never been
developed to maturity for practical use at any scale.  Instead, when
working on converters, i worked on converters that are more relevant
in BSD contexts: mdoc to man (relevant for portable software having
mdoc pages that also wants to be installable on mdoc-lacking OSes),
pod2mdoc (relevant for converting OpenSSL to LibreSSL docs),
mdoc to markdown (relevant for those poor souls who are forced by
project policies to provide markdown versions of their documentation),
and so on...

But developing the doclifter|docbook2mdoc toolchain to practical
usability would likely be possible if there were a substantial need,
even though some manual postprocession would almost certainly remain
required.

Yours,
  Ingo
