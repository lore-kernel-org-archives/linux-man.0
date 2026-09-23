Received: from mail-108-mta37.mxroute.com (mail-108-mta37.mxroute.com [136.175.108.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA673C7E13
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790205994; cv=none; b=B9CWUG2F4Ob5CzHt0RBHYQNwwwZCmg3xd6Ssb4xgCmsAK8xaNE15Ez1OVmr9MdPfc0po9eX/sfBONUzxT/H8l5A+aMLUv5soq3YOTIsyzhTeQNdYchMIPhEQc6zNaWTm+/+N8B106pP8CZ0XdRYOwvGUSr92iKxuUEgJ9lJRtUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790205994; c=relaxed/simple;
	bh=p2LGrLeQje+/BAZYRXRCPnb00qE/78Y++ElBKpq0kIc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=DG3VUJ0iah/MZyAacSd7hz6b4eahfFlOdRoh0jSveuNbYlL4L5gjyj60/eKiKJSElk+Tkl+m1VvLi7amiaotaEFgJ0vcwDcf2Rsu6w2oAFam41XsJp7XCirg1dlMJXNq8zs9GZ5JVzKUhziZDpKqAaRISgdXkZQG9ndXkmUIg8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=AhlCimmT; arc=none smtp.client-ip=136.175.108.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="AhlCimmT"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta37.mxroute.com (ZoneMTA) with ESMTPSA id 1a0d092e63a00028b2.003
 for <linux-man@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 23:21:23 +0000
X-Zone-Loop: 1e79c94787bc7275dfe07bed08b7a3d2453b37486531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=In-Reply-To:References:Cc:To:From:Subject:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p2LGrLeQje+/BAZYRXRCPnb00qE/78Y++ElBKpq0kIc=; b=AhlCimmTLloPSZDw4MEhpTSbrq
	nd8fgWvvHSCoJG13x4OuQKeG7hgkOabD0VDHeJgnr3YHMt8IRmwFLsoRP39U/lrxJkY4YoLD22Kh7
	FnFS5JpHf6tO28Fv1DcJkE9d5rZYxFq7SUGbhTl0zNbt7aUydeBk3RU9QzNTcLOT4DBmOS6zY2AKU
	BlGMX8EMwtWNxRAsZKxGhtrJaw5IDGdG3a55evsrWtQHZjgYhp5C2OswLlgTMRUZYsalDK5+Ivv83
	j/Gm60kJyZPfu5yxH26VVR8qw0b5eMx+82gdra8SpxzmRO6xllIxM/kmTm1x/SgsWkAiW2uRZK0bK
	AbKfm9xQ==;
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 18:21:15 -0500
Message-Id: <DLN2Y5RVE6E0.1VQOYUR82VWJT@trevorgross.com>
Subject: Re: async-signal-safety of chroot
From: "Trevor Gross" <tg@trevorgross.com>
To: <musl@lists.openwall.com>, <tg@trevorgross.com>
Cc: <linux-man@vger.kernel.org>, <libc-alpha@sourceware.org>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923013428.GT23438@brightrain.aerifal.cx>
In-Reply-To: <20260923013428.GT23438@brightrain.aerifal.cx>
X-Authenticated-Id: tg@trevorgross.com

On Tue Sep 22, 2026 at 8:34 PM CDT, Rich Felker wrote:
> On Wed, Sep 23, 2026 at 12:53:16AM +0000, tg@trevorgross.com wrote:
>
> Since it's no longer standard, there is no standard governing chroot,
> but in practice on most systems, including Linux/musl, chroot is going
> to be AS-safe because it's just a single syscall.

Thanks Rich and others, that aligns with what I would have expected. In
that case this is a documentation request: I have a patch to the manual,
will send it in reply to this thread for any feedback.

> Also, both glibc and musl relax the restriction on only calling
> AS-safe functions in the child after a multi-threaded parent forks. In
> glibc this is sort of a best-effort thing, but in musl we went through
> a detailed process of ensuring that everything is made consistent for
> the child. The only thing that might not be consistent is dynamic
> linker state, which might make it impossible to dlopen in the child,
> but this is treated as a reportable error condition not a crash or
> deadlock or anything.
>
> The changes to lift the restrictions on the child happened in commit
> 167390f05564e0a4d3fcb4329377fd7743267560

That's great to learn about. I'll include a patch to document this as
well.

- Trevor

