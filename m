Received: from mail-108-mta79.mxroute.com (mail-108-mta79.mxroute.com [136.175.108.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1912701D9
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 00:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125116; cv=none; b=FSKWyfr7Cvh6FCkoweAfhRvmodMopqRyGeZ/G8M4cVfiJi9vD35pl6hDz0JjE+5GuJpZR0zH5g2pdZpXyAPGrpTkenWpTYOHwGK3aSqXgm+827i7TY3nSidkTvPhObma27FIla52EniY47ufQ7Vx2hlLMWI3nUdWt39b6wm/aos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125116; c=relaxed/simple;
	bh=E4tWMi0X1lS7ZEKBZ1E5/9xMakzP3DiHyhFmYXqYKDc=;
	h=Mime-Version:Content-Type:Message-Id:Subject:To:From:Date; b=up5Iz7keconyVj8V88125DRGcE/n6k5I224dwBVBo/xU/vB6d8jBMMdFzIxq2c6slZWK6im4K3g6cOnjrW/K2JjdT1y0Wlrsq65my5Il5m/7XQWF6C6hl0a7G+3CwV0laYiH25rImCoVLwQOlmK1MNa88FE+reJXPw2Nns4D6Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=caF71KgG; arc=none smtp.client-ip=136.175.108.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="caF71KgG"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta79.mxroute.com (ZoneMTA) with ESMTPSA id 1a0cbc0cb9d00028b2.003
 for <linux-man@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 00:53:25 +0000
X-Zone-Loop: 77b5f1acf49619082b484ad7cbdeb74d126588ce90a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=Date:From:To:Subject:Message-Id:Content-Type:
	Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E4tWMi0X1lS7ZEKBZ1E5/9xMakzP3DiHyhFmYXqYKDc=; b=caF71KgG84E1wYI4pxrGaH1H1w
	vyRNvyS6etwkrJwiLX06A6rK02kq7XV1xdouz/Y9dxfRVR4lO/OFDgTCgSTZSktltkX5uWTwhKVup
	9a1RQd99yOQmziAd6U+D9KD+UI+EctcKccAhSl4X8WudQCagnGjUP90JK3qyiaO8VFPT0rO+92iGp
	uJazYJspl7P8bLOTd4wbFZ4496Rb+rVyKuXxshPs335j2i/NQAidWAg115UFZgBZAGkeGYQyekjfm
	zb4d+4r0mgdTYsHvhgu6Gt3f6aBLm/IeWENnF725NPg+Lr7nt9zpCL22F0JqPtHOCmeYlG6tw4xZT
	0RjmKv7A==;
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8; format=flowed
Message-Id: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
Subject: async-signal-safety of chroot
To: <linux-man@vger.kernel.org>, <musl@lists.openwall.com>,
 <libc-alpha@sourceware.org>
From: <tg@trevorgross.com>
Date: Wed, 23 Sep 2026 00:53:16 +0000
X-Authenticated-Id: tg@trevorgross.com

Hi everyone,

Is `chroot` async-signal-safe?

It is a somewhat popular pattern to `fork`, `chroot`, then `exec`.
However, only AS-safe functions may be called between `fork` and `exec`
(stated at [1]) but the manual entry for `chroot` makes no such mention
[2]. signal-safety(7) [3] only covers POSIX, so it is also not listed
there.

The rather old POSIX edition that last specified chroot also does not
mark it AS-safe [4], [5].

Is code using this pattern buggy, or is it just missing documentation?
I expect it's the latter but it would be nice to confirm either way.

Thanks,
Trevor

[1]: https://man7.org/linux/man-pages/man2/fork.2.html
[2]: https://man7.org/linux/man-pages/man2/chroot.2.html
[3]: https://man7.org/linux/man-pages/man7/signal-safety.7.html
[4]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/chroot.html
[5]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/sigaction.html
