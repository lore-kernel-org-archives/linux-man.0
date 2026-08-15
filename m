Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55BE3C2D
	for <linux-man@vger.kernel.org>; Sat, 15 Aug 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786799005; cv=none; b=Z6YiH6NgH4S6n1WF2AhLcRodR26aBe/qmEeTrJ58gscAH7OBMNG1tNjiMIWHJmoPIkxmvMGJZKb1+ZhJAWBdmX23Wjsyf+dBPuKEd7NiGZwFhhpwtg9u38mESmPLknLbP6K8cOfz009khuA0OtoORq4U9WPmnItzU8+aFyXpSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786799005; c=relaxed/simple;
	bh=Tuc8v1RNIztRvbjr+nvXjoM0CHh0/55ebQn1oZsIaVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=loODjGgVP+NkpW1xuaYFakccajc16zVgO5npNGZoP3mMh00UkMQZYvHJphEnTEHttM68MIUJVLGY9SRehzsbweMPOH+nhVX1zOIXJhgYA2kTwMS6KxDMtv5plP8S0XKh/07t5zdGX1GF/6Iy/MGgKHPqJGuBbU5CBZt95D5KkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9005B92009C; Sat, 15 Aug 2026 15:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8A47F92009B;
	Sat, 15 Aug 2026 14:03:14 +0100 (BST)
Date: Sat, 15 Aug 2026 14:03:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bernd Petrovitsch <bernd@tuxoid.at>
cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    =?UTF-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>, 
    Alejandro Colomar <alx@kernel.org>, Collin Funk <collin.funk1@gmail.com>, 
    Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
    bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <11bb78f1-09d3-4e90-a4ab-1de76db086e1@tuxoid.at>
Message-ID: <alpine.DEB.2.21.2608151339430.14132@angie.orcam.me.uk>
References: <am56ZBzNM5J07AUa@devuan> <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu> <am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk> <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me> <20260802231058.o7gud4bd7co2nbhv@illithid> <alpine.DEB.2.21.2608140556070.14132@angie.orcam.me.uk>
 <11bb78f1-09d3-4e90-a4ab-1de76db086e1@tuxoid.at>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Aug 2026, Bernd Petrovitsch wrote:

> > > Then why not have one official big header file for the whole standard?
> > > 
> > > #include <stdlibc.h>
> > 
> >   That wouldn't be too unreasonable nowadays I suppose, not IMHO anyway.
> 
> The trivial counter example is windows.h (since ages). And at one point
> "they" introduced the #define WIN32_LEAN_AND_MEAN (probably) for a
> reason ...

 I'm not sure what you refer to, is that Microsoft Windows?  How would it 
be relevant to *nix libc?

 Back in 1970s-80s when the C language standard was being shaped computers 
had memories in the range of kilobytes and storage was often floppy disks 
with all the performance implications, plus computing power in the low MHz 
range.  Nowadays we have memory amounts in the high range of gigabytes to 
terabytes and storage that has throughput of gigabytes per second, and 
computing power many orders of magnitude better if you factor in not only 
the clock rate increase, but all the contemporary architectural features 
as well.  How could it not matter for the speed of header compilation?

  Maciej
