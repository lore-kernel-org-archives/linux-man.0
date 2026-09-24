Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A73B42CB
	for <linux-man@vger.kernel.org>; Thu, 24 Sep 2026 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.156.224.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215988; cv=none; b=lDZTZdYeLtB6NUlfpJXmvoaHXZAAmzuGfVPmrXbMiLzVYSt5tvBDRshPWuJIrpuK2d+OvRLAD1WpvQ/0b0qgcRE1SebiPKbBQIiAVy+xmQBw5YYZqI97+TpS7tHLMWBiHq/CSbjOesVRpN5yinw0/2NPO0Xl6+Sm+zl8qDfCq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215988; c=relaxed/simple;
	bh=rJQ+gTZMCfiiUpei/XihcsnK+g3m8BfM6t1wKTQ4jrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5R/zfse6FJjok4gHtwCnpoKzaLcUX4ofNVkcHODxT9YDEWt3L/Mut6ogrwuHp0piAsk++qEmrzAlDHUdMa2B8xwptqtprPM1Mv/yikYgEPZ3cyKFpVm40x8YhpCnNKXM0hEAb8tP1yIrnXfpoPD4VDRImv/k//7dD1aWlK0BKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org; spf=pass smtp.mailfrom=aerifal.cx; arc=none smtp.client-ip=104.156.224.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Wed, 23 Sep 2026 22:12:22 -0400
From: Rich Felker <dalias@libc.org>
To: Trevor Gross <tg@trevorgross.com>
Cc: musl@lists.openwall.com, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org
Subject: Re: [musl] Re: async-signal-safety of chroot
Message-ID: <20260924021222.GC23438@brightrain.aerifal.cx>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923013428.GT23438@brightrain.aerifal.cx>
 <DLN4IBB6FV7K.WN3EVWC5FG17@trevorgross.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLN4IBB6FV7K.WN3EVWC5FG17@trevorgross.com>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Wed, Sep 23, 2026 at 07:34:35PM -0500, Trevor Gross wrote:
> On Tue Sep 22, 2026 at 8:34 PM CDT, Rich Felker wrote:
> >
> > Also, both glibc and musl relax the restriction on only calling
> > AS-safe functions in the child after a multi-threaded parent forks. In
> > glibc this is sort of a best-effort thing, but in musl we went through
> > a detailed process of ensuring that everything is made consistent for
> > the child. The only thing that might not be consistent is dynamic
> > linker state, which might make it impossible to dlopen in the child,
> > but this is treated as a reportable error condition not a crash or
> > deadlock or anything.
> >
> > The changes to lift the restrictions on the child happened in commit
> > 167390f05564e0a4d3fcb4329377fd7743267560
> 
> A followup question: the usual wisdom has been that `fork` must always
> be followed by an `exec`, and not doing so is somewhere between
> error-prone and completely unsound.

I would not say that is "usual wisdom" at all. Traditional unix
practice was very much to take maximal advantage of fork. Lots of
daemons run connections/sessions this way, shells implement subshells
this way, etc.

I would say, however, that it's good practice not to fork except to
exec, and to avoid that too (use posix_spawn instead) when possible.
There are lots of pitfalls with keeping around a forked child, ranging
from leaking potentially sensitive data you didn't intent to copy from
the parent -- especially if dropping privileges in the child -- to
logic bugs around sole ownership of a resource potentially becoming
shared/multiple ownership. Plus there are the portability issues if
anything in the parent is using threads, or if you want to port to
systems where fork is slow, poorly emulated, or unavailable (Windows,
MMU-less microcontrollers, etc.)

> Based per the commit it sounds like
> there are no more deadlocks, and without the POSIX AS-safe requirement,
> the soundness question goes away. Does this mean that it is now
> considered correct and reasonable code to `fork` without `exec` for the
> purpose of e.g. invoking a function in a separate process?

This works on musl and maybe mostly on glibc, but unless you know the
parent is single-threaded, it's not portable. If you look back at the
reason we made it work, it's because one or more interpreted languages
(sorry I don't remember which one(s) at the moment) *wrongly assumed
it works* and built their own language constructs (exposed to
applications written in those languages) around the assumption that it
works.

> Similar to
> what can be done with `clone`.

Generally clone is far more dangerous than fork in this regard. There
is no formal spec for how it behaves, and you are likely stuck with
the same or tighter AS-safety restrictions than fork would have.

musl makes clone roughly as safe as fork (see commit fa4a8abd06a4),
and disallows flags that are not compatible with executing any part of
libc in the child, but afaik glibc still has an anything-goes
approach.

Rich
