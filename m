Received: from mail-108-mta142.mxroute.com (mail-108-mta142.mxroute.com [136.175.108.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031492E7395
	for <linux-man@vger.kernel.org>; Thu, 24 Sep 2026 00:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790210397; cv=none; b=eYUWWuLNa7TixAyAmRnpUC7ZQQ4uxep7pfTIog1U4iA/WyDTpb3I/pPwInJVmwZPcYuHkDwbMmDG2F3vnV2CzcRs3f9g/5ct7bE25l7V6+t2xg2s9g+YFf0i8Wiet/vuVrN2foVMLQxoRZlQGJyzQlhGXsrwMRhvDQhr2ubW24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790210397; c=relaxed/simple;
	bh=bqlQUVrROEgQAVy1cfsXWkJHE8KxOw5mDFCVN0QYwjA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B3gL9hgAVDdD12oEpqRAtACUyyFJFbsPP0P1cQE3+q/nM2nhrYap2OANBmhIYnBKV+pT0iU5huufv/JRvwn9MD9i0n7mI6/QO883vVdSaXVM56mgSly9kde0vCNXwruP5vFoxW9u6B7rKUp/OAq+evKv1R4dRZG3acsRPiKBUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=othqGKbH; arc=none smtp.client-ip=136.175.108.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="othqGKbH"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta142.mxroute.com (ZoneMTA) with ESMTPSA id 1a0d0d60b0600028b2.003
 for <linux-man@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 00:34:43 +0000
X-Zone-Loop: e9b8fb833580fb1b732cc542c29ceebf4a81dfa17705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bqlQUVrROEgQAVy1cfsXWkJHE8KxOw5mDFCVN0QYwjA=; b=othqGKbHQjia6h1IXpo7FIGagg
	TPbOxk13bYcpbrIC8RPxnjBJtTv/EQoBGBzsdAy2FXMkIS/W7hAQQKQ3YxHTEHvV72AOgrJc7njEb
	yrtYbOW0jxNW36mPKXXwiJwYwehmY9MSxR5rzhyGahWAo6SK2JiJ1GmL3kqPFatyAr/rea3ug1rjU
	9YdnAnucGbt/stzdzAiT9kba+dPE6QBh7ilvWOPcfGDyKLFk7QzrvHwSih3hvchTFkP3N3lMUZIMU
	OpLBzMzAbtO1vr4TRhjDAclM8E+49u/n5tUAmlwt0khJDxYk9vrKyCo/F3BpiOJ+0Pd4OkJjyNZd2
	uel7/MLg==;
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 19:34:35 -0500
Message-Id: <DLN4IBB6FV7K.WN3EVWC5FG17@trevorgross.com>
Cc: <linux-man@vger.kernel.org>, <libc-alpha@sourceware.org>
Subject: Re: async-signal-safety of chroot
From: "Trevor Gross" <tg@trevorgross.com>
To: <musl@lists.openwall.com>, <tg@trevorgross.com>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923013428.GT23438@brightrain.aerifal.cx>
In-Reply-To: <20260923013428.GT23438@brightrain.aerifal.cx>
X-Authenticated-Id: tg@trevorgross.com

On Tue Sep 22, 2026 at 8:34 PM CDT, Rich Felker wrote:
>
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
>
> Rich

A followup question: the usual wisdom has been that `fork` must always
be followed by an `exec`, and not doing so is somewhere between
error-prone and completely unsound. Based per the commit it sounds like
there are no more deadlocks, and without the POSIX AS-safe requirement,
the soundness question goes away. Does this mean that it is now
considered correct and reasonable code to `fork` without `exec` for the
purpose of e.g. invoking a function in a separate process? Similar to
what can be done with `clone`.

Of course that case may be better served by a way to re-`exec` the same
process for clean state without relying on the exact same hacks, but
that unfortunately doesn't exist.

- Trevor
