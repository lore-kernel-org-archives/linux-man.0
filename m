Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [129.13.231.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D035344DAA
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 22:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.13.231.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787525085; cv=none; b=FtigxVVYO15259F+n4wwIvvfHOebYng8Dw/DFI1WfpiyE3wXZr8ZzLLRCqruDMHSppy1PwcY9faDps51+trHKiDtR11LeR5izJbC4Cf5abLtNClSFJWpeTma2sM4pymXO+36vZAXUOp/1g5s9AAPwXJ41C5E/CHL6+BCEgYMNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787525085; c=relaxed/simple;
	bh=jX5H/vcDVCdISPc4fev12kLyl7sGh4GGq+LzpjA+rIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB0ZfeoGwfffNocJ4QlkMWdHZVIW8D2/hKkXzqA5X1GPXKuss2t9p0LIKtqRfdL/JspBa1CG63P6umKeaVoJmbBXAnleIsaIX4w92vBwlIF+Ac/2Wzwq998tAK4R0FnFRqjJ/kLf3CIu2QClGg0I3xI2MzseG54Rm8M+O88vkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de; spf=pass smtp.mailfrom=usta.de; dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b=a1CFTkUI; dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b=aXD8rKYq; arc=none smtp.client-ip=129.13.231.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usta.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b="a1CFTkUI";
	dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b="aXD8rKYq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de;
	s=kit2; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
	:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2w6auWWeWYdd9L6DE3bdHWgrJeAL9GNQxZ22EUzXpKY=; b=a1CFTkUISlpbyjczLCuuldATRj
	Jllh82nyKO0mz3YfHguyi4QHXiqz77rrroSgV0sOVvi861QbsTHDBFnnRUQYJS0bR/ehr/fcbEhyc
	umBmn5huv6SXG4pjnQAGDM/dbikJ9PMTedsvdGjD06WtwxOPgLafSgT9/jq3QfxOROieGRHwD8CRz
	V2anvuiYq4zMJOp+poFgtIhww/kaF0dlYa5IEQ0/rNyj39wF7lL3Omon/EIu+Y+N+Kiyvkr8vtduU
	WUEA9HkOfFeSg3ObqMWWecidmdjebdZqZgJXDMVmBsc1dp9CRkScqsNh/m059uLKNDb3tNBGG4tMN
	c34WcASA==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de
	; s=kit2ed25519; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2w6auWWeWYdd9L6DE3bdHWgrJeAL9GNQxZ22EUzXpKY=; b=aXD8rKYqmu7Cok3/y3GcwfjqWJ
	8ihKFg8XGTESeNzjQ3I3NvTeb/cOr2f2HNEKiBMJ8TgB3Fe0/VvLyr6kaTCg==;
Received: from hekate.asta.kit.edu ([2a00:1398:5:f401::77])
	by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(envelope-from <schwarze@usta.de>)
	id 1wyGim-0000000FHoO-2Cii;
	Mon, 24 Aug 2026 00:31:21 +0200
Received: from imap-2.asta.kit.edu ([2a00:1398:5:f400::36])
	by hekate.asta.kit.edu with esmtp (Exim 4.98.2)
	(envelope-from <schwarze@usta.de>)
	id 1wyGil-000000001bF-17Ep;
	Mon, 24 Aug 2026 00:31:19 +0200
Received: from isnote.usta.de ([84.177.233.30])
	by imap-2.asta.kit.edu with ESMTPSA
	id E2muFLd0i2pTDAcA4A1LTA
	(envelope-from <schwarze@usta.de>); Mon, 24 Aug 2026 00:31:19 +0200
Date: Mon, 24 Aug 2026 00:31:07 +0200
From: Ingo Schwarze <schwarze@usta.de>
To: Alejandro Colomar <alx@kernel.org>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org, groff@gnu.org
Subject: autotools, was: Using LS/LE
Message-ID: <aot0q9iCIXOJf8Kk@isnote.usta.de>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aotFzewQhmLJSk6N@devuan>

Hello Alejandro and Branden,

Alejandro Colomar wrote on Sun, Aug 23, 2026 at 09:30:53PM +0200:
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>

>> Autoconf, Automake, and Libtool, the collective "autotools", are all
>> strongly distinguishable in purpose.

> I guess if you deal with them enough, you get to distinguish them.
> In shadow-utils, where we have an autotools-based build system, I
> consistently avoid to learn it.  I leave it up to the other maintainers
> and the distro maintainers to keep it working.  I only report the issues
> to them.  To me, it'd be easier to wipe it all and write a Makefile from
> scratch than learning the tools.  The day I have to maintain that, I'll
> probably do so.

As one data point for Alejandro, that's precisely what i chose to do,
and not even because i had never used autoconf before, just because
i considered using autoconf massive overkill and likely to cause
a maintenance nightmare.  The same applies to automake, but to
an even higher degree.

Look at this:

   $ pwd
  /co/mandoc
   $ wc configure  # handwritten, human-readable, and portable
     693    2537   20370 configure
   $ wc Makefile   # handwritten, human-readable, and portable
     619    1600   16050 Makefile
   $ wc config.h   # generated by ./configure
      54     150    1326 config.h

Apart from that, there are 37 test-*.c feature test files,
all handwritten and human-readable, 723 lines grand total,
i.e. less than twenty lines on average.

Finally, there are 19 compat_*.c portable replacement implementations
for systems lacking certain functions.

>> Autoconf is a brilliant idea, very
>> well executed.  I suspect that many of its its detractors possess a
>> constellation of negative traits:
>> 
>> 1.  They're not terribly competent at writing portable shell scripts;

That's indeed true for me.  While i have done a fair amount of shell
programming (including writing an entire incremental backup system
in pure sh(1) more than two decades ago, just for the heck of
learning the language and testing my skill on a non-trivial project,
which was obviously a terrible idea - yet the project was in use
for many years at that organization), and including some work in
the OpenBSD /etc/rc system, particularly rc.d(8) and daily(8),
i'm certainly not nearly as good at sh(1) as our true shell wizards
like Alexander Hall or Andrew Fresh.  So no, i don't consider myself
a competent shell programmer.

Shell is among the hardest languages to write good, secure code in.

That's why i have re-rwitten the OpenBSD security(8) script, which
used to be in sh(1) before my time, in perl(1), with contributions
from Andrew Fresh.  The security(8) acript is run from daily(8),
which is a shell script that i have also significantly contributed to.

> I believe I'm quite competent writing shell scripts.  :)


>> 3.  they refuse to believe that the variety of possible deployment
>>     environments is as wide as it is.

I think that was actually true thirty years ago, when many systems
shipped shells that were badly starved for features and full of bugs
and limitations.  It was no longer true 15 years ago.  Nobody
has used Silurian systems in need of autoconf-style shell workarounds
for at least a decade, probably much longer.

Here is the list of systems where the configuration system described
above is known to just work (sorted alphabetically):

  Adelie Linux     Alpine Linux     Arch Linux       Chimera Linux
  Crux Linux       Cygwin           Debian           DragonFly BSD
  Fedora           FreeBSD          Gentoo           Guix System
  IBM AIX          illumos          IRIX             macOS
  Minix 3          NetBSD           NixOS            OpenBSD
  openSUSE         Oracle Solaris   Slackware Linux  Sun OS 5.9
  Sun OS 5.10      Termux           Ubuntu           Unleashed OS
  Void Linux 

No shortage of weirdos in there, right?

> I acknowledge this.  However, some people refuse to believe that
> hand-crafted makefiles can also handle quite different environments too.
> I believe makefiles can do that just fine.  It's a matter of how much
> makefile code you write.
> 
> In the Linux man-pages project, we have 120 kB of makefiles.
> 
> 	$ find share/mk/ -type f | xargs wc -c GNUmakefile | tail -n1
> 	119125 total

That's an awful lot.  Why would the man-pages Makefiles need to be
more than seven times larger than the mandoc Makefiles?
You don't even need to compile and link C code, right?

> I believe that a set of makefiles that would handle all of the targets
> of a project like groff wouldn't take much more than that.  It might be
> a few hundred kB.  If it's well organized, it can be maintainable.

Groff is definitely larger than either of man-pages and mandoc,
and in particular uses a wider variety of languages and file
format transformations.  The factor might be larger than just
two or three, but not orders of magnitude larger, that much i
tend to agree with.

> Because the makefile language is so simple, bugs are easy to spot and
> fix, compared to autotools (possibly automake, but I can't distinguish
> them enough).

Strongly seconded.  Due to the autotools it uses, the time i spend
merely maintaining the GNU roff(7) port in OpenBSD, not even
counting the times i have spent submitting patches to the
upstream groff build system, is a very large factor (maybe
about ten times) larger than all the time i ever spent on the
mandoc build system, even though i wrote most of it from scratch
and have been maintaining it for over 20 operating systems for
over a decade.

>> The build system is the thing that consistently gives us the most pain
>> when trying to firm up a release.  So right now you are pulling on HEAD
>> at its most fragile, ironically.  The code quality should be good, _if_
>> you can get the build to completion.

That is in sharp contrast to my experience with the mandoc build
system.  When i send out release candidates for mandoc, almost
all the feedback i get concerns real issues with the actual code
itself, only a tiny fraction has to do with the files "Makefile"
and "configure", and even those few issues are typically very easy
to fix.

> I'm happy to uncover those bugs; it's not a problem.

That's also in sharp contrast to my experience.  I have repeatedly
spent considerable amounts of time fighting with the groff build
system, i have never been happy about it, and the considerable
loss of time it has often caused has been a problem that has often
hampered progress on more productive topics related to groff and mandoc.

Still, i do often track down such issues out of sheer necessity,
because otherwise building just fails outright.

All that said, i don't think revisiting the question of which build
and portability system to use for groff is particularly productive
at this time.  Bertrand already did the work of automaking it,
Branden is apparently reasonably content with the result (and comfort
of the chief maintainer *is* the eminent consideration regarding a
build system), so uprooting that beast once again is likely not
advisable, unless Branden somehow becomes very frustrated with it.

My motivation of sketching my experience here is mostly for
Alejandro's personal benefit.


Talking about releases, there is finally some progress:

 * I finally have a fully working port of groff-1.23
   with no more unexplained discrepancies left.
 * I finally have mandoc in sync with groff-1.23 -
   well, not perfectly, but so far that i now understand
   all the remaining incompatibilities, in particular
   those that groff grew from 1.22.4 to 1.23.
 * I'm currently looking through the mandoc TODO
   list for things that can be fixed with little risk
   before release; i think there at at most very few.
 * After that, my next step will be sending out a mandoc-1.15.1
   release candidate for testing, then release it.
 * After that, i will update the groff port to 1-23,
   then start more seriously looking at porting 1.24.
 * I will almost certainly *not* look at 1.25 before
   upgrading the port to 1.24 - last time, giving priority
   to release testing caused my progress on understanding
   new discrepancies in 1.23 to stall out, which probably
   wasn't ideal.

Here is a draft of the NEWS file (temporary file name, will
go away when the release candidates goes out) - just as a preview
for you showing likely release content:

  https://mandoc.bsd.lv/NEWS.draft.txt

I believe a few very weird bugs persist in the GNU tbl(1)
formatter for terminal output, related to when exactly vertical
lines between columns extend higher than the top of the table -
apparently, the set of cases is even different from the set of
cases where the vertical spacing before tables that Branden
attempted to remove for 1.23 still persists, and there are a
few cases in which vertical lines extend far (many lines)
beyond the table, sometimes above, sometimes below.
Then again, reporting those multiple weirdnesses properly will
have to wait until after the update of the port to groff-1.23.

If you are dying from curiosity, running the test file

  https://cvsweb.openbsd.org/checkout/src/regress/usr.bin/mandoc/tbl/layout/lines-nogroff.in?rev=1.2

through the mandoc gmdiff script (or just formatting it with groff
and mandoc and diffing the results) may give you a rough idea,
but i'm well aware this is *not* a proper bug report.


I don't yet understand what the point of .LS is - in my experience,
assembling items from .IP and .TP blocks to form lists is *not*
among the problems the man(7) language causes - quite to the contrary,
even though HTML is a strongly structural and semantic language,
assembling even HTML code from .IP and .TP is a almost never a
problem, and i don't see which other target format could possibly
be harder to handle than HTML.  I would probably have to read up
on prior discussions, but the topic feels unrelated and i won't mix
it into this mail.

Yours,
  Ingo
