Received: from esgaroth.petrovitsch.at (esgaroth.petrovitsch.at [78.47.184.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152FD1ADC83
	for <linux-man@vger.kernel.org>; Sat, 15 Aug 2026 22:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.184.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831970; cv=none; b=MQU6FyoCSnTSa/gDb4codS9a4Jqe19ezGC+i6USBVQPi35irQ8kj7jBP5ab8CHnlgzStAXd8XsCLYvKaLmE3gBwUyELPlb1RLLxmaAxPurOZyqrpRsN+ISXNo+mMETKwCTOhz6w6xCnjrYSIyvefSgJgEgniVGfg9uzDKJ65m/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831970; c=relaxed/simple;
	bh=eFhkIaEdxXcNyIW4q4mR3O0PbbyOllTvNM3HMpqiAys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEk/kQMyLhr5LT3+ue45npv6It9hFEX79Qez9e6XSSyDBOgS1DRqGt4W1g7diFx2yZr/c14X6yG92qOs1ta+RuvHwWPcLeHYyO71TM6251NATDQxFnOL2axCe6UNxrdDszrKrHTXPzsOdnozkU/RQQDJS1VHrL3aZIMdlGm+axA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxoid.at; spf=pass smtp.mailfrom=tuxoid.at; dkim=pass (1024-bit key) header.d=tuxoid.at header.i=@tuxoid.at header.b=AxIbE+aa; arc=none smtp.client-ip=78.47.184.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxoid.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxoid.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxoid.at header.i=@tuxoid.at header.b="AxIbE+aa"
Received: from [172.16.0.14] (84-115-209-231.cable.dynamic.surfer.at [84.115.209.231])
	(authenticated bits=0)
	by esgaroth.petrovitsch.at (8.18.2/8.18.2) with ESMTPSA id 67FMBiEX3572436
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Sun, 16 Aug 2026 00:11:46 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 esgaroth.petrovitsch.at 67FMBiEX3572436
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxoid.at; s=default;
	t=1786831914; bh=eFhkIaEdxXcNyIW4q4mR3O0PbbyOllTvNM3HMpqiAys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AxIbE+aafiX6lGMY+1suWqaa16ypriUKmmb+CjV8OnfZZPzFhjiFKNlxa4XRJsLvv
	 zAJOJ1IrAKnGRPM6OZY7TP9uD3xntvo1tmgwKc2CXp6Dl2HH34qXCHU2Gqn448snlj
	 eaP/t0ZBZNbDLxHrMD9374FEyOlecl7lqy9uMGpQ=
Message-ID: <8b580444-64a8-4c08-9ea5-d0303931f503@tuxoid.at>
Date: Sun, 16 Aug 2026 00:11:42 +0200
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: the Linux man-pages as an educational tool
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
        =?UTF-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>,
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
 <11bb78f1-09d3-4e90-a4ab-1de76db086e1@tuxoid.at>
 <alpine.DEB.2.21.2608151339430.14132@angie.orcam.me.uk>
From: Bernd Petrovitsch <bernd@tuxoid.at>
Content-Language: en-US, de-AT
BIMI-Selector: v=BIMI1; s=default
In-Reply-To: <alpine.DEB.2.21.2608151339430.14132@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 1.4.5 at smtp.tuxoid.at
X-Virus-Status: Clean
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]

Hi! all!

On 2026-08-15 15:03:14, Maciej W. Rozycki wrote:
> On Fri, 14 Aug 2026, Bernd Petrovitsch wrote:
[...]
>>>> Then why not have one official big header file for the whole standard?
>>>>
>>>> #include <stdlibc.h>
>>>
>>>    That wouldn't be too unreasonable nowadays I suppose, not IMHO anyway.
>>
>> The trivial counter example is windows.h (since ages). And at one point
>> "they" introduced the #define WIN32_LEAN_AND_MEAN (probably) for a
>> reason ...
> 
>   I'm not sure what you refer to, is that Microsoft Windows?  How would it

Yes.

> be relevant to *nix libc?

Because M$FT choose the "you need only one #include for all header files"
strategy and implicitly admitted that it was not the best idea ....

>   Back in 1970s-80s when the C language standard was being shaped computers
> had memories in the range of kilobytes and storage was often floppy disks
> with all the performance implications, plus computing power in the low MHz

Above was more in the late 1980ies/1990ies with harddisks ...

> range.  Nowadays we have memory amounts in the high range of gigabytes to
> terabytes and storage that has throughput of gigabytes per second, and
> computing power many orders of magnitude better if you factor in not only
> the clock rate increase, but all the contemporary architectural features
> as well.  How could it not matter for the speed of header compilation?
And we may have "pre-compiled header files" though I never found (or more
stumbled upon) a serious page on "how to use them correctly and
efficiently" (though I'm not looking for that often).

LG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
      There is NO CLOUD, just other people's computers. - FSFE
mobile: +43 664 4416156                    LUGA : http://www.luga.at
