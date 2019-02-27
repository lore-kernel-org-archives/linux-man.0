From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Wed, 27 Feb 2019 15:28:19 +0100
Message-ID: <2448e778-01df-6074-2599-97e3025f74ca@gmail.com>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
	<20190227123429.GA60888@athene.usta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
In-Reply-To: <20190227123429.GA60888@athene.usta.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: Ingo Schwarze <schwarze@usta.de>, "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, mtk.manpages@gmail.com, groff@gnu.org
List-Id: linux-man@vger.kernel.org

Hello Ingo,

Thank you for your very detailed mail. I'll leave aside
the history of people's interactions, and cut to the chase
at the end of this mail...

[...]

> The two actual problems are both within the Linux man-pages project,
> not within groff:
> 
>  1. While back in the early 1990ies, Cynthia Livingston's
>     mdoc.samples(7) manual page was an important document and the
>     de-facto language definition of the mdoc(7) language, it has
>     been outdated for a long time now.  The current groff_mdoc(7)
>     manual page is based on it but contains large numbers of important
>     improvements by Werner Lemberg and others.  As an alternative
>     language definition that is slightly more concise without being
>     less precise and complete, the mdoc(7) manual page is available
>     from the mandoc(1) distribution (mandoc.bsd.lv).  If there are
>     any contradictions between groff_mdoc(7) and mdoc(7), those are
>     unintended and i ought to fix them.
> 
>     So i really believe that the Linux man-pages project ought to
>     stop distributing the woefully outdated mdoc.samples(7) manual
>     page.  If you want to include documentation for the mdoc language,
>     i suggest that you either include a copy of the current version
>     of the groff_mdoc(7) manual from the groff(1) distribution or
>     of the mdoc(7) manual from the mandoc(1) distribution, whichever
>     you think harmonizes better with the Linux man-pages project.
>     Both are BSD-style licensed, so there should be no licensing
>     issues.
> 
>     I'm not sure whether it is better for you to include or not
>     include it.  There is probably value in having mdoc(7) documentation
>     out of the box with the Linux man-pages project.  Then again,
>     having groff_mdoc(7) in both the Linux man-pages package and
>     in the groff package - or having mdoc(7) in both the Linux
>     man-pages project and the mandoc(1) package - might cause
>     packaging conflicts for some distributions.  I don't rightly
>     know how such conflicts are typically handled by Linux
>     distributions.  Not being able to install the Linux man-pages
>     pages project, groff(1) and mandoc(1) all together on the same
>     Linux machine would certainly be a bad situation...
> 
>     By the way, the mdoc(7) manual page distributed by the Linux
>     man-pages project also makes very little sense.  It is a partial
>     repetition of information from groff_mdoc(7)/[mandoc-]mdoc(7),
>     but so compressed that it is mostly unintelligible.  Besides,
>     it is incomplete: e.g. .Lk, .Mt, .Dx, .Ox, .Nx, .Ta, .%U, .Bk,
>     .Ek, .Lb, .In, .Ft, .Ms, .Brq, .Bro, .Brc, .Ex are missing -
>     it seems outdated by at lest 25 years.  Also, some claims are
>     outright wrong - for example, you *cannot* use .UR/.UE in an
>     mdoc(7) document, and i cannot remember ever having seen an
>     implementation of a .UN macro anywhere.  Some macros descriptions
>     are also wrong, e.g. .Fd is *not* intended for "function
>     declarations", and .Vt is *not* "Fortran only".  And so on.
> 
>  2. I don't recommend keeping the old mdoc.samples(7) and mdoc(7)
>     manual pages, but if you think you must do that for some reason,
>     then you must at least revert this bogus commit:

I am *not at all* attached to keeping to these pages. Their 
presence in the project has always felt a bit anomalous to me.

Back when I took over maintainership in 2004, there were a small
number of pages that used mdoc markup, and so it seemed wise
to keep these pages. Over time, most of those few pages were
converted to 'man' markup, and today the only other page in the
project that still uses mdoc markup is in queue(3). So, there is
just about zero value in having 'mdoc' documentation come with
the "Linux man-pages" box.

Since I seldom use mdoc markup myself, I've had no reason to 
monitor pages such as groff_mdoc(7) or the mdoc(7) page
provided my ther 'mandoc' project and compare them with
the pages provided by "Linux man-pages". Now I've had a
closer look. It's sad.

I've removed mdoc(7) and mdoc.samples(7) from "Linux -man-pages".

That felt good.

Thank you for your input, Ingo!

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
