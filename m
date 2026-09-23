Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3BB326939
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.156.224.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127315; cv=none; b=Nt5VIFzQavDDq5uFTBsarhQ19P300ya6qwHDLeUGF44hDrnin0ixlvUp+Bqge54G7tdKzSw50bARfISPOui0+B7aLSU36HekobSBbsibx8DhsruhLX/WPbEbuJRRWx26wqZFJgF1GDA+TKaoy83zatgqdAOXYm3FgT9rgtKm9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127315; c=relaxed/simple;
	bh=nEicJ//ct4KGQgAkLtP7bNYDML6PHt93ZrMpMuYdrss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEyoJ/+ku6ynJyDXezANKOdYpxyasGeqlPF4IPy0HIWScWldxxPZ5mjshwDk93XYF8KGd8Y9hj4UeYi9fgAa1CXj8jq0qLlNAOzI+XWmZ0TC5rFT8nn3XaYWyyn6WZlFoLI8y4j3K2cWBGdYLZ2k+Vy7n1ZCqaG2d+G18qcIKEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org; spf=pass smtp.mailfrom=aerifal.cx; arc=none smtp.client-ip=104.156.224.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Tue, 22 Sep 2026 21:34:28 -0400
From: Rich Felker <dalias@libc.org>
To: tg@trevorgross.com
Cc: linux-man@vger.kernel.org, musl@lists.openwall.com,
	libc-alpha@sourceware.org
Subject: Re: [musl] async-signal-safety of chroot
Message-ID: <20260923013428.GT23438@brightrain.aerifal.cx>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Wed, Sep 23, 2026 at 12:53:16AM +0000, tg@trevorgross.com wrote:
> Hi everyone,
> 
> Is `chroot` async-signal-safe?
> 
> It is a somewhat popular pattern to `fork`, `chroot`, then `exec`.
> However, only AS-safe functions may be called between `fork` and `exec`
> (stated at [1]) but the manual entry for `chroot` makes no such mention
> [2]. signal-safety(7) [3] only covers POSIX, so it is also not listed
> there.
> 
> The rather old POSIX edition that last specified chroot also does not
> mark it AS-safe [4], [5].
> 
> Is code using this pattern buggy, or is it just missing documentation?
> I expect it's the latter but it would be nice to confirm either way.

The restriction to only using AS-safe functions after fork only
applies in multi-threaded processes. So unless your process is
multi-threaded, that's a non-issue.

Since it's no longer standard, there is no standard governing chroot,
but in practice on most systems, including Linux/musl, chroot is going
to be AS-safe because it's just a single syscall.

Also, both glibc and musl relax the restriction on only calling
AS-safe functions in the child after a multi-threaded parent forks. In
glibc this is sort of a best-effort thing, but in musl we went through
a detailed process of ensuring that everything is made consistent for
the child. The only thing that might not be consistent is dynamic
linker state, which might make it impossible to dlopen in the child,
but this is treated as a reportable error condition not a crash or
deadlock or anything.

The changes to lift the restrictions on the child happened in commit
167390f05564e0a4d3fcb4329377fd7743267560

Rich
