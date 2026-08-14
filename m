Received: from esgaroth.petrovitsch.at (esgaroth.petrovitsch.at [78.47.184.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E99265623
	for <linux-man@vger.kernel.org>; Fri, 14 Aug 2026 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.184.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786745918; cv=none; b=FYqx/Xkq5tpC2btUIX9BLiZGDd1azEPyA8VRTKzCCdC8QGwJva8zWDOHbUaMlWl5Tpx99gHGuK+9hfRSZIpqFmycZ6HWoLSkf11XYezUd63mRdqZ3zQsz14EgpKwy01tsBVa36L4izK3HiakBXc1uQYpbj4BxJo83e7cWO3WRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786745918; c=relaxed/simple;
	bh=HceEDNrjRZgcrFS/6S/MsOILXKCMlhB2at8fw/XSw/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjdtrCsHxFvtGkc1SYvpisswYLDEqtAnu+yi8arEuXzCqMZJtH8kejB1ni88Zp9Y1ynLof2/nnbo0A6SUVrNEI5pffJJoidZlFPq8qLx808DJJfoFzLjor6zO9KhlfOy4r91JRhfpFShUnlJcWQn90Enbg2h13l0j3WMJ7LILqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxoid.at; spf=pass smtp.mailfrom=tuxoid.at; dkim=pass (1024-bit key) header.d=tuxoid.at header.i=@tuxoid.at header.b=MZkHuZJ3; arc=none smtp.client-ip=78.47.184.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxoid.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxoid.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxoid.at header.i=@tuxoid.at header.b="MZkHuZJ3"
Received: from [172.16.0.14] (84-115-209-231.cable.dynamic.surfer.at [84.115.209.231])
	(authenticated bits=0)
	by esgaroth.petrovitsch.at (8.18.2/8.18.2) with ESMTPSA id 67ELvS1p3427427
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Fri, 14 Aug 2026 23:57:31 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 esgaroth.petrovitsch.at 67ELvS1p3427427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxoid.at; s=default;
	t=1786744659; bh=HceEDNrjRZgcrFS/6S/MsOILXKCMlhB2at8fw/XSw/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MZkHuZJ3xxgAjkSzFaiuQBxD4thzHAcXQqM3TBz5DomIpD+Y4CDxuE2dZm4TKEKgl
	 KpYn8LiaFan86fVJ7mwqF95WKtpq/+iXOKdixoI69bEiUpZwGVB+mEJu1PLsSz4MFE
	 KQ+pX+mUymNWpD/Fmn8lKLK8hmm7UVY1v6A32clY=
Message-ID: <11bb78f1-09d3-4e90-a4ab-1de76db086e1@tuxoid.at>
Date: Fri, 14 Aug 2026 23:57:22 +0200
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: the Linux man-pages as an educational tool
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: =?UTF-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>,
        Alejandro Colomar <alx@kernel.org>,
        Collin Funk <collin.funk1@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>,
        linux-man@vger.kernel.org, bug-gnulib@gnu.org,
        libc-alpha@sourceware.org
References: <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu> <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <alpine.DEB.2.21.2608140556070.14132@angie.orcam.me.uk>
From: Bernd Petrovitsch <bernd@tuxoid.at>
Content-Language: en-US, de-AT
BIMI-Selector: v=BIMI1; s=default
In-Reply-To: <alpine.DEB.2.21.2608140556070.14132@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 1.4.5 at smtp.tuxoid.at
X-Virus-Status: Clean
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]

Hi all!

On 2026-08-14 17:30:17, Maciej W. Rozycki wrote:
[...]
>> Then why not have one official big header file for the whole standard?
>>
>> #include <stdlibc.h>
> 
>   That wouldn't be too unreasonable nowadays I suppose, not IMHO anyway.

The trivial counter example is windows.h (since ages). And at one point
"they" introduced the #define WIN32_LEAN_AND_MEAN (probably) for a
reason ...

[...]

Kind regards,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
      There is NO CLOUD, just other people's computers. - FSFE
mobile: +43 664 4416156                    LUGA : http://www.luga.at

