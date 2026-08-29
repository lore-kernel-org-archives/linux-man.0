Received: from scc-mailout-kit-01.scc.kit.edu (scc-mailout-kit-01.scc.kit.edu [141.52.71.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31F2D12ED
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.52.71.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997196; cv=none; b=Mgn8IWHVdZn1Hl72E1J0ysEEMXYwn3J9eZPm+M+AlzjqEmZb21ZxuqlQEOwzoc1PbBT0K7pRLkehY1/MHZdb+pRYds1PPUS1MFUV83AmXtivqvAJAxx1tb2cIHEXZHaUA5MLsyEPvtAJLSwICfsBmfDuqdMsIPUd6Od6hmA6PYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997196; c=relaxed/simple;
	bh=+UHWk0Yzdh/9oGXNcMUWbvPw5HnpwUBzCmhsO+arQa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTiwhg+eXYx+Y7yjKNKgIa9mEOszdUfEOeKvpjNvUl58HU0HNyZ2olE1gX07Lpzwvq17sfUFqjcK0bv+SIwywfRItfvAmQuctV7rqaXoJiAdK7BgR9ibeOp5/zTwVkE+XvuEYTpXSErh0g1LhXA4G8iPXK63MGVC/llBhAfmIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de; spf=pass smtp.mailfrom=usta.de; dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b=aIwIgLBl; dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b=BRNR5AvW; arc=none smtp.client-ip=141.52.71.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usta.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b="aIwIgLBl";
	dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b="BRNR5AvW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de;
	s=kit2; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
	:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H8mqb3MpO2cmh1qryk/JTJwZ6FQGB3SJ5eMt9xjirXw=; b=aIwIgLBlj9sMPUWwSiqRDjM5Yg
	0LTZRLhDbnJBY5QWib8p3pNJPoF0Q4Wf06zqP3IWjzXtaKeq3F4tyGpyc9PISvtlRaoRfzO9P9RaE
	Jf+N4gzP5N9HthU9rHMFobFKOWNXV+XOPr+2RDuwqrCQzmzZ9PQNhyQlyGnv1uxJPsMJ0CLkM24WR
	C4lS/84x7K1f3K2fSNH//7IDKrsJ5CTIR4iR+DWDwkEaRuAPjuI/qC3L5A2lpMk0ypVNTtHZIOwk3
	3+/mZ2comDXJTnvkXQ32IoeD0kDaysEh/9IDgvfbkvirEn6sge8+MbtEwO5JCYqKT8tOP+LrySltu
	R8GMH39g==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de
	; s=kit2ed25519; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H8mqb3MpO2cmh1qryk/JTJwZ6FQGB3SJ5eMt9xjirXw=; b=BRNR5AvWOLpjM2qRxkw3qpeBE7
	ToyFui9gyMeGC8JiItmTtqMX6dBufKc2qXMf8fzHL4IymXE3pk16aCMX8BDA==;
Received: from hekate.asta.kit.edu ([2a00:1398:5:f401::77])
	by scc-mailout-kit-01.scc.kit.edu with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(envelope-from <schwarze@usta.de>)
	id 1x0FX9-0000000AMpC-0lhu;
	Sat, 29 Aug 2026 11:39:31 +0200
Received: from imap-2.asta.kit.edu ([2a00:1398:5:f400::36])
	by hekate.asta.kit.edu with esmtp (Exim 4.98.2)
	(envelope-from <schwarze@usta.de>)
	id 1x0FX8-00000000Ewd-21D2;
	Sat, 29 Aug 2026 11:39:30 +0200
Received: from isnote.usta.de ([84.177.233.30])
	by imap-2.asta.kit.edu with ESMTPSA
	id vvVMLtKokmrf8CcA4A1LTA
	(envelope-from <schwarze@usta.de>); Sat, 29 Aug 2026 11:39:30 +0200
Date: Sat, 29 Aug 2026 11:39:20 +0200
From: Ingo Schwarze <schwarze@usta.de>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Alejandro Colomar <alx@kernel.org>, Groff <groff@gnu.org>,
	linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKou1PHGi1N5gGO@isnote.usta.de>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>

Hi Larry,

Larry Kollar wrote on Fri, Aug 28, 2026 at 10:50:50PM -0400:
> Alejandro Colomar <alx@kernel.org> wrote:

>> I believe that a set of makefiles that would handle all of the targets
>> of a project like groff wouldn't take much more than that.  It might be
>> a few hundred kB.  If it's well organized, it can be maintainable.
>> 
>> Because the makefile language is so simple, bugs are easy to spot and
>> fix, compared to autotools (possibly automake, but I can't distinguish
>> them enough).

> I don't know. Can a Makefile check for the presence of certain libraries
> or other apps and fail gracefully

Obviously, a Makefile can do anything a sh(1) script can do -
arguably, the central idea of make(1) is topological sorting
of sh(1) script snippets according to a dependency graph.
So the answer to your question is an emphatic "yes".

> (by which I mean exiting with a message like "You need app X, plus
> libraries Y and Z, installed to successfully compile this.")?

Absolutely, and some real-world Makefiles do just that,
for example the large and frightening bsd.port.mk(5) on OpenBSD:

  https://man.openbsd.org/bsd.port.mk
  https://cvsweb.openbsd.org/ports/infrastructure/mk/bsd.port.mk

But smaller, simpler Makefiles emitting diagnostic messages of the
kind you describe exist, too.

> That's one of the things that "makes" me appreciate taking
> that extra step of typing `.configure` before make.

Well, that doesn't look like a particularly strong argument,
because adding a rule to the Makefile that automatically runs
the configure script when needed would usually not be difficult,
and the end result regarding diagnostics would be identical to
what you desire.

I think the main reason why build system developers don't usually
run configure automatically from the Makefile is that from a user
perspective, it makes sense to keep the two steps "inspect the
configuration and make some decisions, but do not start building
anything just yet" and "build the stuff, using the variables and
decisions made at the configure stage" separate.  Users may even
want to pause between the two steps, consider the decisions made,
for example by inspecting configure output files like config.h
or Makefile.local or, in case serious debugging is needed, config.log
and maybe even change some of the decisions manually and re-run
configure, even though autoconf(1) makes both steps, inspection
and manipulation of decisions, gratuitiously hard, both by spewing
vast amounts of noise and by the ./configure script being next to
unreadable.  But saner, better-written configure scripts can make
both inspection and manipulation quite simple and pleasant.

Running the configure script automatically from the Makefile
would remove this opportunity for inspection and tweaking.

My point isn't that configure should be integrated into the
Makefile.  Quite to the contrary, medium-sized projects like groff
and mandoc that need to run dozens of configuration tests do benefit
from having a separate configure script.  What i'm saying is that
developers can save themselves massive amounts of work and pain
by ditching autoconf(1) and writing their own configure script -
and thus also make life massively easier for their users, because
dealing with autoconf(1) is equally painful for users.

But again, i do *not* advocate for ripping autoconf(1) out of groff
because Branden seems happy enough with it for now, and it kind
of works most of time, admittedly with regular hiccups around
releases.  Ripping it out would look like a make-work project
at this point; constantly revisiting the same decisions is not
very productive, and automake(1) was only integrated a few years ago.

> Now, a lot of older software (or modern, simple programs) won't
> need that complexity, and a well-written INSTALL file can call out
> necessary Makefile edits before letting 'er rip.

Right, suckless.org software comes to mind as an example.
(That's not to say that i would endorse them in every respect -
for example, i like small amounts of configurability and do not
like the "zero configuration at run time" approach of suckless.)

Yours,
  Ingo
