From: Ingo Schwarze <schwarze@usta.de>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Wed, 27 Feb 2019 13:34:29 +0100
Message-ID: <20190227123429.GA60888@athene.usta.de>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
Content-Disposition: inline
In-Reply-To: <20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
List-Id: linux-man@vger.kernel.org

Hello Micheal, dear colleagues,

G. Branden Robinson wrote on Wed, Feb 27, 2019 at 08:48:50PM +1100:
> At 2019-02-27T10:09:44+0100, Michael Kerrisk (man-pages) wrote:
>> On 2/16/19 7:03 PM, Bjarni Ingi Gislason wrote:

>>> Usage: .Rv -std in sections 2 and 3 only (#1672)
>>>   The output from "nroff" and "groff" is unchanged

>> Can you please elaborate on what the problem problem is (.,
>> how do you see the warning)?

> I can't answer the parenthetical definitively--I think Bjarni has
> customized local versions of man-db and groff that enable or supplement
> warnings, making a kind of lint tool for man pages.

And some of those emit warnings that i would definitely call bogus,
plus Bjarni is unusually bad at explaining what he is doing, and
also unusually bad at distinguishing real problems from linter noise.
So in general, don't waste too much time on whatever Bjarni may be
saying.

In this case, there happens to be an actual problem - even though the
patch Bjarni sent is wrong and misleading, as it is usual with him.

> But I think I can speak to the underlying change.  The names of some
> symbols in the mdoc macro package got their "doc-" prefixes restored to
> them in groff 1.22.4.  They had been getting rewritten by "the stripper"
> in the groff source tree, a sed script which applies a bunch of
> transforms to a few of the macro packages to make them run more
> efficiently.  Groff's parser does not tokenize its input, let alone
> compile it down to an intermediate representation, so for instance if
> you have a 72-character comment line inside a macro definition or loop,
> thus:
> 
> .\" ********************************************************************
> 
> ...groff will re-parse the 73 characters (counting the newline) every
> time the macro is called or the loop iterates.
> 
> Unfortunately it is only the stripped version of the macro packages that
> get installed, which makes them pretty hostile to user comprehension,
> like JavaScript minification.
> 
> Opinions on the utility of the stripper script among the groff
> development team are mixed.  One thing no one cared to defend was using
> the stripper to change the names of string or number registers,

So far, i consider Brandon's description accurate and to the point.

> as those are part of the interface of a macro package,

I think this phrase invites a misunderstanding.  With a library or
macro package, the term "interface" is usually understood as "user
interface" or "API", i.e. what application programs (or end-user
documents like manual pages in the case of a macro package) are
supposed to use.

But the .doc-* macros are specifically *NOT* intended for use by
manual pages.  They are supposed to be *INTERNAL* implementation
details of the mdoc(7) macro package, and as such, they can change
at any time without any notice whatsoever.  The .doc-* prefix is
specifically intended to stress the internal character of these
macros and avoid clashes with user-defined macros - even though
defining macros inside manual pages certainly wouldn't be good
style, it still makes sense that a macro set keeps the global
namespace as clean as possible.  Just like a library might start
the names of private, internal symbols that application programs
are not supposed to access with, e.g., an "_" prefix.

> not cosmetic or stylistic
> stuff.  The whole issue arose because the stripper script inadvertently
> renamed a symbol in "mom", an entirely different macro package, contrary
> to the knowledge and intentions of its developer.

Exactly, *that* was the reason for the change: automatically changing
symbol names in libraries by simplistic scripts is a bad idea because
it is likely to sooner or later break in unexpected ways and cause bugs.

> Here is the commit in question.
> 
> https://lists.gnu.org/archive/html/groff-commit/2017-11/msg00098.html
> 
> Come to think of it, because this _was_ an interface change for mdoc,
> this change should have been documented in the NEWS file for groff
> 1.22.4.  That it was not was my oversight, and I apologize.

