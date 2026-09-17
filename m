Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4544E676
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628747; cv=none; b=uKdTO3hMLGOKdq1BBfFCyeaA6UzH/ewDTGUcbvA4FYXk/TDiLBHQvzdGD/pxk9qGWtc0DhNTiDvWUajzzZSKHgJ7+PbTD2qJt7FE3zNqJz1vtCmy63qwOttwXzDzcHjh7IHHiLDI6sQd5n7NyJKmnOAOwW5ugJGrZTtKRVXIu9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628747; c=relaxed/simple;
	bh=Tqpq+jL63DUzjCLWpkQ4jomVVp84en2Xdm8YucgBjaY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=r5fqaC0FCQHzUGRQeU2hTv2Mcgxnh01s8kMP/15hWOPJTMGVii2ZA6ixbkzwlSk7QlufccTi1ZoQioRf5fJzyboxQbDxeDFpDv7pbIHo7Rq0TuVH1SCClJRnG8SEkCuT56tUQ7oYxcnxvXdaU2uA1/VAr2FVByAq2k2i6sUGqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=Ft9Str7b; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="Ft9Str7b"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789628739; bh=Tqpq+jL63DUzjCLWpkQ4jomVVp84en2Xdm8YucgBjaY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ft9Str7bs3GvEbq5uvNgHbWmigw2/kurl+pRxsscgJB1vTzApjIVAat5kf7Qmpi84
	 1C9q82Qa+OeSIbnNGCvE+3YFdw8W3xHeaHnhKkBtSsufJcchr9Dz3cCLcMCK4I7gt3
	 GEVO4+BnjNoeNrvbP9OAmbXNHRzjPsQtqmc1RqCuxR4UgyPFNrVo42i8sGRoYl6Ps4
	 sMiaA+5rY6YA9NEBOKO8UZoEAedIIWWN6i+9odV5a2hImcfpc6KYIbY7WaeWlEiVmM
	 7eahjhaSk0CLLIoaAuHdhtw3WK9Ils7j15lD0E7tIA4foflj+LRzG81XCf4rzrDsR/
	 SY8CIbfAXr0+w==
Date: Thu, 17 Sep 2026 07:05:22 +0000
Message-Id: <DLHEFPP585QA.3O4UBO4CFHWD7@memeware.net>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: Re: Markdown as a "less hairy" source format for man pages
From: "astian" <astian@memeware.net>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>, "Alejandro
 Colomar" <alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan> <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan> <20260915153913.gn4lupmyydvtehnw@illithid>
In-Reply-To: <20260915153913.gn4lupmyydvtehnw@illithid>

On 15 Sep 2026 10:39 -0500, G. Branden Robinson wrote:
[...]
> Not long ago I diagnosed our industry's collective, and persistent,
> refusal to believe that writing worthwhile documentation could ever be a
> more demanding task than the simplest computer program one can code.
>
> https://lore.kernel.org/linux-man/20260710195854.ud4riftmhrfzu54d@illithi=
d/

Interesting recap, specially the history of man/mdoc/mandoc/groff.  Thanks.
