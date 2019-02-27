From: Ingo Schwarze <schwarze@usta.de>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Wed, 27 Feb 2019 16:21:46 +0100
Message-ID: <20190227152146.GE60888@athene.usta.de>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
	<20190227123429.GA60888@athene.usta.de>
	<2448e778-01df-6074-2599-97e3025f74ca@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
Content-Disposition: inline
In-Reply-To: <2448e778-01df-6074-2599-97e3025f74ca@gmail.com>
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
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, linux-man@vger.kernel.org, groff@gnu.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Michael Kerrisk (man-pages) wrote on Wed, Feb 27, 2019 at 03:28:19PM +0100:

> I am *not at all* attached to keeping to these pages. Their 
> presence in the project has always felt a bit anomalous to me.
> 
> Back when I took over maintainership in 2004, there were a small
> number of pages that used mdoc markup, and so it seemed wise
> to keep these pages. Over time, most of those few pages were
> converted to 'man' markup, and today the only other page in the
> project that still uses mdoc markup is in queue(3). So, there is
> just about zero value in having 'mdoc' documentation come with
> the "Linux man-pages" box.
> 
> Since I seldom use mdoc markup myself, I've had no reason to 
> monitor pages such as groff_mdoc(7) or the mdoc(7) page
> provided my ther 'mandoc' project and compare them with
> the pages provided by "Linux man-pages". Now I've had a
> closer look. It's sad.
> 
> I've removed mdoc(7) and mdoc.samples(7) from "Linux -man-pages".
> 
> That felt good.

Yes, that sounds entirely reasonable.

Even though the Linux man-pages project is very portable and can
be installed and used on almost any operating system, i think most
users probably use it on various distributions of Linux-based
operating systems.  And Linux-based operating systems almost
invariably provide a GNU troff (groff) package installed by default,
so i expect the vast majority of your users will still have mdoc
documentation on their system, in the form of groff_mdoc(7).

The mandoc package is also slowly becoming more popular on Linux.
For example, optional packages exist for Debian, Ubuntu, Gentoo,
Arch, Alpine, Void, Slackware, Crux, ...  So quite a few Linux users
may already have Kristaps' modern mdoc(7) manual page in addition
to the classical groff_mdoc(7).

Free non-Linux systems that offer access to the Linux man-pages project
anyway - see https://man.openbsd.org/Linux-4.16/ for an example -
typically include mandoc(1) by default (e.g. FreeBSD, OpenBSD,
NetBSD, DragonFly, illumos, Minix, ...) - so those already have
the mdoc(7) manual.

I would no doubt like to see mdoc(7) used more in Linux contexts,
too, because Cynthia managed to reach an excellent balance between
simplicity, conciseness, mnemonic value, and semantic markup power -
the semantic search facilities mdoc(7) supports nowadays are very
valuable in practice, and i think the difficulty of learning it is
often vastly exaggerated even for casual users.  Just look at the
MACRO OVERVIEW in mdoc(7), there aren't really that many macros:
  https://man.openbsd.org/mdoc.7#MACRO_OVERVIEW
If you want to see something that is *really* excessively complicated,
try DocBook for a change...  :-/

Anyway, that doesn't mean the Linux man-pages project has to document
mdoc(7) given that it is not currently using it in any significant way.

Yours,
  Ingo
