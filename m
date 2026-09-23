Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D07E28B4FA
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.156.224.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138488; cv=none; b=gV4MAty+W1k8QhxxROwni89bhMKfQDuvEzXz+ZmtRjuVjHQsIy6O5QlMSG54R3VA07DrwFRAg2/ob+9ro5iH28SdEf2dMegXSN4XeW663fjceWhiRxu5Bj9DgFADbkM548Pt0WyxN1lB2zNMsrRN1U83JnyD/M/cviwHRek0Tv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138488; c=relaxed/simple;
	bh=Jih+1fVHYtDX1hJn1p/0V5BfbpSehbScH3wmlCI0SJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB0tl2mcfloBi9jA3ZfBYUYinnYEtTmXKtV61/6dnvtPhLGV0oDgKeR676yHUWhAq+qMKDWOUVqQeeOMGg2D428ZrCubNqga2dA369fYkK/bYe7vkdqD8nLVo790d+0cViCtoLrqRYRsVt7LXxKMNrT4cLIGd/Nhw+Ctx30RIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org; spf=pass smtp.mailfrom=aerifal.cx; arc=none smtp.client-ip=104.156.224.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Wed, 23 Sep 2026 00:40:48 -0400
From: Rich Felker <dalias@libc.org>
To: John Scott <jscott@posteo.net>
Cc: musl@lists.openwall.com, tg@trevorgross.com, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org
Subject: Re: [musl] Re: async-signal-safety of chroot
Message-ID: <20260923044048.GU23438@brightrain.aerifal.cx>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923013428.GT23438@brightrain.aerifal.cx>
 <5db76d666377410fc105b9d527cbcd9f9ef3b332.camel@posteo.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db76d666377410fc105b9d527cbcd9f9ef3b332.camel@posteo.net>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Wed, Sep 23, 2026 at 04:17:03AM +0000, John Scott wrote:
> On Tue, 2026-09-22 at 21:34 -0400, Rich Felker wrote:
> > Since it's no longer standard, there is no standard governing chroot,
> 
> On this claim only, I believe you're technically mistaken: ISO/IEC
> 23360-1-2:2021 (Linux Standard Base: Core specification generic
> part) is a current International Standard. It incorporates the
> definition of chroot() from SUSv2 by reference without amendment, so
> the same async-signal-safety limitations apply.

Linux Standard Base is not relevant. It is not a standard musl aims to
conform to, and it is largely an ad hoc third party description of a
very old version of the glibc ABI and its integration into Red Hat
Linux.

