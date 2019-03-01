From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Fri, 1 Mar 2019 10:49:41 +0100
Message-ID: <CAKgNAkioBzcx_qGMzmorZt_+GBZ4-PBkNAcJGZshA+i1LijXCQ@mail.gmail.com>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
	<20190227123429.GA60888@athene.usta.de>
	<2448e778-01df-6074-2599-97e3025f74ca@gmail.com>
	<20190227152146.GE60888@athene.usta.de>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
In-Reply-To: <20190227152146.GE60888@athene.usta.de>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, linux-man <linux-man@vger.kernel.org>, groff@gnu.org
List-Id: linux-man@vger.kernel.org

> The mandoc package is also slowly becoming more popular on Linux.
> For example, optional packages exist for Debian, Ubuntu, Gentoo,
> Arch, Alpine, Void, Slackware, Crux, ...  So quite a few Linux users
> may already have Kristaps' modern mdoc(7) manual page in addition
> to the classical groff_mdoc(7).

[...]

> I would no doubt like to see mdoc(7) used more in Linux contexts,
> too, because Cynthia managed to reach an excellent balance between
> simplicity, conciseness, mnemonic value, and semantic markup power -
> the semantic search facilities mdoc(7) supports nowadays are very
> valuable in practice, and i think the difficulty of learning it is
> often vastly exaggerated even for casual users.  Just look at the
> MACRO OVERVIEW in mdoc(7), there aren't really that many macros:
>   https://man.openbsd.org/mdoc.7#MACRO_OVERVIEW
> If you want to see something that is *really* excessively complicated,
> try DocBook for a change...  :-/
>
> Anyway, that doesn't mean the Linux man-pages project has to document
> mdoc(7) given that it is not currently using it in any significant way.

Just to be clear, I'm not against mdoc in any way. (I consider it
unfortunate that man markup isn't at all semantic.)

It's just that the project that I inherited had > 95% pages in man
format, and the existence of a handful of pages in mdoc format was
painful when (in the early days) I was trying to do various automated
global automated edits to get greater consistency of formatting across
pages. I wouldn't have been unhappy if all of the pages had instead
been in mdoc format, but that was not the history.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
