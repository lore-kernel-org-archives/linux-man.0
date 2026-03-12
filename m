Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4D3AF675
	for <linux-man@vger.kernel.org>; Thu, 12 Mar 2026 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307640; cv=none; b=Y3J4fptJJRdYJUikaFdSmI5eUA2mSZp/oG0NMOgFeTJsd3WPF2qM2GNrcnQ7EyOk8b2YG16pzYy4i3WiO/o2zi3pLhFTIaem+ggdzdjv/LenEz92AKGGdhdehpxeMz7dgKofySVUBS6Lblor6n4eW6/hZp5dSD6olium1u9yV8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307640; c=relaxed/simple;
	bh=G9KcYgAehPhGdZAkBFAeDDWerPnapkpQXK/yO5/DV14=;
	h=From:Subject:To:Content-Type:MIME-Version:Date:
	 Content-Disposition:Message-Id; b=MYY2AAEo10M0x0r5ROuEZ1o6o6hM+XTIdsJypBadAA4UWaaLHGGDPJBoYFTGL4r14JKyBXBxiwxHhXllCgHIOU2DkVXBI9EEWkG2scUc3MYgQQybJQrzy7ZuMZG7pbgCjQezok3iZ3pb/CjlFreXgxRIrxXxTFCjsLEr/R6qZV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Dtp6UsNY; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Dtp6UsNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:To:Content-Type:MIME-Version:Reply-To:
	Date:Message-Id; bh=G9KcYgAehPhGdZAkBFAeDDWerPnapkpQXK/yO5/DV14=;
	b=Dtp6UsNYb1m9lXeA59Wfib5E4rzFAGk1ptyHyCMKWD+4nMtDDjx/208JFxOpji
	IL0DCLmcr5Ln8emNfuW74WQsLHjBqculpcU2XS/xhjFx4M4jf5q92IWIoeL6Jtpf
	dDPUIxS2Cq3UXHUyzQQAcfT1HejuWpbMwqbGtd/WHqrbQ=
Received: from DESKTOP-KC80OSP (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHzOfwhrJpi2A0Ag--.60685S2;
	Thu, 12 Mar 2026 17:27:13 +0800 (CST)
From: "Layda" <laydaxiao@163.com>
Subject: Re: water machines solutions/Phigreat
To: linux-man@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Reply-To: laydaxiao@163.com
Date: Thu, 12 Mar 2026 17:27:10 +0800
X-Priority: 3
X-MSMail-Priority: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Content-Disposition: inline
X-CM-TRANSID:_____wBHzOfwhrJpi2A0Ag--.60685S2
Message-Id:<69B286F1.02DF50.00001@m16.mail.163.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRdrcTUUUUU
X-CM-SenderInfo: xod1vtp0ld0qqrwthudrp/xtbC3BHkX2myhvGKxQAA3V

SGVsbG8hIA0KUmVsaWFibGUgQ2hpbmEga2l0Y2hlbiB3YXRlciBlcXVpcG1lbnQgc3VwcGxpZXIg
c2luY2UgMjAxMywgcHJvdmlkaW5nIEIyQiBPRU0mT0RNLiANCk91ciBDRS9XUkFTL1VML1JPSFMg
Y2VydGlmaWVkIHByb2R1Y3RzIGFyZSBleHBvcnRlZCBnbG9iYWxseSwgaW5jbHVkaW5nIHdhdGVy
IG1hY2hpbmVzLCBwdXJpZmllcnMgYW5kIGN1c3RvbWl6YWJsZSBtZWNoYW5pY2FsL2VsZWN0cmlj
IG11bHRpLWZ1bmN0aW9uYWwgZmF1Y2V0cyAodHJlbmR5ICYgaG90LXNlbGxpbmcpLiANCknigJlt
IExheWRhLCAwMDg2IDE1Mzk2Mjc1MDkzLiBCcm93c2Ugd3d3LnBoaWdyZWF0LmNvbS4gDQpMb29r
aW5nIGZvcndhcmQgdG8geW91ciBjb250YWN0IGFuZCBmcmllbmRseSBwaG9uZSBjaGF0LiANClNp
bmNlcmVseS4NCkxheWRhIA0K

