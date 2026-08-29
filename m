Received: from scc-mailout-kit-01.scc.kit.edu (scc-mailout-kit-01.scc.kit.edu [141.52.71.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E11E3B9942
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.52.71.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017503; cv=none; b=l9wE2uTXDQRj8fOJkHe6VX2ZzIpev24Zu9npKgQcayINT/VUkvglmE1i1GPWanIAXRUFl/wWlQbgu1V9IEfbaOx6Amb9YQEcKNnNUXLXpCwfdiG/7nmMTMn8RQGC7GWhQo67YwPSZTjpOxGUgijtoFPrpFmK7xm1VM4SkYUle3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017503; c=relaxed/simple;
	bh=eRLp0Suq6fsSkaDvdKlDcKbuWxnWF627c28jy4aL/GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZe9Rz7z5JjjLjz0kXnlmy60z4bckYbVshYmjtpJNxshSPLalRoiBTc1PGx6iD4uqwVGiPYPuCL0T49JNDQ3/Q5+0fbQGJ2Tvagk2KLGsUAH9lJaWbwj1xJfcDreS/3La4XEO3fR18w10U+07P7KpwGl5ITd4qxwywD4m5p3D4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de; spf=pass smtp.mailfrom=usta.de; dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b=E9+Lpk1/; dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b=FxS3e6n/; arc=none smtp.client-ip=141.52.71.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usta.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b="E9+Lpk1/";
	dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b="FxS3e6n/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de;
	s=kit2; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
	:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+C2B7R9eKrXsFkYP1AxJQmwlYs3eEghuga9OB318YPE=; b=E9+Lpk1/Euqt5WUxu93IQPNJ7l
	51m/L7bMqJ+YwoDBbtNrTlOKFZU3aMQtvf0iKkKyDpL+wKODyMdio9Ry3zsT4kbkkQPPlUk6twcDn
	NXIRLhocZ0HQfjkqowa6LJDqaBZjK4vqCytmbQWQHlPFlK9DUSvapjCHXAGYvFPTii4nZ3AbnhtEm
	KBp7T2jt0j79hwsnYHRtZwvKxVTFYOlSbUPfPY1HmSIK7iJVPoHTgjrUFAelCAwiTIH5XnfPIZHvV
	KlYEyuikxLe41CXEETFNpQG3X3LzC3yiP/eRDDIXnLGEuBY/x6YxQGqp+/yPxMnQO90eoNKqnD2EK
	dJD/JLDQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de
	; s=kit2ed25519; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+C2B7R9eKrXsFkYP1AxJQmwlYs3eEghuga9OB318YPE=; b=FxS3e6n/kwpJpyDXfSFUT7q0Jv
	7D1wxBJ4EbPMB427ODGvqR3ig7LEBAmvuNcWOu1EnZm71zU7QKI7vmPp4IBw==;
Received: from hekate.asta.kit.edu ([2a00:1398:5:f401::77])
	by scc-mailout-kit-01.scc.kit.edu with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(envelope-from <schwarze@usta.de>)
	id 1x0L1p-0000000AwSq-3Chq;
	Sat, 29 Aug 2026 17:31:34 +0200
Received: from imap-2.asta.kit.edu ([2a00:1398:5:f400::36])
	by hekate.asta.kit.edu with esmtp (Exim 4.98.2)
	(envelope-from <schwarze@usta.de>)
	id 1x0L1p-00000000FMO-0toR;
	Sat, 29 Aug 2026 17:31:33 +0200
Received: from isnote.usta.de ([84.177.233.30])
	by imap-2.asta.kit.edu with ESMTPSA
	id kmiIIFX7kmpmVCgA4A1LTA
	(envelope-from <schwarze@usta.de>); Sat, 29 Aug 2026 17:31:33 +0200
Date: Sat, 29 Aug 2026 17:31:32 +0200
From: Ingo Schwarze <schwarze@usta.de>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: configure separate from make or not
Message-ID: <apL7VAruk1bIOr1M@isnote.usta.de>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
 <apLV749V4YvfqCOZ@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apLV749V4YvfqCOZ@devuan>

[trimming Cc:, this starts becoming off-topic on the groff list;
 i'm not subscribed to linux-man@ though]

Hi Alejandro,

Alejandro Colomar wrote on Sat, Aug 29, 2026 at 03:10:25PM +0200:
> From: Ingo Schwarze <schwarze@usta.de>

> In the Linux man-pages, the configure step is done entirely within
> make(1) --there's no separate ./configure step--.  But as you say,
> a separate configure-only step is important for serious debugging.
> 
> The solution I implemented is a 'nothing' target in the Makefile, which
> as the name implies, does nothing.  However, it still runs the
> configuration step, since that runs as part of parsing the makefiles.

That sounds like a serious abuse of the parsing step to me.
I mean, the whole point of a parsing step is to do parsing and to
build dependency trees, but not to run code.  The purpose of the
execution phase of make(1) then is to run code, in an order determined
from the dependency tree.

> Here's the rule:
> 
> 	nothing:;
> 
> When I need to debug the build system itself, I run that target; often
> with special flags for debugging.  One common command I use when I need
> to do this kind of debugging is:
> 
> 	$ make -p nothing | less

The output of that command looks completely unreadable to me and
is of horrendous size:

   $ gmake -pR nothing | wc
  bash: line 1: gcc: command not found
  realpath: unknown option -- m
  usage: realpath [-q] file
  gmake: warning: undefined variable 'GNUMAKEFLAGS'
   34074  672611 27635924

Over 25 MB of configuration output?  Seriously?


> And if I need to see stderr output from the commands used by the
> configure scripts, here's a common command:
> 
> 	$ make HIDE_ERR= nothing
> 
> I'm not saying that this should be done, but this _can_ be done.  With
> BSD make(1), it might be more difficult to debug, since it doesn't have
> the -p flag.

It does.  From the OpenBSD make(1) manual:

   -p    Print a dump of the target rules and variables on stdout.  Do not
         build anything.

   -d flags
         Turn on debugging, and specify which portions of make are to
         print debugging information.  flags is one or more of the
         following:

         [only quoting the flags here, without the descriptions,
          for brevity]

         AacdDef g1 g2 hiklmnpqstTv

However, reading the output from a simple configure script is much
simpler than reading make(1) debugging output, for example:
 
   $ ./configure
  file config.log: writing...
  file configure.local: reading...
  tested operating system: OpenBSD -> OSENUM=MANDOC_OS_OPENBSD
  tested cc -W: tested noop: yes
  selected CFLAGS="-g -W -Wall -Wmissing-prototypes -Wstrict-prototypes -Wwrite-strings -Wno-unused-parameter"
  tested noop-static: yes
  selected STATIC="-static"
  tested attribute: yes
  tested cmsg: yes
  tested dirent-namlen: yes
  tested be32toh: yes
  tested be32toh-DSYS_ENDIAN: yes
  tested EFTYPE: yes
  tested err: yes
  tested getline: yes
  tested getsubopt: yes
  tested isblank: yes
  tested mkdtemp: yes
  tested mkstemps: yes
  tested nanosleep: yes
  tested ntohl: yes
  tested O_DIRECTORY: yes
  tested PATH_MAX: yes
  tested pledge: yes
  tested sandbox_init: no (compilation failed)
  tested progname: yes
  tested reallocarray: yes
  tested recallocarray: yes
  tested recvmsg: yes
  tested rewb-bsd: yes
  tested rewb-sysv: yes
  tested strcasestr: yes
  tested stringlist: no (compilation failed)
  tested strlcat: yes
  tested strlcpy: yes
  tested strndup: yes
  tested strptime: yes
  tested strsep: yes
  tested strtonum: yes
  tested unveil: yes
  tested vasprintf: yes
  tested fts-DFTS_COMPARE_CONST: no (compilation failed)
  tested fts: yes
  tested less: yes
  selected BINM_PAGER=less
  tested less -T: yes
  selected UTF8_LOCALE=en_US.UTF-8
  tested wchar-DUTF8_LOCALE="en_US.UTF-8": yes
  tested ohash: no (compilation failed)
  tested ohash-lutil: yes
  selected LDADD="   -lutil -lz"
  file config.h: written
  file Makefile.local: written

and then you can inspect config.h and Makefile.local for generated
settings and inspect config.log if serious debugging is needed.

 $ wc config.h Makefile.local config.log
      54     150    1326 config.h
      40     137    1026 Makefile.local
     305    1401   12998 config.log
     399    1688   15350 total

Even the "total" is half a permille of the output volume 
from the gmake -p you recommend - and that already includes *all*
the debugging information, whereas in your 25 MB of gmake -p output,
i was unable to find the reason why the build systems tries to use gcc(1)
even though i don't have GCC installed.  Generally, searching in that
monster is next to impossble because it contains very large numbers
of extremely long lines, each of which contains basically all the
words that one might possibly wish to search for.

> But the output from configure tests can still be read
> without building anything, with a dummy 'nothing' rule.

I briefly tried to read man-pages/GNUmakefile but quickly gave up
because it feels impossible to follow the control flow.
The program fails to explicitly say which targets it runs
with which dependencies, IMHO making it unreadable for a human.

Yours,
  Ingo
