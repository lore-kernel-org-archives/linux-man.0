From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Wed, 27 Feb 2019 13:37:46 +0100
Message-ID: <CAKgNAki-xLaZuHK4By6+8Cvt70iv8BXqaQcm-yjoEJjHYissYg@mail.gmail.com>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
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
Cc: linux-man <linux-man@vger.kernel.org>, groff@gnu.org
List-Id: linux-man@vger.kernel.org

Hello Branden,
On Wed, 27 Feb 2019 at 10:48, G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
>
> At 2019-02-27T10:09:44+0100, Michael Kerrisk (man-pages) wrote:
> > Bjarni,
> >
> > On 2/16/19 7:03 PM, Bjarni Ingi Gislason wrote:
> > > Usage: .Rv -std in sections 2 and 3 only (#1672)
> > >
> > >   The output from "nroff" and "groff" is unchanged
> >
> > Can you please elaborate on what the problem problem is (.,
> > how do you see the warning)?
>
> I can't answer the parenthetical definitively--I think Bjarni has
> customized local versions of man-db and groff that enable or supplement
> warnings, making a kind of lint tool for man pages.
>
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
> the stripper to change the names of string or number registers, as those
> are part of the interface of a macro package, not cosmetic or stylistic
> stuff.  The whole issue arose because the stripper script inadvertently
> renamed a symbol in "mom", an entirely different macro package, contrary
> to the knowledge and intentions of its developer.
>
> Here is the commit in question.
>
> https://lists.gnu.org/archive/html/groff-commit/2017-11/msg00098.html
>
> Come to think of it, because this _was_ an interface change for mdoc,
> this change should have been documented in the NEWS file for groff
> 1.22.4.  That it was not was my oversight, and I apologize.

So, summary: should I apply Bjarni's patch? Or does this lead to
back-compatibility problems?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