Branden, i respectfully disagree, and quite strongly.  You did nothing
wrong.  This was not an interface change, certainly not in the sense
that needs to be announced to users.  It was a purely internal
implementation change, entirely irrelevant for users.

The two actual problems are both within the Linux man-pages project,
not within groff:

 1. While back in the early 1990ies, Cynthia Livingston's
    mdoc.samples(7) manual page was an important document and the
    de-facto language definition of the mdoc(7) language, it has
    been outdated for a long time now.  The current groff_mdoc(7)
    manual page is based on it but contains large numbers of important
    improvements by Werner Lemberg and others.  As an alternative
    language definition that is slightly more concise without being
    less precise and complete, the mdoc(7) manual page is available
    from the mandoc(1) distribution (mandoc.bsd.lv).  If there are
    any contradictions between groff_mdoc(7) and mdoc(7), those are
    unintended and i ought to fix them.

    So i really believe that the Linux man-pages project ought to
    stop distributing the woefully outdated mdoc.samples(7) manual
    page.  If you want to include documentation for the mdoc language,
    i suggest that you either include a copy of the current version
    of the groff_mdoc(7) manual from the groff(1) distribution or
    of the mdoc(7) manual from the mandoc(1) distribution, whichever
    you think harmonizes better with the Linux man-pages project.
    Both are BSD-style licensed, so there should be no licensing
    issues.

    I'm not sure whether it is better for you to include or not
    include it.  There is probably value in having mdoc(7) documentation
    out of the box with the Linux man-pages project.  Then again,
    having groff_mdoc(7) in both the Linux man-pages package and
    in the groff package - or having mdoc(7) in both the Linux
    man-pages project and the mandoc(1) package - might cause
    packaging conflicts for some distributions.  I don't rightly
    know how such conflicts are typically handled by Linux
    distributions.  Not being able to install the Linux man-pages
    pages project, groff(1) and mandoc(1) all together on the same
    Linux machine would certainly be a bad situation...

    By the way, the mdoc(7) manual page distributed by the Linux
    man-pages project also makes very little sense.  It is a partial
    repetition of information from groff_mdoc(7)/[mandoc-]mdoc(7),
    but so compressed that it is mostly unintelligible.  Besides,
    it is incomplete: e.g. .Lk, .Mt, .Dx, .Ox, .Nx, .Ta, .%U, .Bk,
    .Ek, .Lb, .In, .Ft, .Ms, .Brq, .Bro, .Brc, .Ex are missing -
    it seems outdated by at lest 25 years.  Also, some claims are
    outright wrong - for example, you *cannot* use .UR/.UE in an
    mdoc(7) document, and i cannot remember ever having seen an
    implementation of a .UN macro anywhere.  Some macros descriptions
    are also wrong, e.g. .Fd is *not* intended for "function
    declarations", and .Vt is *not* "Fortran only".  And so on.

 2. I don't recommend keeping the old mdoc.samples(7) and mdoc(7)
    manual pages, but if you think you must do that for some reason,
    then you must at least revert this bogus commit:

    commit 15a12343170f78bed753787e7886dc30b244aced
    Author: Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
    Date:   Fri Jun 8 02:44:11 2012 +1200
    Signed-off-by: Michael Kerrisk <mtk.manpages@gmail.com>

    A manual page *must not* access internal implementation details
    of the manual page macros like the doc-section string variable.

    It is just like with compiler warnings in general: you cannot
    get code 100% free of compiler warnings, small numbers of false
    positives will always remain, and if you try too hard, then you
    will eventually introduce bugs that are worse than living with
    a small number of compiler warning false positives.

    (Aside: as you will see when running a real linter like "mandoc
    -T lint" on your ancient version of mdoc.samples(7), there *are*
    many dozens of syntactic and logical aspects that could indeed
    be improved and that Bjarni consistently missed when sending
    his patches.  But given the outdated content, the page is hardly
    worth such polishing.)

Yours,
  Ingo
