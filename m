Received: from mail-108-mta91.mxroute.com (mail-108-mta91.mxroute.com [136.175.108.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F351F3BAC
	for <linux-man@vger.kernel.org>; Fri,  2 Oct 2026 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924145; cv=none; b=h67QYlOBH9Cg14Ennnm8exfCdVXWB4iYRiV6Foua1o7y/57gE8KSbYAKPlpn1IaZqORCLfI5iV21Be7+2ViFnobEb5qStKRUXY4YB08aY5FCW94Ag1os3nMZLDX5qFswg2lmm2jBDq0teC0s8sR81EnPI/+H9jMBNTd/KHxOGUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924145; c=relaxed/simple;
	bh=xAoDoh5yshly5t9OZsn8Ikn7etLdz8+T4EDxoRXvaQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XiQS4FbaKIYfjixIhGkSDm2wWe8mfoUJ/PSKk9Z/0VI+159S3RV1Rjd2aSL5/rFjAj9GCniLiPHPTBP5df/zhUIUIvjq4p0W/WagmZM8Eghuk/4jbfM0sNF75gVEB+aaaI7jUnjPzeK6ZovJPO1XUrsQpyOy3jfl/CncTlgc0cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=vF2HN+yk; arc=none smtp.client-ip=136.175.108.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="vF2HN+yk"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta91.mxroute.com (ZoneMTA) with ESMTPSA id 1a0fb60f59600028b2.006
 for <linux-man@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 06:50:30 +0000
X-Zone-Loop: dc8f779012c5f445b72f3d9d90b76a080823b7b072ba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ac7C9mCPJp62+xuelBeOrRC6khjVqeCtK9BkqC52qP8=; b=vF2HN+ykwpT/VF9crmJLd6LJmN
	2vFRtIuXeOPvp8sCgGs5xwNsTNLG1JF1UqAy1J3aaYBsg9BMFHvTjWaiXZg3YkZR+Ouk+T3qgRSER
	lxWQBYLGExa2O7UO4aIr33VdLyxrOrT/k0DPGtFMWkNBHWpB5g8hngUvQb6bCAViA1/EexlADWmLD
	BKmDx4Ua0vsYWAsaFHfCa6LGSqM9XoDHsgBAGh8nbRukbJTsk56+Z489EbmGpTyg700Sxu3otHYxk
	RBs+dtIfrBXsV0A14V+2PIxaU1gPBuqZw3/dXsrM9++gbOe2s8O15VL1i7vW3Ffj2Jy0g8rh0aONk
	pB2o6aRQ==;
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 01:50:22 -0500
Message-Id: <DLU5IDY7FCX4.OWYMCXDOF2R5@trevorgross.com>
Cc: "Trevor Gross" <tg@trevorgross.com>, "Alejandro Colomar"
 <alx@kernel.org>, <linux-man@vger.kernel.org>, <libc-alpha@sourceware.org>,
 <musl@lists.openwall.com>
Subject: Re: [musl] [PATCH 2/2] man/man2/fork.2: Document glibc and musl
 relaxed fork->exec AS requirements
From: "Trevor Gross" <tg@trevorgross.com>
To: "Florian Weimer" <fweimer@redhat.com>, "Rich Felker" <dalias@libc.org>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923233818.25289-3-tg@trevorgross.com>
 <20260923234714.GB23438@brightrain.aerifal.cx>
 <lhuqzihxg1d.fsf@oldenburg.str.redhat.com>
In-Reply-To: <lhuqzihxg1d.fsf@oldenburg.str.redhat.com>
X-Authenticated-Id: tg@trevorgross.com

On Fri Sep 25, 2026 at 2:54 PM CDT, Florian Weimer wrote:
> * Rich Felker:
>
>>> +On glibc and musl libc, this is relaxed;
>>> +it is safe to call non-async-signal-safe functions in the time between
>>> +.BR fork ()
>>> +and
>>> +.BR exec ()
>>> +\&.
>
>> While glibc has taken measures to make this mostly work, especially
>> malloc-after-fork, I don't think glibc has an intentional model for
>> ensuring that arbitrary libc functions work right in the child of a
>> multithreaded fork. Before accepting such a man page patch, we should
>> at least get an official position from glibc on whether they claim
>> this property or at least aim for it.
>
> Far from everything in glibc is fork-protected, so the statement is not
> true today as far as glibc is concerned.  We try to maintain
> compatibility with existing application requirements, but the precise
> goals have not been written down.

Would the following be more accurate?=20

    On glibc and musl libc, this is relaxed. With musl environments, it
    is safe to call non-async-signal-safe functions in the time between
    fork() and exec(). With glibc environments, some functions that are
    not AS-safe may be called between fork() and exec() may be safe to
    call; however, there is no exact list maintained.

Open to better wording as well, I'm not sure sure how best to express
the glibc case - if that's worth it at all.

Rich, is this reasonable to document for musl? It is a rather helpful
property even if not portable, but I'm not sure whether it is more of an
implementation detail for improved compatibility vs. something musl is
comfortable with users relying on.

- Trevor

